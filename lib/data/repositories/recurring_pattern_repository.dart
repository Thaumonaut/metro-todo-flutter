import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../database/database.dart';
// for RecurrenceType enum if moved there
// or just make sure RecurrenceType is available.
// RecurrenceService defined RecurrenceType at bottom of file. Let's import it.

import '../models/recurring_pattern.dart';

/// Repository for managing recurring patterns
class RecurringPatternRepository {
  final AppDatabase _db;
  static const _uuid = Uuid();

  RecurringPatternRepository(this._db);

  /// Create a new recurring pattern
  Future<int> createPattern({
    required RecurrenceType type,
    required int interval,
    List<int>? daysOfWeek,
    List<int>? daysOfMonth,
    bool? lastDayOfMonth,
    int? nthWeekday,
    int? dayOfYear,
    int? monthOfYear,
    String? customRule,
    DateTime? endDate,
    int? maxOccurrences,
  }) async {
    final entry = RecurringPatternsCompanion(
      seriesId: Value(_uuid.v4()),
      type: Value(type.name),
      interval: Value(interval),
      daysOfWeek: daysOfWeek != null
          ? Value(daysOfWeek.join(','))
          : const Value.absent(),
      daysOfMonth: daysOfMonth != null
          ? Value(daysOfMonth.join(','))
          : const Value.absent(),
      lastDayOfMonth: lastDayOfMonth != null
          ? Value(lastDayOfMonth)
          : const Value.absent(),
      nthWeekday: nthWeekday != null ? Value(nthWeekday) : const Value.absent(),
      dayOfYear: dayOfYear != null ? Value(dayOfYear) : const Value.absent(),
      monthOfYear: monthOfYear != null
          ? Value(monthOfYear)
          : const Value.absent(),
      customRule: customRule != null ? Value(customRule) : const Value.absent(),
      endDate: endDate != null ? Value(endDate) : const Value.absent(),
      maxOccurrences: maxOccurrences != null
          ? Value(maxOccurrences)
          : const Value.absent(),
      createdAt: Value(DateTime.now()),
      isActive: const Value(true),
    );

    return await _db.into(_db.recurringPatterns).insert(entry);
  }

  /// Get pattern by ID
  Future<RecurringPattern?> getPattern(int id) async {
    return await (_db.select(
      _db.recurringPatterns,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get pattern by series ID
  Future<RecurringPattern?> getPatternBySeriesId(String seriesId) async {
    return await (_db.select(
      _db.recurringPatterns,
    )..where((tbl) => tbl.seriesId.equals(seriesId))).getSingleOrNull();
  }

  /// Get all patterns
  Future<List<RecurringPattern>> getAllPatterns() async {
    return await (_db.select(
      _db.recurringPatterns,
    )..where((tbl) => tbl.isActive.equals(true))).get();
  }

  /// Get all inactive patterns
  Future<List<RecurringPattern>> getInactivePatterns() async {
    return await (_db.select(
      _db.recurringPatterns,
    )..where((tbl) => tbl.isActive.equals(false))).get();
  }

  /// Update a pattern
  Future<bool> updatePattern(
    int id, {
    String? type,
    int? interval,
    List<int>? daysOfWeek,
    List<int>? daysOfMonth,
    bool? lastDayOfMonth,
    int? nthWeekday,
    int? dayOfYear,
    int? monthOfYear,
    String? customRule,
    DateTime? endDate,
    int? maxOccurrences,
    bool? isActive,
  }) async {
    final rows =
        await (_db.update(
          _db.recurringPatterns,
        )..where((tbl) => tbl.id.equals(id))).write(
          RecurringPatternsCompanion(
            type: type != null ? Value(type) : const Value.absent(),
            interval: interval != null ? Value(interval) : const Value.absent(),
            daysOfWeek: daysOfWeek != null
                ? Value(daysOfWeek.join(','))
                : const Value.absent(),
            daysOfMonth: daysOfMonth != null
                ? Value(daysOfMonth.join(','))
                : const Value.absent(),
            lastDayOfMonth: lastDayOfMonth != null
                ? Value(lastDayOfMonth)
                : const Value.absent(),
            nthWeekday: nthWeekday != null
                ? Value(nthWeekday)
                : const Value.absent(),
            dayOfYear: dayOfYear != null
                ? Value(dayOfYear)
                : const Value.absent(),
            monthOfYear: monthOfYear != null
                ? Value(monthOfYear)
                : const Value.absent(),
            customRule: customRule != null
                ? Value(customRule)
                : const Value.absent(),
            endDate: endDate != null ? Value(endDate) : const Value.absent(),
            maxOccurrences: maxOccurrences != null
                ? Value(maxOccurrences)
                : const Value.absent(),
            isActive: isActive != null ? Value(isActive) : const Value.absent(),
          ),
        );
    return rows > 0;
  }

  /// Delete a pattern
  Future<bool> deletePattern(int id) async {
    final count = await (_db.delete(
      _db.recurringPatterns,
    )..where((tbl) => tbl.id.equals(id))).go();

    return count > 0;
  }

  /// Mark a pattern as inactive
  Future<bool> deactivatePattern(int id) async {
    return await updatePattern(id, isActive: false);
  }

  /// Mark a pattern as active
  Future<bool> reactivatePattern(int id) async {
    return await updatePattern(id, isActive: true);
  }

  /// Stream of all active patterns
  Stream<List<RecurringPattern>> watchPatterns() {
    return (_db.select(
      _db.recurringPatterns,
    )..where((tbl) => tbl.isActive.equals(true))).watch();
  }

  /// Stream of specific pattern
  Stream<RecurringPattern?> watchPattern(int id) {
    return (_db.select(
      _db.recurringPatterns,
    )..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  /// Validate a pattern
  bool validatePattern(
    RecurrenceType type, {
    required int interval,
    List<int>? daysOfWeek,
    List<int>? daysOfMonth,
    bool? lastDayOfMonth,
    int? nthWeekday,
    int? dayOfYear,
    int? monthOfYear,
  }) {
    // Basic validation
    if (interval < 1) return false;

    switch (type) {
      case RecurrenceType.daily:
        return true;

      case RecurrenceType.weekly:
        return daysOfWeek != null && daysOfWeek.isNotEmpty;

      case RecurrenceType.monthly:
        if (lastDayOfMonth == true) return true;
        if (daysOfMonth != null && daysOfMonth.isNotEmpty) {
          return daysOfMonth.every((day) => day >= 1 && day <= 31);
        }
        if (nthWeekday != null) {
          return (nthWeekday >= -1 && nthWeekday <= 5 && nthWeekday != 0);
        }
        return false;

      case RecurrenceType.yearly:
        return monthOfYear != null &&
            monthOfYear >= 1 &&
            monthOfYear <= 12 &&
            dayOfYear != null &&
            dayOfYear >= 1 &&
            dayOfYear <= 31;

      case RecurrenceType.custom:
        return true;
    }
  }

  /// Helper: Parse comma-separated string to list of ints
  static List<int>? parseIntList(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      return value.split(',').map((e) => int.parse(e.trim())).toList();
    } catch (e) {
      return null;
    }
  }

  /// Helper: Convert list of ints to comma-separated string
  static String? joinIntList(List<int>? value) {
    if (value == null || value.isEmpty) return null;
    return value.join(',');
  }
}
