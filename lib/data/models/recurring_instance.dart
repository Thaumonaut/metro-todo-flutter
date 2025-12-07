/// Lightweight class representing a single instance of a recurring task
/// Generated on-demand for display, not stored in database
class RecurringInstance {
  /// The scheduled date for this instance
  final DateTime scheduledDate;

  /// Whether this instance has been completed
  final bool isCompleted;

  /// The instance number in the series (0, 1, 2...)
  final int instanceNumber;

  /// When this instance was completed (null if not completed)
  final DateTime? completedAt;

  /// Optional note about the completion
  final String? completionNote;

  /// Whether this instance is in the past
  bool get isPast => scheduledDate.isBefore(DateTime.now());

  /// Whether this instance is overdue (past and not completed)
  bool get isOverdue => isPast && !isCompleted;

  /// Whether this instance is today
  bool get isToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final instanceDate = DateTime(
      scheduledDate.year,
      scheduledDate.month,
      scheduledDate.day,
    );
    return instanceDate.isAtSameMomentAs(today);
  }

  const RecurringInstance({
    required this.scheduledDate,
    required this.isCompleted,
    required this.instanceNumber,
    this.completedAt,
    this.completionNote,
  });

  /// Create an incomplete instance
  factory RecurringInstance.pending({
    required DateTime scheduledDate,
    required int instanceNumber,
  }) {
    return RecurringInstance(
      scheduledDate: scheduledDate,
      isCompleted: false,
      instanceNumber: instanceNumber,
    );
  }

  /// Create a completed instance
  factory RecurringInstance.completed({
    required DateTime scheduledDate,
    required int instanceNumber,
    required DateTime completedAt,
    String? note,
  }) {
    return RecurringInstance(
      scheduledDate: scheduledDate,
      isCompleted: true,
      instanceNumber: instanceNumber,
      completedAt: completedAt,
      completionNote: note,
    );
  }

  @override
  String toString() {
    return 'RecurringInstance(#$instanceNumber on $scheduledDate, completed: $isCompleted)';
  }
}
