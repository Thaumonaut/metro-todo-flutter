import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/recurring_pattern.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/models/importance_level.dart';
import '../../../data/providers/repository_providers.dart';
import '../../../data/repositories/recurring_pattern_repository.dart';
import '../../../data/services/recurrence_service.dart';

/// Provider for RecurringPatternRepository
final recurringPatternRepositoryProvider = Provider<RecurringPatternRepository>(
  (ref) {
    final db = ref.watch(databaseProvider);
    return RecurringPatternRepository(db);
  },
);

/// Provider for RecurrenceService
final recurrenceServiceProvider = Provider<RecurrenceService>((ref) {
  final db = ref.watch(databaseProvider);
  final todoRepo = ref.watch(todoRepositoryProvider);
  return RecurrenceService(db, todoRepo);
});

/// Stream provider for recurring templates
final recurringTemplatesProvider = StreamProvider<List<TodoTask>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchRecurringTemplates();
});

/// Stream provider for all active recurring instances (next 30 days)
final upcomingRecurringInstancesProvider = StreamProvider<List<TodoTask>>((
  ref,
) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    final now = DateTime.now();
    final thirtyDaysLater = now.add(const Duration(days: 30));

    return todos
        .where(
          (t) =>
              t.isRecurring &&
              !t.isRecurringTemplate &&
              !t.isCompleted &&
              !t.isSkipped &&
              t.dueDate != null &&
              t.dueDate!.isAfter(now.subtract(const Duration(days: 1))) &&
              t.dueDate!.isBefore(thirtyDaysLater),
        )
        .toList()
      ..sort((a, b) => a.dueDate!.compareTo(b.dueDate!));
  });
});

/// Family provider for specific series instances
final recurringSeriesProvider = StreamProvider.family<List<TodoTask>, String>((
  ref,
  seriesId,
) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.watchAllTodos().map((todos) {
    return todos.where((t) => t.recurringSeriesId == seriesId).toList()..sort(
      (a, b) =>
          (a.dueDate ?? DateTime.now()).compareTo(b.dueDate ?? DateTime.now()),
    );
  });
});

/// Provider for creating a recurring task
final createRecurringTaskProvider =
    Provider<
      Future<TodoTask> Function({
        required TodoTask template,
        required RecurringPattern pattern,
      })
    >((ref) {
      final todoRepo = ref.watch(todoRepositoryProvider);
      final patternRepo = ref.watch(recurringPatternRepositoryProvider);
      final recurrenceService = ref.watch(recurrenceServiceProvider);

      return ({required template, required pattern}) async {
        // Save the pattern first
        final patternId = await patternRepo.createPattern(
          type: RecurrenceType.values.byName(
            pattern.type.toString().split('.').last,
          ), // handle 'RecurrenceType.daily' or 'daily'
          // Actually pattern.type in RecurringPattern (Drift) is Enum or String?
          // In database.dart: text().map(const RecurrenceTypeConverter())
          // Wait, if I used Converter, it should be the Enum type in the generated class.
          // Let's check RecurringPattern definition in Drift generation.
          // IF I used IntEnum or TextEnum, it's Enum.
          // RecurrenceService manually defined RecurrenceType.
          // I used `text` in `recurring_patterns.dart` (original plan).
          // But I refactored `database.dart` to include `RecurringPatterns` table.
          // Let's assume pattern.type is RecurrenceType or String.
          // Step 160: `RecurringPattern` model (Drift generated) has `type` field.
          // If I didn't add a converter, it defaults to String for `text()`.
          // If so `pattern.type` is String.
          // RecurrenceType is enum.
          // So: RecurrenceType.values.byName(pattern.type)
          // But if pattern is ALREADY Drift class, `pattern.type` is whatever Drift generated.
          // If it is String, then:
          // type: RecurrenceType.values.byName(pattern.type),
          interval: pattern.interval,
          daysOfWeek: pattern.daysOfWeek?.split(',').map(int.parse).toList(),
          daysOfMonth: pattern.daysOfMonth?.split(',').map(int.parse).toList(),
          lastDayOfMonth: pattern.lastDayOfMonth ?? false,
          nthWeekday: pattern.nthWeekday,
          dayOfYear: pattern.dayOfYear,
          monthOfYear: pattern.monthOfYear,
          endDate: pattern.endDate,
          maxOccurrences: pattern.maxOccurrences,
        );

        final createdTemplateId = await todoRepo.createRecurringTask(
          title: template.title,
          description: template.description,
          importance: ImportanceLevel.values.byName(template.importance),
          recurringPatternId: patternId,
          seriesId: template.recurringSeriesId,
        );

        // generateInstances needs the full template object.
        final createdTemplate = await todoRepo.getTodoById(createdTemplateId);
        if (createdTemplate == null) {
          throw Exception("Failed to create template");
        }

        final savedPattern = await patternRepo.getPattern(patternId);

        if (savedPattern != null) {
          // Generate initial instances
          final companions = await recurrenceService.generateInstances(
            createdTemplate,
            savedPattern,
            count: 90,
          );

          // Save instances to database
          if (companions.isNotEmpty) {
            final db = ref.read(databaseProvider);
            await db.batch((batch) {
              batch.insertAll(db.todoTasks, companions);
            });
          }
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
    Provider<Future<void> Function(int instanceId)>((ref) {
      final todoRepo = ref.watch(todoRepositoryProvider);
      return (instanceId) => todoRepo.skipInstance(instanceId);
    });

/// Provider for postponing a recurring instance
final postponeRecurringInstanceProvider =
    Provider<Future<void> Function(int instanceId, DateTime newDate)>((ref) {
      final todoRepo = ref.watch(todoRepositoryProvider);
      return (instanceId, newDate) =>
          todoRepo.postponeInstance(instanceId, newDate);
    });

/// Provider to get pattern for a template
final patternForTemplateProvider =
    FutureProvider.family<RecurringPattern?, int>((ref, patternId) {
      final patternRepo = ref.watch(recurringPatternRepositoryProvider);
      return patternRepo.getPattern(patternId);
    });
