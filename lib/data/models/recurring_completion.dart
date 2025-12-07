import 'package:isar/isar.dart';

part 'recurring_completion.g.dart';

/// Lightweight model to track completion of recurring task instances
/// Stores only completed instances to minimize database bloat
@collection
class RecurringCompletion {
  /// Auto-incrementing ID for Isar
  Id id = Isar.autoIncrement;

  /// UUID linking to the recurring series
  @Index()
  late String recurringSeriesId;

  /// Instance number in the series (0, 1, 2...)
  late int instanceNumber;

  /// The scheduled/original date for this instance
  late DateTime scheduledDate;

  /// When this instance was completed
  late DateTime completedAt;

  /// Optional note about this completion
  String? note;

  /// Who completed it (for future multi-user support)
  String? completedBy;

  RecurringCompletion();

  /// Create a completion record
  factory RecurringCompletion.create({
    required String recurringSeriesId,
    required int instanceNumber,
    required DateTime scheduledDate,
    String? note,
  }) {
    return RecurringCompletion()
      ..recurringSeriesId = recurringSeriesId
      ..instanceNumber = instanceNumber
      ..scheduledDate = scheduledDate
      ..completedAt = DateTime.now()
      ..note = note;
  }
}
