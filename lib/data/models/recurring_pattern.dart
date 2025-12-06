import 'package:isar/isar.dart';

part 'recurring_pattern.g.dart';

/// Recurrence pattern types
enum RecurrenceType {
  daily,
  weekly,
  monthly,
  yearly,
  custom,
}

/// Isar collection model for recurring task patterns
@collection
class RecurringPattern {
  /// Auto-incrementing ID for Isar
  Id id = Isar.autoIncrement;

  /// Type of recurrence (daily, weekly, monthly, yearly, custom)
  @Enumerated(EnumType.name)
  late RecurrenceType type;

  /// Interval - e.g., every 2 weeks
  late int interval;

  /// Weekly pattern: days of week (0=Monday, 6=Sunday)
  List<int>? daysOfWeek;

  /// Monthly pattern: specific days (1-31)
  List<int>? daysOfMonth;

  /// Monthly pattern: use last day of month
  bool? lastDayOfMonth;

  /// Monthly pattern: nth weekday (1=first, 2=second, -1=last)
  int? nthWeekday;

  /// Monthly pattern: weekday of month (0=Monday, 6=Sunday)
  int? weekdayOfMonth;

  /// Yearly pattern: month (1-12)
  int? monthOfYear;

  /// Yearly pattern: day of month (1-31)
  int? dayOfYear;

  /// Skip weekends (Saturday and Sunday)
  late bool skipWeekends;

  /// End date for recurrence (null = never ends)
  DateTime? endDate;

  /// Maximum number of occurrences (null = unlimited)
  int? maxOccurrences;

  /// Creation timestamp
  late DateTime createdAt;

  RecurringPattern() {
    skipWeekends = false;
    interval = 1;
    createdAt = DateTime.now();
  }
}
