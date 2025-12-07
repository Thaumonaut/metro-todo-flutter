import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/models/task_tag.dart';
import '../../../data/models/importance_level.dart';
import '../../../data/models/task_status.dart';
import '../../../data/providers/repository_providers.dart';
import '../../../data/database/database.dart'; // Import for TaskReminder

/// Provider for watching a specific task by UUID
final watchTaskProvider = StreamProvider.family<TodoTask?, String>((ref, uuid) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return todoRepo.watchTodoByUuid(uuid);
});

/// Provider for watching a specific task by ID
final watchTaskByIdProvider = StreamProvider.family<TodoTask?, int>((
  ref,
  id,
) async* {
  final todoRepo = ref.watch(todoRepositoryProvider);
  // Watch all tasks and filter for the one with matching ID
  // Note: efficiently we should add watchTodoById to repo, but this works for now
  // Actually repository has getTodoById but not explicit watchTodoById in the interface I viewed?
  // I viewed repository and it had watchTodoById? No, watchTodoByUuid.
  // But let's check the code I viewed in Step 287.
  // Line 69: getTodoById. Line 88: watchTodoByUuid.
  // So we filter stream of all todos? That's legacy Isar pattern maybe.
  // Drift allows watchSingle.
  // But let's stick to existing logic or improve it.
  // Existing logic calls watching all todos which is heavy.
  // Better: repo.watchTodoById(id). But repo doesn't implement it yet?
  // Let's implement it in repo later. For now, filter stream.
  await for (final tasks in todoRepo.watchAllTodos()) {
    try {
      yield tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      yield null;
    }
  }
});

/// Provider for watching reminders for a specific task
final watchTaskRemindersProvider =
    StreamProvider.family<List<TaskReminder>, int>((ref, taskId) {
      final todoRepo = ref.watch(todoRepositoryProvider);
      return todoRepo.watchReminders(taskId);
    });

/// Provider for creating a new task
final createTaskProvider =
    Provider<
      Future<TodoTask> Function({
        required String title,
        String? description,
        required ImportanceLevel importance,
        TaskStatus status,
        DateTime? dueDate,
        List<DateTime>? reminders,
        List<int>? tagIds, // Changed from List<TaskTag> to IDs to match repo
      })
    >((ref) {
      final todoRepo = ref.watch(todoRepositoryProvider);
      return ({
        required String title,
        String? description,
        required ImportanceLevel importance,
        TaskStatus status = TaskStatus.notStarted,
        DateTime? dueDate,
        List<DateTime>? reminders,
        List<int>? tagIds,
      }) async {
        final id = await todoRepo.createTodo(
          title: title,
          description: description,
          importance: importance,
          status: status,
          dueDate: dueDate,
          reminders: reminders,
          tagIds: tagIds,
        );
        final task = await todoRepo.getTodoById(id);
        if (task == null) throw Exception("Failed to create task");
        return task;
      };
    });

/// Provider for updating a task
final updateTaskProvider = Provider<Future<void> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.updateTodo(
    task.id,
    title: task.title,
    description: task.description,
    importance: ImportanceLevel.values.any((e) => e.name == task.importance)
        ? ImportanceLevel.values.byName(task.importance)
        : null,
    status: TaskStatus.values.any((e) => e.name == task.status)
        ? TaskStatus.values.byName(task.status)
        : null,
    dueDate: task.dueDate,
    reminderDateTime: task.reminderDateTime,
    isCompleted: task.isCompleted,
    completedAt: task.completedAt,
    isDueToday: task.isDueToday,
    isOverdue: task.isOverdue,
  );
});

/// Provider for deleting a task
final deleteTaskProvider = Provider<Future<bool> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.deleteTodo(task.id);
});

/// Provider for completing a task
final completeTaskProvider = Provider<Future<void> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.completeTodo(task.id);
});

/// Provider for uncompleting a task
final uncompleteTaskProvider = Provider<Future<void> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.uncompleteTodo(task.id);
});

/// Provider for adding a tag to a task
final addTagToTaskProvider = Provider<Future<void> Function(TodoTask, TaskTag)>(
  (ref) {
    final todoRepo = ref.watch(todoRepositoryProvider);
    return (TodoTask task, TaskTag tag) =>
        todoRepo.addTagToTodo(task.id, tag.id);
  },
);

/// Provider for removing a tag from a task
final removeTagFromTaskProvider =
    Provider<Future<void> Function(TodoTask, TaskTag)>((ref) {
      final todoRepo = ref.watch(todoRepositoryProvider);
      return (TodoTask task, TaskTag tag) =>
          todoRepo.removeTagFromTodo(task.id, tag.id);
    });

/// Provider for adding a reminder
final addReminderProvider = Provider<Future<void> Function(int, DateTime)>((
  ref,
) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (int taskId, DateTime scheduledAt) =>
      todoRepo.addReminder(taskId, scheduledAt);
});

/// Provider for removing a reminder
final removeReminderProvider = Provider<Future<void> Function(int)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (int reminderId) => todoRepo.removeReminder(reminderId);
});

/// Provider for watching all tags (for tag selector)
final watchAllTagsProvider = StreamProvider<List<TaskTag>>((ref) {
  final tagRepo = ref.watch(tagRepositoryProvider);
  return tagRepo.watchAllTags();
});
