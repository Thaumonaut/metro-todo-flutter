import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';
import '../models/todo_task.dart';
import '../models/notification_type.dart';
import '../../core/utils/global_keys.dart';
import '../../features/tasks/presentation/pages/persistent_reminder_page.dart';

/// Service for managing local notifications
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  late WindowsNotification _windowsNotification;
  bool _isInitialized = false;

  /// Notification channel IDs
  static const String _dueTodayChannelId = 'due_today';
  static const String _overdueChannelId = 'overdue';
  static const String _upcomingChannelId = 'upcoming';
  static const String _reminderChannelId = 'reminder';

  /// Initialize the notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Initialize timezone
      tz_data.initializeTimeZones();

      // Initialize Windows notifications if on Windows
      if (Platform.isWindows) {
        try {
          // Create Windows notification instance
          // Note: applicationId must be a valid Windows app ID or GUID
          _windowsNotification = WindowsNotification(
            applicationId: 'com.example.todo_project',
          );
          debugPrint('Windows notifications initialized');
        } catch (e) {
          debugPrint('Error initializing Windows notifications: $e');
        }
      }

      // Android initialization settings
      const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

      // Linux initialization settings
      final linuxSettings = LinuxInitializationSettings(
        defaultActionName: 'Open',
      );

      // iOS initialization settings
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );

      final initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
        linux: linuxSettings,
        // Windows doesn't support flutter_local_notifications
        // We use windows_notification package instead
      );

      await _notifications.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _onNotificationTap,
      );

      _isInitialized = true;
    } catch (e) {
      debugPrint('Error initializing notification service: $e');
      // Don't fail completely - just mark as attempted
      _isInitialized = true;
    }
  }

  /// Handle notification tap
  void _onNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    final actionId = response.actionId;

    if (payload == null) return;

    debugPrint('🔔 Notification tapped - Payload: $payload, Action: $actionId');

    // Parse payload format: "task:taskId:type" or legacy "taskId"
    int? taskId;
    String? notificationType;

    if (payload.startsWith('task:')) {
      final parts = payload.split(':');
      if (parts.length >= 3) {
        taskId = int.tryParse(parts[1]);
        notificationType = parts[2]; // "basic" or "persistent"
      }
    } else {
      // Legacy format - just taskId
      taskId = int.tryParse(payload);
    }

    if (taskId == null) {
      debugPrint('❌ Invalid task ID in payload');
      return;
    }

    // Handle notification actions
    if (actionId == 'snooze') {
      _handleSnooze(taskId);
      return;
    } else if (actionId == 'dismiss') {
      _handleDismiss(taskId);
      return;
    } else if (actionId == 'complete') {
      _handleComplete(taskId);
      return;
    } else if (actionId == 'open' || notificationType == 'persistent') {
      // Open persistent reminder page for persistent notifications
      _navigateToPersistentReminder(taskId);
      return;
    }

    // Default: navigate to task detail or home
    debugPrint('Regular notification tap for task $taskId');
  }

  /// Navigate to persistent reminder page
  void _navigateToPersistentReminder(int taskId) {
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint('❌ No navigation context available');
      return;
    }

    debugPrint('🚨 Opening persistent reminder page for task $taskId');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersistentReminderPage(taskId: taskId),
        fullscreenDialog: true,
      ),
    );
  }

  /// Handle complete action from notification
  void _handleComplete(int taskId) {
    debugPrint('✅ Marking task $taskId as complete from notification');
    // Cancel the notification
    _notifications.cancel(taskId);
    // Note: Actual task completion should be handled by the app
    // This just dismisses the notification
  }

  /// Handle snooze action - reschedule notification for 10 minutes later
  Future<void> _handleSnooze(int taskId) async {
    // Cancel current notification
    await _notifications.cancel(taskId);

    // Show snooze confirmation
    await _notifications.show(
      taskId + 500000, // Temporary ID
      'Snoozed',
      'Reminder snoozed for 10 minutes',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'snooze',
          'Snooze Confirmations',
          channelDescription: 'Confirms when tasks are snoozed',
          importance: Importance.low,
          priority: Priority.low,
        ),
      ),
    );

    // Reschedule for 10 minutes later
    final snoozeTime = DateTime.now().add(const Duration(minutes: 10));
    await _notifications.zonedSchedule(
      taskId,
      'Task Reminder (Snoozed)',
      'Your snoozed task is due now',
      tz.TZDateTime.from(snoozeTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder',
          'Reminders',
          channelDescription: 'Task reminder notifications',
          importance: Importance.max,
          priority: Priority.max,
          ongoing: true,
          autoCancel: false,
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction(
              'dismiss',
              'Dismiss',
              showsUserInterface: true,
            ),
            AndroidNotificationAction(
              'snooze',
              'Snooze 10 min',
              showsUserInterface: false,
            ),
          ],
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: taskId.toString(),
    );
  }

  /// Handle dismiss action
  Future<void> _handleDismiss(int taskId) async {
    await _notifications.cancel(taskId);
  }

  /// Request notification permissions
  Future<bool> requestPermissions() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// Check if exact alarms can be scheduled (Android 12+)
  Future<bool> canScheduleExactAlarms() async {
    if (!Platform.isAndroid) return true;

    try {
      final status = await Permission.scheduleExactAlarm.status;
      return status.isGranted;
    } catch (e) {
      debugPrint('Error checking exact alarm permission: $e');
      return false;
    }
  }

  /// Request exact alarm permission (Android 12+)
  /// Note: This will open system settings on Android 13+ where user must manually enable it
  Future<bool> requestExactAlarmPermission() async {
    if (!Platform.isAndroid) return true;

    try {
      final status = await Permission.scheduleExactAlarm.request();
      return status.isGranted;
    } catch (e) {
      debugPrint('Error requesting exact alarm permission: $e');
      return false;
    }
  }
  /// Check if notifications are supported on this platform
  bool areNotificationsSupported() {
    return Platform.isAndroid || Platform.isIOS || Platform.isLinux;
  }

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled() async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  /// Schedule a notification for a task's due date
  Future<void> scheduleDueTodayNotification(TodoTask task) async {
    debugPrint('🔔 [NOTIFICATION SERVICE] scheduleDueTodayNotification called for task "${task.title}"');

    if (!_isInitialized) {
      debugPrint('   ❌ Service not initialized');
      return;
    }

    if (task.dueDate == null) {
      debugPrint('   ❌ No due date set');
      return;
    }

    final now = DateTime.now();
    final dueDate = task.dueDate!;

    // Don't schedule if already past
    if (dueDate.isBefore(now)) {
      debugPrint('   ❌ Due date is in the past: $dueDate');
      return;
    }

    // Check if we can schedule exact alarms on Android
    final canScheduleExact = await canScheduleExactAlarms();
    debugPrint('   Can schedule exact alarms: $canScheduleExact');

    if (!canScheduleExact && Platform.isAndroid) {
      debugPrint('   ❌ Cannot schedule exact alarm - permission not granted');
      return;
    }

    // If dueDate has specific time, use it; otherwise schedule for 9 AM
    DateTime notificationTime;
    if (dueDate.hour != 0 || dueDate.minute != 0) {
      // Due date has a specific time - use it exactly
      notificationTime = dueDate;
      debugPrint('   Using specific time: $notificationTime');
    } else {
      // Due date is just a date - schedule for 9 AM
      notificationTime = DateTime(dueDate.year, dueDate.month, dueDate.day, 9, 0);
      debugPrint('   Scheduled for 9 AM: $notificationTime');
    }

    // Ensure notification is in the future
    if (notificationTime.isBefore(now)) {
      notificationTime = now.add(const Duration(minutes: 1));
      debugPrint('   Adjusted to future time: $notificationTime');
    }

    final isSameDay = _isSameDay(dueDate, now);
    final title = isSameDay ? 'Task Due Today' : 'Task Due';

    debugPrint('   ✅ Scheduling notification for: $notificationTime');

    await _notifications.zonedSchedule(
      task.id,
      title,
      task.title,
      tz.TZDateTime.from(notificationTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _dueTodayChannelId,
          'Due Tasks',
          channelDescription: 'Notifications for task due dates',
          importance: Importance.max,
          priority: Priority.max,
          ongoing: true, // Makes notification persistent
          autoCancel: false, // Requires user action to dismiss
          actions: <AndroidNotificationAction>[
            const AndroidNotificationAction(
              'dismiss',
              'Dismiss',
              showsUserInterface: true,
            ),
            const AndroidNotificationAction(
              'snooze',
              'Snooze 10 min',
              showsUserInterface: false,
            ),
          ],
        ),
        linux: const LinuxNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: task.id.toString(),
    );

    debugPrint('   ✅ Notification scheduled successfully!');
  }
  
  /// Schedule a specific reminder notification at a given time
  Future<void> scheduleSpecificReminder(TodoTask task, DateTime scheduledAt) async {
    if (!_isInitialized) return;

    // Don't schedule if in the past
    if (scheduledAt.isBefore(DateTime.now())) return;

    // Check if we can schedule exact alarms on Android
    final canScheduleExact = await canScheduleExactAlarms();
    if (!canScheduleExact && Platform.isAndroid) {
      debugPrint('Cannot schedule exact alarm - permission not granted');
      return;
    }

    await _notifications.zonedSchedule(
      task.id + 400000 + scheduledAt.hashCode % 100000, // Unique ID for each reminder
      'Task Reminder',
      task.title,
      tz.TZDateTime.from(scheduledAt, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _reminderChannelId,
          'Reminders',
          channelDescription: 'Task reminder notifications',
          importance: Importance.max,
          priority: Priority.max,
          ongoing: true,
          autoCancel: false,
          actions: <AndroidNotificationAction>[
            const AndroidNotificationAction(
              'dismiss',
              'Dismiss',
              showsUserInterface: true,
            ),
            const AndroidNotificationAction(
              'snooze',
              'Snooze 10 min',
              showsUserInterface: false,
            ),
          ],
        ),
        linux: const LinuxNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: task.id.toString(),
    );
  }

  /// Schedule a notification with specified type (basic or persistent)
  Future<void> scheduleNotificationWithType({
    required TodoTask task,
    required DateTime scheduledAt,
    required NotificationType type,
    String? title,
    String? body,
  }) async {
    if (!_isInitialized) return;

    // Don't schedule if in the past
    if (scheduledAt.isBefore(DateTime.now())) {
      debugPrint('⚠️ Cannot schedule notification in the past: $scheduledAt');
      return;
    }

    // Check if we can schedule exact alarms on Android
    final canScheduleExact = await canScheduleExactAlarms();
    if (!canScheduleExact && Platform.isAndroid) {
      debugPrint('❌ Cannot schedule exact alarm - permission not granted');
      return;
    }

    final notificationTitle = title ?? 'Task Reminder';
    final notificationBody = body ?? task.title;

    switch (type) {
      case NotificationType.basic:
        await _scheduleBasicNotification(
          task: task,
          scheduledAt: scheduledAt,
          title: notificationTitle,
          body: notificationBody,
        );
        break;
      case NotificationType.persistent:
        await _schedulePersistentNotification(
          task: task,
          scheduledAt: scheduledAt,
          title: notificationTitle,
          body: notificationBody,
        );
        break;
    }
  }

  /// Schedule a basic (dismissible) notification
  Future<void> _scheduleBasicNotification({
    required TodoTask task,
    required DateTime scheduledAt,
    required String title,
    required String body,
  }) async {
    debugPrint('📱 Scheduling BASIC notification for ${task.title} at $scheduledAt');

    await _notifications.zonedSchedule(
      task.id + 400000 + scheduledAt.hashCode % 100000,
      title,
      body,
      tz.TZDateTime.from(scheduledAt, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _reminderChannelId,
          'Reminders',
          channelDescription: 'Task reminder notifications',
          importance: Importance.high,
          priority: Priority.high,
          // Basic notification - can be swiped away
          ongoing: false,
          autoCancel: true,
          actions: <AndroidNotificationAction>[
            const AndroidNotificationAction(
              'complete',
              'Complete',
              showsUserInterface: true,
            ),
            const AndroidNotificationAction(
              'snooze',
              'Snooze',
              showsUserInterface: false,
            ),
          ],
        ),
        linux: const LinuxNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'task:${task.id}:basic',
    );
  }

  /// Schedule a persistent (alarm-style) notification with full-screen intent
  Future<void> _schedulePersistentNotification({
    required TodoTask task,
    required DateTime scheduledAt,
    required String title,
    required String body,
  }) async {
    debugPrint('🚨 Scheduling PERSISTENT notification for ${task.title} at $scheduledAt');

    await _notifications.zonedSchedule(
      task.id + 400000 + scheduledAt.hashCode % 100000,
      title,
      body,
      tz.TZDateTime.from(scheduledAt, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _reminderChannelId,
          'Persistent Alarms',
          channelDescription: 'Alarm-style notifications that require action',
          importance: Importance.max,
          priority: Priority.max,
          // Persistent notification - cannot be swiped away easily
          ongoing: true,
          autoCancel: false,
          // Full screen intent - opens app even when locked
          fullScreenIntent: true,
          category: AndroidNotificationCategory.alarm,
          visibility: NotificationVisibility.public,
          // Alarm sound and vibration
          playSound: true,
          // Use default notification sound (custom sounds require audio files in res/raw)
          enableVibration: true,
          vibrationPattern: Int64List.fromList([0, 1000, 500, 1000]),
          actions: <AndroidNotificationAction>[
            const AndroidNotificationAction(
              'open',
              'Open',
              showsUserInterface: true,
            ),
          ],
        ),
        linux: const LinuxNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'task:${task.id}:persistent',
    );
  }

  /// Schedule a reminder notification before due date
  Future<void> scheduleReminderNotification(
    TodoTask task, {
    Duration beforeDue = const Duration(hours: 1),
  }) async {
    if (!_isInitialized || task.dueDate == null) return;

    final reminderTime = task.dueDate!.subtract(beforeDue);
    if (reminderTime.isBefore(DateTime.now())) return;

    // Check if we can schedule exact alarms on Android
    final canScheduleExact = await canScheduleExactAlarms();
    if (!canScheduleExact && Platform.isAndroid) {
      debugPrint('Cannot schedule exact alarm - permission not granted');
      return;
    }

    await _notifications.zonedSchedule(
      task.id + 100000, // Offset ID to avoid conflicts
      'Upcoming Task',
      '${task.title} is due in ${_formatDuration(beforeDue)}',
      tz.TZDateTime.from(reminderTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _reminderChannelId,
          'Reminders',
          channelDescription: 'Task reminder notifications',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        linux: const LinuxNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: task.id.toString(),
    );
  }

  /// Show an immediate notification for overdue tasks
  Future<void> showOverdueNotification(TodoTask task) async {
    if (!_isInitialized) return;

    await _notifications.show(
      task.id + 200000, // Offset ID to avoid conflicts
      'Overdue Task',
      '${task.title} is overdue!',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _overdueChannelId,
          'Overdue Tasks',
          channelDescription: 'Notifications for overdue tasks',
          importance: Importance.max,
          priority: Priority.max,
        ),
        linux: LinuxNotificationDetails(),
      ),
      payload: task.id.toString(),
    );
  }

  /// Show notification for upcoming tasks (next 24 hours)
  Future<void> showUpcomingNotification(TodoTask task) async {
    if (!_isInitialized || task.dueDate == null) return;

    final hoursUntilDue = task.dueDate!.difference(DateTime.now()).inHours;

    await _notifications.show(
      task.id + 300000,
      'Upcoming Task',
      '${task.title} is due in $hoursUntilDue hours',
      NotificationDetails(
        android: AndroidNotificationDetails(
          _upcomingChannelId,
          'Upcoming Tasks',
          channelDescription: 'Notifications for upcoming tasks',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        linux: const LinuxNotificationDetails(),
      ),
      payload: task.id.toString(),
    );
  }

  /// Cancel a notification for a specific task
  Future<void> cancelTaskNotification(int taskId) async {
    await _notifications.cancel(taskId);
    await _notifications.cancel(taskId + 100000); // Reminder
    await _notifications.cancel(taskId + 200000); // Overdue
    await _notifications.cancel(taskId + 300000); // Upcoming
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// Cancel test notifications
  Future<void> cancelTestNotifications() async {
    await _notifications.cancel(999999); // Immediate test
    await _notifications.cancel(999998); // 30 second test
    await _notifications.cancel(999997); // 5 second test
    debugPrint('🧹 Cleared test notifications');
  }

  /// Show a test notification (for testing purposes)
  Future<void> showTestNotification() async {
    debugPrint('🔔 [TEST] Showing test notification');
    debugPrint('   Initialized: $_isInitialized');
    debugPrint('   Current time: ${DateTime.now()}');
    debugPrint('   Timezone: ${tz.local}');

    if (!_isInitialized) {
      throw Exception('Notification service not initialized. Try again after a moment.');
    }

    // Check permissions first
    final canScheduleExact = await canScheduleExactAlarms();
    debugPrint('   Can schedule exact alarms: $canScheduleExact');

    try {
      if (Platform.isWindows) {
        // Use Windows notification API with proper NotificationMessage
        final message = NotificationMessage.fromPluginTemplate(
          'test_notification',
          'Test Notification',
          'This is a test notification from Metro Todo',
        );
        _windowsNotification.showNotificationPluginTemplate(message);
      } else if (areNotificationsSupported()) {
        debugPrint('   Showing immediate test notification...');
        // Use flutter_local_notifications for other platforms
        await _notifications.show(
          999999,
          'Test Notification',
          'If you see this, notifications are working! ✅',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'test',
              'Test Notifications',
              channelDescription: 'Test notification channel',
              importance: Importance.high,
              priority: Priority.high,
            ),
            linux: LinuxNotificationDetails(),
          ),
        );
        debugPrint('   ✅ Test notification shown!');

        // Also schedule one for 5 seconds AND 30 seconds from now
        if (canScheduleExact) {
          // 5 second test
          debugPrint('   Scheduling test notification for 5 seconds from now...');
          final scheduleTime5 = DateTime.now().add(const Duration(seconds: 5));
          final tzScheduleTime5 = tz.TZDateTime.from(scheduleTime5, tz.local);
          debugPrint('   Schedule time (5s): $scheduleTime5');
          debugPrint('   TZ Schedule time (5s): $tzScheduleTime5');

          await _notifications.zonedSchedule(
            999997,
            'Scheduled Test (5s)',
            'This was scheduled 5 seconds ago! ⏰',
            tzScheduleTime5,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'test',
                'Test Notifications',
                channelDescription: 'Test notification channel',
                importance: Importance.max,
                priority: Priority.max,
                // Make test notifications dismissible
                ongoing: false,
                autoCancel: true,
              ),
            ),
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
          );
          debugPrint('   ✅ Scheduled 5-second test notification!');

          // 30 second test
          debugPrint('   Scheduling test notification for 30 seconds from now...');
          final scheduleTime30 = DateTime.now().add(const Duration(seconds: 30));
          final tzScheduleTime30 = tz.TZDateTime.from(scheduleTime30, tz.local);
          debugPrint('   Schedule time (30s): $scheduleTime30');
          debugPrint('   TZ Schedule time (30s): $tzScheduleTime30');

          await _notifications.zonedSchedule(
            999998,
            'Scheduled Test (30s)',
            'This was scheduled 30 seconds ago! ⏰',
            tzScheduleTime30,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'test',
                'Test Notifications',
                channelDescription: 'Test notification channel',
                importance: Importance.max,
                priority: Priority.max,
                // Make test notifications dismissible
                ongoing: false,
                autoCancel: true,
              ),
            ),
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
          );
          debugPrint('   ✅ Scheduled 30-second test notification!');
        }
      } else {
        throw Exception('Notifications are not supported on this platform (${_getPlatformName()}).');
      }
    } catch (e) {
      debugPrint('   ❌ Error showing test notification: $e');
      rethrow;
    }
  }

  String _getPlatformName() {
    if (Platform.isWindows) return 'Windows';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isLinux) return 'Linux';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    return 'Unknown';
  }

  // Helper methods

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays > 1 ? 's' : ''}';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours > 1 ? 's' : ''}';
    } else {
      return '${duration.inMinutes} minute${duration.inMinutes > 1 ? 's' : ''}';
    }
  }
}
