import 'package:isar/isar.dart';
import '../models/recurring_pattern.dart';

/// Repository for managing recurring patterns
class RecurringPatternRepository {
  final Isar _isar;

  RecurringPatternRepository(this._isar);

  /// Create a new recurring pattern
  Future<RecurringPattern> createPattern(RecurringPattern pattern) async {
    await _isar.writeTxn(() async {
      await _isar.recurringPatterns.put(pattern);
    });
    return pattern;
  }

  /// Get pattern by ID
  Future<RecurringPattern?> getPattern(int id) async {
    return await _isar.recurringPatterns.get(id);
  }

  /// Get all patterns
  Future<List<RecurringPattern>> getAllPatterns() async {
    return await _isar.recurringPatterns.where().findAll();
  }

  /// Update a pattern
  Future<void> updatePattern(RecurringPattern pattern) async {
    await _isar.writeTxn(() async {
      await _isar.recurringPatterns.put(pattern);
    });
  }

  /// Delete a pattern
  Future<bool> deletePattern(int id) async {
    return await _isar.writeTxn(() async {
      return await _isar.recurringPatterns.delete(id);
    });
  }

  /// Stream of all patterns
  Stream<List<RecurringPattern>> watchPatterns() {
    return _isar.recurringPatterns.where().watch(fireImmediately: true);
  }

  /// Validate a pattern
  bool validatePattern(RecurringPattern pattern) {
    // Basic validation
    if (pattern.interval < 1) return false;

    switch (pattern.type) {
      case RecurrenceType.daily:
        return true;

      case RecurrenceType.weekly:
        return pattern.daysOfWeek != null && pattern.daysOfWeek!.isNotEmpty;

      case RecurrenceType.monthly:
        if (pattern.lastDayOfMonth == true) return true;
        if (pattern.daysOfMonth != null && pattern.daysOfMonth!.isNotEmpty) {
          return pattern.daysOfMonth!.every((day) => day >= 1 && day <= 31);
        }
        if (pattern.nthWeekday != null && pattern.weekdayOfMonth != null) {
          return (pattern.nthWeekday! >= -1 && pattern.nthWeekday! <= 5 && pattern.nthWeekday! != 0) &&
              (pattern.weekdayOfMonth! >= 0 && pattern.weekdayOfMonth! <= 6);
        }
        return false;

      case RecurrenceType.yearly:
        return pattern.monthOfYear != null &&
            pattern.monthOfYear! >= 1 &&
            pattern.monthOfYear! <= 12 &&
            pattern.dayOfYear != null &&
            pattern.dayOfYear! >= 1 &&
            pattern.dayOfYear! <= 31;

      case RecurrenceType.custom:
        return true;
    }
  }
}
