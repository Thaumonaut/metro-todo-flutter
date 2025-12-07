import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';
import '../services/database_service.dart';
import '../repositories/todo_repository.dart';
import '../repositories/tag_repository.dart';

// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return DatabaseService.instance;
});

// Repository providers
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TodoRepository(db);
});

final tagRepositoryProvider = Provider<TagRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TagRepository(db);
});

// Stream providers for reactive data

/// Stream of all todos
final allTodosStreamProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos();
});

/// Stream of all tags
final allTagsStreamProvider = StreamProvider<List<TaskTag>>((ref) {
  final repository = ref.watch(tagRepositoryProvider);
  return repository.watchAllTags();
});

/// Stream of incomplete todos
final incompleteTodosStreamProvider = StreamProvider<List<TodoTask>>((
  ref,
) async* {
  final repository = ref.watch(todoRepositoryProvider);
  await for (final todos in repository.watchAllTodos()) {
    yield todos.where((todo) => !todo.isCompleted).toList();
  }
});

/// Stream of completed todos
final completedTodosStreamProvider = StreamProvider<List<TodoTask>>((
  ref,
) async* {
  final repository = ref.watch(todoRepositoryProvider);
  await for (final todos in repository.watchAllTodos()) {
    yield todos.where((todo) => todo.isCompleted).toList();
  }
});

/// Stream of todos due today
final todosDueTodayStreamProvider = StreamProvider<List<TodoTask>>((
  ref,
) async* {
  final repository = ref.watch(todoRepositoryProvider);
  await for (final todos in repository.watchAllTodos()) {
    yield todos.where((todo) => todo.isDueToday && !todo.isCompleted).toList();
  }
});

/// Stream of overdue todos
final overdueTodosStreamProvider = StreamProvider<List<TodoTask>>((ref) async* {
  final repository = ref.watch(todoRepositoryProvider);
  await for (final todos in repository.watchAllTodos()) {
    yield todos.where((todo) => todo.isOverdue && !todo.isCompleted).toList();
  }
});

// Future providers for statistics

/// Provider for todo statistics
final todoStatsProvider = FutureProvider<TodoStats>((ref) async {
  final repository = ref.watch(todoRepositoryProvider);

  final total = await repository.getTodoCount();
  final completed = await repository.getCompletedCount();
  final incomplete = await repository.getIncompleteCount();
  final overdue = await repository.getOverdueCount();
  final today = await repository.getTodayCount();

  return TodoStats(
    total: total,
    completed: completed,
    incomplete: incomplete,
    overdue: overdue,
    dueToday: today,
  );
});

/// Simple data class for todo statistics
class TodoStats {
  final int total;
  final int completed;
  final int incomplete;
  final int overdue;
  final int dueToday;

  TodoStats({
    required this.total,
    required this.completed,
    required this.incomplete,
    required this.overdue,
    required this.dueToday,
  });

  double get completionRate {
    if (total == 0) return 0;
    return completed / total;
  }
}
