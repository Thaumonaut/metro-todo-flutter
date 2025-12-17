import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/preferences_providers.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/models/app_preferences.dart';
import '../../../data/models/notification_type.dart';
import '../../../data/services/notification_service.dart';

/// Provider for NotificationService instance
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

/// Provider for notification manager that respects user preferences
final taskNotificationManagerProvider = Provider<TaskNotificationManager>((ref) {
  final service = ref.watch(notificationServiceProvider);
  final preferences = ref.watch(appPreferencesProvider);
  return TaskNotificationManager(service, preferences);
});

/// Manages task notifications based on user preferences
class TaskNotificationManager {
  final NotificationService _service;
  final AppPreferences _preferences;

  TaskNotificationManager(this._service, this._preferences);

  /// Schedule notifications for a newly created or updated task
  Future<void> scheduleTaskNotifications(
    TodoTask task, {
    List<DateTime>? customReminders,
    Map<DateTime, NotificationType>? reminderTypes,
    NotificationType? dueDateNotificationType,
  }) async {
    print('📅 [NOTIFICATION MANAGER] Scheduling notifications for task "${task.title}" (ID: ${task.id})');
    print('   Notifications enabled: ${_preferences.notificationsEnabled}');
    print('   Due date reminders: ${_preferences.dueDateReminders}');
    print('   Upcoming reminders: ${_preferences.upcomingReminders}');
    print('   Task due date: ${task.dueDate}');
    print('   Custom reminders: ${customReminders?.length ?? 0}');

    if (!_preferences.notificationsEnabled) {
      print('   ❌ Notifications disabled in preferences - skipping');
      return;
    }

    if (task.isCompleted) {
      print('   ❌ Task is completed - cancelling notifications');
      await cancelTaskNotifications(task.id);
      return;
    }

    // Cancel any existing notifications for this task first
    await _service.cancelTaskNotification(task.id);

    // If custom reminders are provided (e.g. from form), schedule them
    if (customReminders != null && customReminders.isNotEmpty) {
      print('   📝 Scheduling ${customReminders.length} custom reminders');
      for (final reminderTime in customReminders) {
        final notificationType = reminderTypes?[reminderTime] ?? NotificationType.basic;
        print('      - Reminder at: $reminderTime (Type: ${notificationType.name})');
        await _service.scheduleNotificationWithType(
          task: task,
          scheduledAt: reminderTime,
          type: notificationType,
        );
      }
    }

    // Schedule due date notification
    if (task.dueDate != null && _preferences.dueDateReminders) {
      final notificationType = dueDateNotificationType ?? NotificationType.basic;
      print('   ⏰ Scheduling due date notification for: ${task.dueDate} (Type: ${notificationType.name})');
      await _service.scheduleNotificationWithType(
        task: task,
        scheduledAt: task.dueDate!,
        type: notificationType,
        title: 'Task Due Now',
        body: task.title,
      );
    } else if (task.dueDate == null) {
      print('   ⚠️ No due date set - skipping due date notification');
    } else if (!_preferences.dueDateReminders) {
      print('   ⚠️ Due date reminders disabled - skipping');
    }

    // Schedule reminder before due date (global preference)
    if (task.dueDate != null && _preferences.upcomingReminders && (customReminders == null || customReminders.isEmpty)) {
      print('   📢 Scheduling upcoming reminder ${_preferences.reminderHoursBefore}h before due date');
      final reminderTime = task.dueDate!.subtract(Duration(hours: _preferences.reminderHoursBefore));
      final notificationType = dueDateNotificationType ?? NotificationType.basic;
      await _service.scheduleNotificationWithType(
        task: task,
        scheduledAt: reminderTime,
        type: notificationType,
        title: 'Upcoming Task Reminder',
        body: 'Task "${task.title}" is due in ${_preferences.reminderHoursBefore} hours',
      );
    }

    print('   ✅ Notification scheduling complete');
  }

  /// Cancel notifications when task is completed or deleted
  Future<void> cancelTaskNotifications(int taskId) async {
    await _service.cancelTaskNotification(taskId);
  }

  /// Show overdue notification
  Future<void> notifyOverdue(TodoTask task) async {
    if (!_preferences.notificationsEnabled) return;
    if (!_preferences.overdueReminders) return;

    await _service.showOverdueNotification(task);
  }
}
