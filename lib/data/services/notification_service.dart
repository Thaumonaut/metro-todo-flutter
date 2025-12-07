import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';
import '../models/todo_task.dart';

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
    // Handle notification tap - could navigate to specific task
    final payload = response.payload;
    if (payload != null) {
      // Parse task ID from payload and navigate
    }
  }

  /// Request notification permissions
  Future<bool> requestPermissions() async {
    final status = await Permission.notification.request();
    return status.isGranted;
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

  /// Schedule a notification for a task due today
  Future<void> scheduleDueTodayNotification(TodoTask task) async {
    if (!_isInitialized || task.dueDate == null) return;

    final now = DateTime.now();
    final dueDate = task.dueDate!;

    // Only schedule if due today and not already past
    if (!_isSameDay(dueDate, now)) return;

    // Schedule for 9 AM on the due date
    var notificationTime = DateTime(dueDate.year, dueDate.month, dueDate.day, 9, 0);
    if (notificationTime.isBefore(now)) {
      // If 9 AM has passed, schedule for now + 1 minute
      notificationTime = now.add(const Duration(minutes: 1));
    }

    await _notifications.zonedSchedule(
      task.id,
      'Task Due Today',
      task.title,
      tz.TZDateTime.from(notificationTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _dueTodayChannelId,
          'Due Today',
          channelDescription: 'Notifications for tasks due today',
          importance: Importance.high,
          priority: Priority.high,
        ),
        linux: const LinuxNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: task.id.toString(),
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

  /// Show a test notification (for testing purposes)
  Future<void> showTestNotification() async {
    if (!_isInitialized) {
      throw Exception('Notification service not initialized. Try again after a moment.');
    }

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
        // Use flutter_local_notifications for other platforms
        await _notifications.show(
          999999,
          'Test Notification',
          'This is a test notification from Metro Todo',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'test',
              'Test Notifications',
              channelDescription: 'Test notification channel',
            ),
            linux: LinuxNotificationDetails(),
          ),
        );
      } else {
        throw Exception('Notifications are not supported on this platform (${_getPlatformName()}).');
      }
    } catch (e) {
      debugPrint('Error showing test notification: $e');
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
