import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/todo_task.dart';
import '../models/task_tag.dart';
import '../models/importance_level.dart';
import '../models/task_status.dart';

/// Repository for managing todo tasks with Isar database
class TodoRepository {
  final Isar _isar;
  static const _uuid = Uuid();

  TodoRepository(this._isar);

  // CREATE

  /// Create a new todo task
  Future<TodoTask> createTodo({
    required String title,
    String? description,
    required ImportanceLevel importance,
    TaskStatus status = TaskStatus.notStarted,
    DateTime? dueDate,
    List<TaskTag>? tags,
  }) async {
    final task = TodoTask()
      ..uuid = _uuid.v4()
      ..title = title
      ..description = description
      ..importance = importance
      ..status = status
      ..dueDate = dueDate
      ..createdAt = DateTime.now()
      ..isCompleted = false;

    // Update computed properties
    task.updateComputedProperties();

    await _isar.writeTxn(() async {
      await _isar.todoTasks.put(task);

      // Link tags if provided
      if (tags != null && tags.isNotEmpty) {
        task.tags.addAll(tags);
        await task.tags.save();
      }
    });

    return task;
  }

  // READ

  /// Get all todo tasks
  Future<List<TodoTask>> getAllTodos() async {
    return await _isar.todoTasks.where().findAll();
  }

  /// Get a todo task by UUID
  Future<TodoTask?> getTodoByUuid(String uuid) async {
    return await _isar.todoTasks
        .filter()
        .uuidEqualTo(uuid)
        .findFirst();
  }

  /// Get a todo task by ID
  Future<TodoTask?> getTodoById(Id id) async {
    return await _isar.todoTasks.get(id);
  }

  /// Watch all todos (stream for reactive updates)
  Stream<List<TodoTask>> watchAllTodos() {
    return _isar.todoTasks.where().watch(fireImmediately: true);
  }

  /// Watch a specific todo by UUID
  Stream<TodoTask?> watchTodoByUuid(String uuid) {
    return _isar.todoTasks
        .filter()
        .uuidEqualTo(uuid)
        .watch(fireImmediately: true)
        .map((tasks) => tasks.isNotEmpty ? tasks.first : null);
  }

  /// Get todos due today
  Future<List<TodoTask>> getTodosDueToday() async {
    return await _isar.todoTasks
        .filter()
        .isDueTodayEqualTo(true)
        .and()
        .isCompletedEqualTo(false)
        .findAll();
  }

  /// Get overdue todos
  Future<List<TodoTask>> getOverdueTodos() async {
    return await _isar.todoTasks
        .filter()
        .isOverdueEqualTo(true)
        .and()
        .isCompletedEqualTo(false)
        .findAll();
  }

  /// Get todos by importance level
  Future<List<TodoTask>> getTodosByImportance(ImportanceLevel importance) async {
    return await _isar.todoTasks
        .filter()
        .importanceEqualTo(importance)
        .and()
        .isCompletedEqualTo(false)
        .findAll();
  }

  /// Get todos by status
  Future<List<TodoTask>> getTodosByStatus(TaskStatus status) async {
    return await _isar.todoTasks
        .filter()
        .statusEqualTo(status)
        .findAll();
  }

  /// Get completed todos
  Future<List<TodoTask>> getCompletedTodos() async {
    return await _isar.todoTasks
        .filter()
        .isCompletedEqualTo(true)
        .findAll();
  }

  /// Get incomplete todos
  Future<List<TodoTask>> getIncompleteTodos() async {
    return await _isar.todoTasks
        .filter()
        .isCompletedEqualTo(false)
        .findAll();
  }

  /// Get todos with a specific tag
  Future<List<TodoTask>> getTodosByTag(TaskTag tag) async {
    final taskTag = await _isar.taskTags.get(tag.id);
    if (taskTag == null) return [];

    await taskTag.tasks.load();
    return taskTag.tasks.toList();
  }

  /// Search todos by title
  Future<List<TodoTask>> searchTodos(String query) async {
    return await _isar.todoTasks
        .filter()
        .titleContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .findAll();
  }

  // UPDATE

  /// Update a todo task
  Future<void> updateTodo(TodoTask task) async {
    // Update computed properties before saving
    task.updateComputedProperties();

    await _isar.writeTxn(() async {
      await _isar.todoTasks.put(task);
    });
  }

  /// Mark a todo as completed
  Future<void> completeTodo(TodoTask task) async {
    task.isCompleted = true;
    task.completedAt = DateTime.now();
    task.status = TaskStatus.completed;
    await updateTodo(task);
  }

  /// Mark a todo as incomplete
  Future<void> uncompleteTodo(TodoTask task) async {
    task.isCompleted = false;
    task.completedAt = null;
    task.status = TaskStatus.notStarted;
    await updateTodo(task);
  }

  /// Add a tag to a todo
  Future<void> addTagToTodo(TodoTask task, TaskTag tag) async {
    await _isar.writeTxn(() async {
      task.tags.add(tag);
      await task.tags.save();
    });
  }

  /// Remove a tag from a todo
  Future<void> removeTagFromTodo(TodoTask task, TaskTag tag) async {
    await _isar.writeTxn(() async {
      task.tags.remove(tag);
      await task.tags.save();
    });
  }

  // DELETE

  /// Delete a todo task
  Future<bool> deleteTodo(TodoTask task) async {
    return await _isar.writeTxn(() async {
      return await _isar.todoTasks.delete(task.id);
    });
  }

  /// Delete a todo by UUID
  Future<bool> deleteTodoByUuid(String uuid) async {
    final task = await getTodoByUuid(uuid);
    if (task == null) return false;
    return await deleteTodo(task);
  }

  /// Delete all completed todos
  Future<int> deleteCompletedTodos() async {
    final completed = await getCompletedTodos();
    return await _isar.writeTxn(() async {
      return await _isar.todoTasks.deleteAll(completed.map((t) => t.id).toList());
    });
  }

  /// Delete all todos (use with caution!)
  Future<int> deleteAllTodos() async {
    return await _isar.writeTxn(() async {
      return await _isar.todoTasks.where().deleteAll();
    });
  }

  // STATISTICS

  /// Get count of all todos
  Future<int> getTodoCount() async {
    return await _isar.todoTasks.count();
  }

  /// Get count of completed todos
  Future<int> getCompletedCount() async {
    return await _isar.todoTasks
        .filter()
        .isCompletedEqualTo(true)
        .count();
  }

  /// Get count of incomplete todos
  Future<int> getIncompleteCount() async {
    return await _isar.todoTasks
        .filter()
        .isCompletedEqualTo(false)
        .count();
  }

  /// Get count of overdue todos
  Future<int> getOverdueCount() async {
    return await _isar.todoTasks
        .filter()
        .isOverdueEqualTo(true)
        .and()
        .isCompletedEqualTo(false)
        .count();
  }

  /// Get count of todos due today
  Future<int> getTodayCount() async {
    return await _isar.todoTasks
        .filter()
        .isDueTodayEqualTo(true)
        .and()
        .isCompletedEqualTo(false)
        .count();
  }

  // RECURRING TASKS

  /// Create a recurring task with pattern
  Future<TodoTask> createRecurringTask({
    required TodoTask template,
    required int patternId,
    String? seriesId,
  }) async {
    final series = seriesId ?? _uuid.v4();

    template.isRecurring = true;
    template.isRecurringTemplate = true;
    template.recurringPatternId = patternId;
    template.recurringSeriesId = series;
    template.isRecurringException = false;
    template.isSkipped = false;
    template.updateComputedProperties();

    await _isar.writeTxn(() async {
      await _isar.todoTasks.put(template);
    });

    return template;
  }

  /// Get all recurring templates
  Future<List<TodoTask>> getRecurringTemplates() async {
    return await _isar.todoTasks
        .filter()
        .isRecurringTemplateEqualTo(true)
        .findAll();
  }

  /// Get all instances of a recurring series
  Future<List<TodoTask>> getRecurringInstances(String seriesId) async {
    return await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(seriesId)
        .and()
        .isRecurringTemplateEqualTo(false)
        .sortByDueDate()
        .findAll();
  }

  /// Get the template for a recurring series
  Future<TodoTask?> getRecurringTemplate(String seriesId) async {
    return await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(seriesId)
        .and()
        .isRecurringTemplateEqualTo(true)
        .findFirst();
  }

  /// Update a single instance
  Future<void> updateSingleInstance(TodoTask instance) async {
    instance.isRecurringException = true;
    instance.updateComputedProperties();
    await updateTodo(instance);
  }

  /// Update entire series
  Future<void> updateEntireSeries(String seriesId, TodoTask updates) async {
    final tasks = await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(seriesId)
        .findAll();

    await _isar.writeTxn(() async {
      for (final task in tasks) {
        if (task.isRecurringException) continue; // Skip exceptions

        task.title = updates.title;
        task.description = updates.description;
        task.importance = updates.importance;
        task.updateComputedProperties();
        await _isar.todoTasks.put(task);
      }
    });
  }

  /// Update future instances (from a specific instance onwards)
  Future<void> updateFutureInstances(TodoTask fromInstance, TodoTask updates) async {
    if (fromInstance.recurringSeriesId == null) return;

    final tasks = await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(fromInstance.recurringSeriesId!)
        .and()
        .isRecurringTemplateEqualTo(false)
        .findAll();

    await _isar.writeTxn(() async {
      for (final task in tasks) {
        if (task.isRecurringException) continue;
        if (task.recurringInstanceNumber == null || fromInstance.recurringInstanceNumber == null) {
          continue;
        }
        if (task.recurringInstanceNumber! < fromInstance.recurringInstanceNumber!) {
          continue;
        }

        task.title = updates.title;
        task.description = updates.description;
        task.importance = updates.importance;
        task.updateComputedProperties();
        await _isar.todoTasks.put(task);
      }
    });
  }

  /// Delete a single instance
  Future<bool> deleteSingleInstance(TodoTask instance) async {
    return await deleteTodo(instance);
  }

  /// Delete entire series
  Future<int> deleteEntireSeries(String seriesId) async {
    final tasks = await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(seriesId)
        .findAll();

    await _isar.writeTxn(() async {
      for (final task in tasks) {
        await _isar.todoTasks.delete(task.id);
      }
    });

    return tasks.length;
  }

  /// Delete this and future instances
  Future<int> deleteFutureInstances(TodoTask fromInstance) async {
    if (fromInstance.recurringSeriesId == null) return 0;

    final tasks = await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(fromInstance.recurringSeriesId!)
        .and()
        .isRecurringTemplateEqualTo(false)
        .findAll();

    var deletedCount = 0;

    await _isar.writeTxn(() async {
      for (final task in tasks) {
        if (task.recurringInstanceNumber == null || fromInstance.recurringInstanceNumber == null) {
          continue;
        }
        if (task.recurringInstanceNumber! >= fromInstance.recurringInstanceNumber!) {
          await _isar.todoTasks.delete(task.id);
          deletedCount++;
        }
      }
    });

    return deletedCount;
  }

  /// Skip an instance
  Future<void> skipInstance(TodoTask instance) async {
    instance.isSkipped = true;
    instance.updateComputedProperties();
    await updateTodo(instance);
  }

  /// Postpone an instance to a new date
  Future<void> postponeInstance(TodoTask instance, DateTime newDate) async {
    instance.dueDate = newDate;
    instance.isRecurringException = true;
    instance.updateComputedProperties();
    await updateTodo(instance);
  }

  /// Cleanup old completed instances
  Future<int> cleanupOldInstances({int daysToKeep = 30}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));

    final oldInstances = await _isar.todoTasks
        .filter()
        .isRecurringEqualTo(true)
        .and()
        .isRecurringTemplateEqualTo(false)
        .and()
        .isCompletedEqualTo(true)
        .and()
        .isRecurringExceptionEqualTo(false)
        .and()
        .completedAtLessThan(cutoffDate)
        .findAll();

    await _isar.writeTxn(() async {
      for (final task in oldInstances) {
        await _isar.todoTasks.delete(task.id);
      }
    });

    return oldInstances.length;
  }

  /// Stream of recurring templates
  Stream<List<TodoTask>> watchRecurringTemplates() {
    return _isar.todoTasks
        .filter()
        .isRecurringTemplateEqualTo(true)
        .watch(fireImmediately: true);
  }

  /// Get upcoming instances for a series
  Future<List<TodoTask>> getUpcomingInstances(String seriesId, {int count = 10}) async {
    final now = DateTime.now();
    return await _isar.todoTasks
        .filter()
        .recurringSeriesIdEqualTo(seriesId)
        .and()
        .isRecurringTemplateEqualTo(false)
        .and()
        .isCompletedEqualTo(false)
        .and()
        .dueDateGreaterThan(now)
        .sortByDueDate()
        .limit(count)
        .findAll();
  }

  // BULK OPERATIONS

  /// Complete multiple tasks at once
  Future<int> bulkComplete(List<TodoTask> tasks) async {
    await _isar.writeTxn(() async {
      for (final task in tasks) {
        task.isCompleted = true;
        task.completedAt = DateTime.now();
        task.status = TaskStatus.completed;
        task.updateComputedProperties();
        await _isar.todoTasks.put(task);
      }
    });
    return tasks.length;
  }

  /// Delete multiple tasks at once
  Future<int> bulkDelete(List<TodoTask> tasks) async {
    await _isar.writeTxn(() async {
      for (final task in tasks) {
        await _isar.todoTasks.delete(task.id);
      }
    });
    return tasks.length;
  }

  /// Update importance for multiple tasks
  Future<int> bulkUpdateImportance(List<TodoTask> tasks, ImportanceLevel importance) async {
    await _isar.writeTxn(() async {
      for (final task in tasks) {
        task.importance = importance;
        task.updateComputedProperties();
        await _isar.todoTasks.put(task);
      }
    });
    return tasks.length;
  }

  /// Add a tag to multiple tasks
  Future<int> bulkAddTag(List<TodoTask> tasks, TaskTag tag) async {
    await _isar.writeTxn(() async {
      for (final task in tasks) {
        task.tags.add(tag);
        await task.tags.save();
      }
    });
    return tasks.length;
  }

  /// Remove a tag from multiple tasks
  Future<int> bulkRemoveTag(List<TodoTask> tasks, TaskTag tag) async {
    await _isar.writeTxn(() async {
      for (final task in tasks) {
        task.tags.remove(tag);
        await task.tags.save();
      }
    });
    return tasks.length;
  }
}
