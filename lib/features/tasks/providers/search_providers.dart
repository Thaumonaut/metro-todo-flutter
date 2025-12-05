import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/models/task_status.dart';
import '../../../data/models/importance_level.dart';
import '../../../data/providers/repository_providers.dart';

/// Provider for the current search query
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for selected search filters
final searchFiltersProvider = StateProvider<Set<String>>((ref) => {});

/// Provider for search results based on query and filters
final searchResultsProvider = StreamProvider<List<TodoTask>>((ref) async* {
  final query = ref.watch(searchQueryProvider);
  final filters = ref.watch(searchFiltersProvider);
  final todoRepo = ref.watch(todoRepositoryProvider);

  // Watch all tasks
  await for (final tasks in todoRepo.watchAllTodos()) {
    // Filter by search query
    var results = tasks;

    if (query.isNotEmpty) {
      final lowerQuery = query.toLowerCase();
      results = results.where((task) {
        final titleMatch = task.title.toLowerCase().contains(lowerQuery);
        final descriptionMatch = task.description != null &&
            task.description!.toLowerCase().contains(lowerQuery);
        return titleMatch || descriptionMatch;
      }).toList();
    }

    // Apply filters
    if (filters.isNotEmpty) {
      results = results.where((task) {
        bool matches = true;

        if (filters.contains('in_progress')) {
          matches = matches && task.status == TaskStatus.inProgress;
        }

        if (filters.contains('completed')) {
          matches = matches && task.status == TaskStatus.completed;
        }

        if (filters.contains('high_priority')) {
          matches = matches &&
              (task.importance == ImportanceLevel.high ||
                  task.importance == ImportanceLevel.critical);
        }

        return matches;
      }).toList();
    }

    // Sort by relevance (you can customize this)
    results.sort((a, b) {
      // Prioritize tasks with title matches over description matches
      final aTitle = a.title.toLowerCase().contains(query.toLowerCase());
      final bTitle = b.title.toLowerCase().contains(query.toLowerCase());

      if (aTitle && !bTitle) return -1;
      if (!aTitle && bTitle) return 1;

      // Then sort by importance
      return b.importance.index.compareTo(a.importance.index);
    });

    yield results;
  }
});
