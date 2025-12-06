import 'dart:math';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/recurring_pattern.dart';
import '../models/todo_task.dart';

/// Service for handling recurrence calculations and instance generation
class RecurrenceService {
  final Isar _isar;
  final _uuid = const Uuid();

  RecurrenceService(this._isar);

  /// Calculate next N occurrence dates based on pattern
  List<DateTime> calculateOccurrences(
    RecurringPattern pattern,
    DateTime startDate, {
    int count = 90,
    DateTime? until,
  }) {
    final occurrences = <DateTime>[];
    var current = startDate;
    var generated = 0;
    final maxIterations = pattern.maxOccurrences ?? 1000;

    while (generated < min(count, maxIterations)) {
      if (until != null && current.isAfter(until)) break;
      if (pattern.endDate != null && current.isAfter(pattern.endDate!)) break;

      occurrences.add(current);
      generated++;

      final next = getNextOccurrence(pattern, current);
      if (next == null) break;
      current = next;
    }

    return occurrences;
  }

  /// Get next occurrence after a given date
  DateTime? getNextOccurrence(RecurringPattern pattern, DateTime after) {
    DateTime next;

    switch (pattern.type) {
      case RecurrenceType.daily:
        next = after.add(Duration(days: pattern.interval));
        break;

      case RecurrenceType.weekly:
        next = _getNextWeeklyOccurrence(pattern, after);
        break;

      case RecurrenceType.monthly:
        next = _getNextMonthlyOccurrence(pattern, after);
        break;

      case RecurrenceType.yearly:
        next = _getNextYearlyOccurrence(pattern, after);
        break;

      case RecurrenceType.custom:
        return null; // Custom patterns not yet implemented
    }

    // Skip weekends if needed
    if (pattern.skipWeekends) {
      next = adjustForSkippedWeekends(next);
    }

    return next;
  }

  /// Calculate next weekly occurrence
  DateTime _getNextWeeklyOccurrence(RecurringPattern pattern, DateTime after) {
    if (pattern.daysOfWeek == null || pattern.daysOfWeek!.isEmpty) {
      return after.add(Duration(days: 7 * pattern.interval));
    }

    final sortedDays = List<int>.from(pattern.daysOfWeek!)..sort();
    final currentWeekday = after.weekday - 1; // 0=Monday, 6=Sunday

    // Find next day in current week
    for (final day in sortedDays) {
      if (day > currentWeekday) {
        final daysToAdd = day - currentWeekday;
        return after.add(Duration(days: daysToAdd));
      }
    }

    // Move to next interval and use first day
    final daysUntilNextWeek = 7 - currentWeekday + sortedDays.first;
    final weeksToSkip = pattern.interval - 1;
    return after.add(Duration(days: daysUntilNextWeek + (weeksToSkip * 7)));
  }

  /// Calculate next monthly occurrence
  DateTime _getNextMonthlyOccurrence(RecurringPattern pattern, DateTime after) {
    if (pattern.lastDayOfMonth == true) {
      return _getLastDayOfMonth(after.year, after.month + pattern.interval);
    }

    if (pattern.daysOfMonth != null && pattern.daysOfMonth!.isNotEmpty) {
      return _getNextMonthlyByDayOfMonth(pattern, after);
    }

    if (pattern.nthWeekday != null && pattern.weekdayOfMonth != null) {
      return _getNextMonthlyByNthWeekday(pattern, after);
    }

    // Default: same day next month
    return DateTime(after.year, after.month + pattern.interval, after.day);
  }

  /// Get next monthly occurrence by day of month
  DateTime _getNextMonthlyByDayOfMonth(RecurringPattern pattern, DateTime after) {
    final sortedDays = List<int>.from(pattern.daysOfMonth!)..sort();

    // Try to find a day in the current month
    for (final day in sortedDays) {
      if (day > after.day) {
        return adjustForMonthEnd(day, after.month, after.year);
      }
    }

    // Move to next month interval
    final nextMonth = after.month + pattern.interval;
    final nextYear = after.year + (nextMonth - 1) ~/ 12;
    final adjustedMonth = ((nextMonth - 1) % 12) + 1;

    return adjustForMonthEnd(sortedDays.first, adjustedMonth, nextYear);
  }

  /// Get next monthly occurrence by nth weekday
  DateTime _getNextMonthlyByNthWeekday(RecurringPattern pattern, DateTime after) {
    final nextMonth = after.month + pattern.interval;
    final nextYear = after.year + (nextMonth - 1) ~/ 12;
    final adjustedMonth = ((nextMonth - 1) % 12) + 1;

    return _getNthWeekdayOfMonth(
      nextYear,
      adjustedMonth,
      pattern.weekdayOfMonth!,
      pattern.nthWeekday!,
    );
  }

  /// Get next yearly occurrence
  DateTime _getNextYearlyOccurrence(RecurringPattern pattern, DateTime after) {
    final nextYear = after.year + pattern.interval;
    return adjustForMonthEnd(
      pattern.dayOfYear!,
      pattern.monthOfYear!,
      nextYear,
    );
  }

  /// Get nth weekday of month (e.g., 2nd Tuesday)
  DateTime _getNthWeekdayOfMonth(int year, int month, int weekday, int nth) {
    // Handle last occurrence
    if (nth == -1) {
      var lastDay = DateTime(year, month + 1, 0);
      while (lastDay.weekday - 1 != weekday) {
        lastDay = lastDay.subtract(const Duration(days: 1));
      }
      return lastDay;
    }

    // Find first occurrence of weekday in month
    var date = DateTime(year, month, 1);
    while (date.weekday - 1 != weekday) {
      date = date.add(const Duration(days: 1));
    }

    // Add weeks to get nth occurrence
    date = date.add(Duration(days: 7 * (nth - 1)));

    // Validate it's still in the same month
    if (date.month != month) {
      return _getLastDayOfMonth(year, month);
    }

    return date;
  }

  /// Get last day of month
  DateTime _getLastDayOfMonth(int year, int month) {
    return DateTime(year, month + 1, 0);
  }

  /// Adjust for month-end dates (e.g., Jan 31 -> Feb 28)
  DateTime adjustForMonthEnd(int targetDay, int month, int year) {
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;
    final adjustedDay = min(targetDay, lastDayOfMonth);
    return DateTime(year, month, adjustedDay);
  }

  /// Skip weekend dates
  DateTime adjustForSkippedWeekends(DateTime date) {
    // Saturday
    if (date.weekday == DateTime.saturday) {
      return date.add(const Duration(days: 2));
    }
    // Sunday
    if (date.weekday == DateTime.sunday) {
      return date.add(const Duration(days: 1));
    }
    return date;
  }

  /// Generate task instances for a recurring pattern
  Future<List<TodoTask>> generateInstances(
    TodoTask template,
    RecurringPattern pattern, {
    DateTime? until,
    int? count,
  }) async {
    if (template.dueDate == null) {
      throw Exception('Template task must have a due date');
    }

    final untilDate = until ?? DateTime.now().add(const Duration(days: 90));
    final occurrences = calculateOccurrences(
      pattern,
      template.dueDate!,
      count: count ?? 90,
      until: untilDate,
    );

    final instances = <TodoTask>[];
    final seriesId = template.recurringSeriesId ?? _uuid.v4();

    for (var i = 0; i < occurrences.length; i++) {
      final occurrence = occurrences[i];

      // Skip the first occurrence if it's the template's due date
      if (i == 0 && occurrence == template.dueDate) continue;

      final instance = TodoTask()
        ..uuid = _uuid.v4()
        ..title = template.title
        ..description = template.description
        ..importance = template.importance
        ..status = template.status
        ..dueDate = occurrence
        ..createdAt = DateTime.now()
        ..isCompleted = false
        ..isRecurring = true
        ..isRecurringTemplate = false
        ..recurringPatternId = pattern.id
        ..recurringSeriesId = seriesId
        ..recurringOriginalDate = occurrence
        ..recurringInstanceNumber = i
        ..isRecurringException = false
        ..isSkipped = false;

      instance.updateComputedProperties();
      instances.add(instance);
    }

    return instances;
  }

  /// Generate missing instances for all active recurring patterns
  Future<void> generateMissingInstances() async {
    final templates = await _isar.todoTasks
        .filter()
        .isRecurringTemplateEqualTo(true)
        .findAll();

    for (final template in templates) {
      if (template.recurringPatternId == null) continue;

      final pattern = await _isar.recurringPatterns.get(template.recurringPatternId!);
      if (pattern == null) continue;

      // Check if pattern is still active
      if (pattern.endDate != null && pattern.endDate!.isBefore(DateTime.now())) {
        continue;
      }

      // Find the latest instance
      final existingInstances = await _isar.todoTasks
          .filter()
          .recurringSeriesIdEqualTo(template.recurringSeriesId)
          .and()
          .isRecurringTemplateEqualTo(false)
          .sortByDueDateDesc()
          .findAll();

      final latestDate = existingInstances.isNotEmpty && existingInstances.first.dueDate != null
          ? existingInstances.first.dueDate!
          : template.dueDate;

      if (latestDate == null) continue;

      // Generate instances from latest date up to 90 days ahead
      final instances = await generateInstances(
        template,
        pattern,
        until: DateTime.now().add(const Duration(days: 90)),
      );

      if (instances.isNotEmpty) {
        await _isar.writeTxn(() async {
          await _isar.todoTasks.putAll(instances);
        });
      }
    }
  }
}
