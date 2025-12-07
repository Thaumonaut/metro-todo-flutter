import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/preferences_providers.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/models/app_preferences.dart';
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
  Future<void> scheduleTaskNotifications(TodoTask task) async {
    if (!_preferences.notificationsEnabled) return;
    if (task.isCompleted || task.dueDate == null) return;

    // Cancel any existing notifications for this task
    await _service.cancelTaskNotification(task.id);

    // Schedule due date notification
    if (_preferences.dueDateReminders) {
      await _service.scheduleDueTodayNotification(task);
    }

    // Schedule reminder before due date
    if (_preferences.upcomingReminders) {
      await _service.scheduleReminderNotification(
        task,
        beforeDue: Duration(hours: _preferences.reminderHoursBefore),
      );
    }
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
