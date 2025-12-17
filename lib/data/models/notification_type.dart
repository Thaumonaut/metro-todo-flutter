/// Type of notification for task reminders
enum NotificationType {
  /// Basic notification that can be swiped away
  basic,

  /// Persistent alarm-style notification that requires action
  /// Opens the app with options to complete, snooze, or dismiss
  persistent,
}

extension NotificationTypeExtension on NotificationType {
  String get label {
    switch (this) {
      case NotificationType.basic:
        return 'Basic Notification';
      case NotificationType.persistent:
        return 'Persistent Alarm';
    }
  }

  String get description {
    switch (this) {
      case NotificationType.basic:
        return 'Standard notification you can swipe away';
      case NotificationType.persistent:
        return 'Alarm-style notification that requires action';
    }
  }
}
