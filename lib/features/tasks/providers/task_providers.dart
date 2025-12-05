import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/todo_task.dart';
import '../../../data/models/task_tag.dart';
import '../../../data/models/importance_level.dart';
import '../../../data/models/task_status.dart';
import '../../../data/providers/repository_providers.dart';

/// Provider for watching a specific task by UUID
final watchTaskProvider =
    StreamProvider.family<TodoTask?, String>((ref, uuid) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return todoRepo.watchTodoByUuid(uuid);
});

/// Provider for watching a specific task by ID
final watchTaskByIdProvider =
    StreamProvider.family<TodoTask?, int>((ref, id) async* {
  final todoRepo = ref.watch(todoRepositoryProvider);
  // Watch all tasks and filter for the one with matching ID
  await for (final tasks in todoRepo.watchAllTodos()) {
    try {
      yield tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      yield null;
    }
  }
});

/// Provider for creating a new task
final createTaskProvider = Provider<Future<TodoTask> Function({
  required String title,
  String? description,
  required ImportanceLevel importance,
  TaskStatus status,
  DateTime? dueDate,
  List<TaskTag>? tags,
})>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return ({
    required String title,
    String? description,
    required ImportanceLevel importance,
    TaskStatus status = TaskStatus.notStarted,
    DateTime? dueDate,
    List<TaskTag>? tags,
  }) {
    return todoRepo.createTodo(
      title: title,
      description: description,
      importance: importance,
      status: status,
      dueDate: dueDate,
      tags: tags,
    );
  };
});

/// Provider for updating a task
final updateTaskProvider = Provider<Future<void> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.updateTodo(task);
});

/// Provider for deleting a task
final deleteTaskProvider = Provider<Future<bool> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.deleteTodo(task);
});

/// Provider for completing a task
final completeTaskProvider = Provider<Future<void> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.completeTodo(task);
});

/// Provider for uncompleting a task
final uncompleteTaskProvider =
    Provider<Future<void> Function(TodoTask)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task) => todoRepo.uncompleteTodo(task);
});

/// Provider for adding a tag to a task
final addTagToTaskProvider =
    Provider<Future<void> Function(TodoTask, TaskTag)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task, TaskTag tag) => todoRepo.addTagToTodo(task, tag);
});

/// Provider for removing a tag from a task
final removeTagFromTaskProvider =
    Provider<Future<void> Function(TodoTask, TaskTag)>((ref) {
  final todoRepo = ref.watch(todoRepositoryProvider);
  return (TodoTask task, TaskTag tag) => todoRepo.removeTagFromTodo(task, tag);
});

/// Provider for watching all tags (for tag selector)
final watchAllTagsProvider = StreamProvider<List<TaskTag>>((ref) {
  final tagRepo = ref.watch(tagRepositoryProvider);
  return tagRepo.watchAllTags();
});
