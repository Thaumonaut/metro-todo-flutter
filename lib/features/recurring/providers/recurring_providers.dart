import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/recurring_pattern.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/providers/repository_providers.dart';
import '../../../data/repositories/recurring_pattern_repository.dart';
import '../../../data/services/recurrence_service.dart';

/// Provider for RecurringPatternRepository
final recurringPatternRepositoryProvider = Provider<RecurringPatternRepository>((ref) {
  final isar = ref.watch(databaseProvider);
  return RecurringPatternRepository(isar);
});

/// Provider for RecurrenceService
final recurrenceServiceProvider = Provider<RecurrenceService>((ref) {
  final isar = ref.watch(databaseProvider);
  return RecurrenceService(isar);
});

/// Stream provider for recurring templates
final recurringTemplatesProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchRecurringTemplates();
});

/// Stream provider for all active recurring instances (next 30 days)
final upcomingRecurringInstancesProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    final now = DateTime.now();
    final thirtyDaysLater = now.add(const Duration(days: 30));

    return todos
        .where((t) =>
            t.isRecurring &&
            !t.isRecurringTemplate &&
            !t.isCompleted &&
            !t.isSkipped &&
            t.dueDate != null &&
            t.dueDate!.isAfter(now.subtract(const Duration(days: 1))) &&
            t.dueDate!.isBefore(thirtyDaysLater))
        .toList()
      ..sort((a, b) => a.dueDate!.compareTo(b.dueDate!));
  });
});

/// Family provider for specific series instances
final recurringSeriesProvider =
    StreamProvider.family<List<TodoTask>, String>((ref, seriesId) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    return todos
        .where((t) => t.recurringSeriesId == seriesId)
        .toList()
      ..sort((a, b) =>
          (a.dueDate ?? DateTime.now()).compareTo(b.dueDate ?? DateTime.now()));
  });
});

/// Provider for creating a recurring task
final createRecurringTaskProvider = Provider<
    Future<TodoTask> Function({
      required TodoTask template,
      required RecurringPattern pattern,
    })>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  final patternRepo = ref.watch(recurringPatternRepositoryProvider);
  final recurrenceService = ref.watch(recurrenceServiceProvider);

  return ({required template, required pattern}) async {
    // Save the pattern first
    await patternRepo.createPattern(pattern);

    // Create the recurring template
    final createdTemplate = await todoRepo.createRecurringTask(
      template: template,
      patternId: pattern.id,
    );

    // Generate initial instances
    final instances = await recurrenceService.generateInstances(
      createdTemplate,
      pattern,
      count: 90,
    );

    // Save instances to database
    if (instances.isNotEmpty) {
      final isar = ref.read(databaseProvider);
      await isar.writeTxn(() async {
        await isar.todoTasks.putAll(instances);
      });
    }

    return createdTemplate;
  };
});

/// Provider for deleting a recurring series
final deleteRecurringSeriesProvider =
    Provider<Future<int> Function(String seriesId)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  final patternRepo = ref.watch(recurringPatternRepositoryProvider);

  return (seriesId) async {
    // Get the template to find the pattern
    final template = await todoRepo.getRecurringTemplate(seriesId);
    if (template?.recurringPatternId != null) {
      await patternRepo.deletePattern(template!.recurringPatternId!);
    }

    // Delete all tasks in the series
    return await todoRepo.deleteEntireSeries(seriesId);
  };
});

/// Provider for skipping a recurring instance
final skipRecurringInstanceProvider =
    Provider<Future<void> Function(TodoTask instance)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (instance) => todoRepo.skipInstance(instance);
});

/// Provider for postponing a recurring instance
final postponeRecurringInstanceProvider =
    Provider<Future<void> Function(TodoTask instance, DateTime newDate)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (instance, newDate) => todoRepo.postponeInstance(instance, newDate);
});

/// Provider to get pattern for a template
final patternForTemplateProvider =
    FutureProvider.family<RecurringPattern?, int>((ref, patternId) {
  final patternRepo = ref.watch(recurringPatternRepositoryProvider);
  return patternRepo.getPattern(patternId);
});
