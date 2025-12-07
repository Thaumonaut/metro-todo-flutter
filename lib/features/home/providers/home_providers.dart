import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/providers/repository_providers.dart';
import '../../../data/database/database.dart'; // TodoTask and TaskTag
import '../../../data/models/importance_level.dart';

/// Helper to get importance value from string
int _getImportanceValue(String importanceName) {
  try {
    return ImportanceLevel.values.byName(importanceName).value;
  } catch (_) {
    return ImportanceLevel.low.value;
  }
}

/// Stream provider for tasks due today
/// Filters out recurring instances to avoid duplicates
final todayTasksProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    return todos
        .where(
          (todo) =>
              todo.isDueToday &&
              !todo.isCompleted &&
              // Show non-recurring tasks OR recurring templates only
              (!todo.isRecurring || todo.isRecurringTemplate),
        )
        .toList()
      ..sort(
        (a, b) => _getImportanceValue(
          b.importance,
        ).compareTo(_getImportanceValue(a.importance)),
      );
  });
});

/// Stream provider for all incomplete tasks
/// Filters out recurring instances to show only one entry per recurring task
final allTasksProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    return todos
        .where(
          (todo) =>
              !todo.isCompleted &&
              // Show non-recurring tasks OR recurring templates only (hide instances)
              (!todo.isRecurring || todo.isRecurringTemplate),
        )
        .toList()
      ..sort((a, b) {
        // Sort by due date first (overdue first, then by date), then by importance
        if (a.isOverdue != b.isOverdue) {
          return a.isOverdue ? -1 : 1;
        }
        if (a.dueDate != null && b.dueDate != null) {
          final dateCompare = a.dueDate!.compareTo(b.dueDate!);
          if (dateCompare != 0) return dateCompare;
        }
        if (a.dueDate != null && b.dueDate == null) return -1;
        if (a.dueDate == null && b.dueDate != null) return 1;
        return _getImportanceValue(
          b.importance,
        ).compareTo(_getImportanceValue(a.importance));
      });
  });
});

/// Stream provider for urgent/high priority incomplete tasks (kept for compatibility)
final urgentTasksProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    return todos
        .where(
          (todo) =>
              !todo.isCompleted &&
              _getImportanceValue(todo.importance) >= 2, // High or Critical
        )
        .toList()
      ..sort(
        (a, b) => _getImportanceValue(
          b.importance,
        ).compareTo(_getImportanceValue(a.importance)),
      );
  });
});

/// Stream provider for recurring templates (for home recurring section)
final homeRecurringTemplatesProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchRecurringTemplates();
});

/// Stream provider for upcoming recurring instances (next 14 days)
final homeRecurringInstancesProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    final now = DateTime.now();
    final twoWeeksLater = now.add(const Duration(days: 14));

    return todos
        .where(
          (t) =>
              t.isRecurring &&
              !t.isRecurringTemplate &&
              !t.isCompleted &&
              !t.isSkipped &&
              t.dueDate != null &&
              t.dueDate!.isAfter(now.subtract(const Duration(days: 1))) &&
              t.dueDate!.isBefore(twoWeeksLater),
        )
        .toList()
      ..sort((a, b) => a.dueDate!.compareTo(b.dueDate!));
  });
});

/// Stream provider for recently created tasks
final recentTasksProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    // Filter out recurring instances, keep only templates
    final filteredTodos = todos
        .where((todo) => !todo.isRecurring || todo.isRecurringTemplate)
        .toList();
    final sortedTodos = List<TodoTask>.from(filteredTodos)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedTodos.take(10).toList();
  });
});

/// Stream provider for completed tasks
final completedTasksProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    return todos.where((todo) => todo.isCompleted).toList()..sort(
      (a, b) => (b.completedAt ?? b.createdAt).compareTo(
        a.completedAt ?? a.createdAt,
      ),
    );
  });
});

/// Provider for weekly statistics
final weeklyStatsProvider = FutureProvider<WeeklyStats>((ref) async {
  final repository = ref.watch(todoRepositoryProvider);

  final now = DateTime.now();
  final weekStart = now.subtract(Duration(days: now.weekday - 1));
  final weekStartDate = DateTime(
    weekStart.year,
    weekStart.month,
    weekStart.day,
  );

  final allTodos = await repository.getAllTodos();

  // Count tasks created this week
  final createdThisWeek = allTodos
      .where((todo) => todo.createdAt.isAfter(weekStartDate))
      .length;

  // Count tasks completed this week
  final completedThisWeek = allTodos
      .where(
        (todo) =>
            todo.completedAt != null &&
            todo.completedAt!.isAfter(weekStartDate),
      )
      .length;

  // Count tasks due this week
  final dueThisWeek = allTodos.where((todo) {
    if (todo.dueDate == null) return false;
    final dueDate = DateTime(
      todo.dueDate!.year,
      todo.dueDate!.month,
      todo.dueDate!.day,
    );
    final weekEnd = weekStartDate.add(const Duration(days: 7));
    return dueDate.isAfter(weekStartDate.subtract(const Duration(days: 1))) &&
        dueDate.isBefore(weekEnd);
  }).length;

  return WeeklyStats(
    createdCount: createdThisWeek,
    completedCount: completedThisWeek,
    dueCount: dueThisWeek,
  );
});

/// Provider for tag statistics (most used tags)
final topTagsProvider = FutureProvider<List<TagStats>>((ref) async {
  final tagRepository = ref.watch(tagRepositoryProvider);
  final tags = await tagRepository.getTagsSortedByUsage();

  final stats = <TagStats>[];
  for (final tag in tags.take(5)) {
    final count = await tagRepository.getTagUsageCount(tag.id);
    stats.add(TagStats(tag: tag, taskCount: count));
  }
  return stats;
});

/// Data class for weekly statistics
class WeeklyStats {
  final int createdCount;
  final int completedCount;
  final int dueCount;

  WeeklyStats({
    required this.createdCount,
    required this.completedCount,
    required this.dueCount,
  });
}

/// Data class for tag statistics
class TagStats {
  final TaskTag tag;
  final int taskCount;

  TagStats({required this.tag, required this.taskCount});
}
