/// Enum representing different types of tasks in the application
enum TaskType {
  /// Standard/regular task
  standard('Standard'),

  /// Medication tracking task
  medication('Medication'),

  /// Habit tracking task (for things you want to START doing)
  habit('Habit'),

  /// Bill payment tracking task
  bill('Bill'),

  /// Exercise/workout tracking task
  exercise('Exercise'),

  /// Chore tracking task
  chore('Chore'),

  /// Days-since tracking task (for things you want to QUIT/STOP doing)
  daysSince('Days Since');

  const TaskType(this.label);

  /// Human-readable label for the task type
  final String label;

  /// Get icon for each task type
  String get iconName {
    switch (this) {
      case TaskType.standard:
        return 'task';
      case TaskType.medication:
        return 'medication';
      case TaskType.habit:
        return 'trending_up';
      case TaskType.bill:
        return 'receipt';
      case TaskType.exercise:
        return 'fitness_center';
      case TaskType.chore:
        return 'cleaning_services';
      case TaskType.daysSince:
        return 'calendar_today';
    }
  }
}
