import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../database/database.dart';
import '../models/importance_level.dart';
import '../models/task_status.dart';

/// Repository for managing todo tasks with Drift database
class TodoRepository {
  final AppDatabase _db;
  static const _uuid = Uuid();

  TodoRepository(this._db);

  // CREATE

  /// Create a new todo task
  /// Create a new todo task
  Future<int> createTodo({
    required String title,
    String? description,
    required ImportanceLevel importance,
    TaskStatus status = TaskStatus.notStarted,
    DateTime? dueDate,
    List<DateTime>? reminders,
    List<int>? tagIds,
  }) async {
    final now = DateTime.now();
    final isDueToday = _isDueToday(dueDate);
    final isOverdue = _isOverdue(dueDate);

    final entry = TodoTasksCompanion(
      uuid: Value(_uuid.v4()),
      title: Value(title),
      description: description != null
          ? Value(description)
          : const Value.absent(),
      importance: Value(importance.name),
      status: Value(status.name),
      dueDate: dueDate != null ? Value(dueDate) : const Value.absent(),
      createdAt: Value(now),
      isCompleted: const Value(false),
      isDueToday: Value(isDueToday),
      isOverdue: Value(isOverdue),
    );

    final taskId = await _db.into(_db.todoTasks).insert(entry);

    // Add reminders if provided
    if (reminders != null && reminders.isNotEmpty) {
      for (final date in reminders) {
        await _db
            .into(_db.taskReminders)
            .insert(
              TaskRemindersCompanion(
                taskId: Value(taskId),
                scheduledAt: Value(date),
              ),
            );
      }
      // Update the next reminder field
      await _updateNextReminder(taskId);
    }

    // Link tags if provided
    if (tagIds != null && tagIds.isNotEmpty) {
      for (final tagId in tagIds) {
        await _db
            .into(_db.todoTaskTags)
            .insert(
              TodoTaskTagsCompanion(taskId: Value(taskId), tagId: Value(tagId)),
              onConflict: DoNothing(),
            );
      }
    }

    return taskId;
  }

  // READ

  /// Get all todo tasks
  Future<List<TodoTask>> getAllTodos() async {
    return await _db.select(_db.todoTasks).get();
  }

  /// Get a todo task by ID
  Future<TodoTask?> getTodoById(int id) async {
    return await (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get a todo task by UUID
  Future<TodoTask?> getTodoByUuid(String uuid) async {
    return await (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.uuid.equals(uuid))).getSingleOrNull();
  }

  /// Watch all todos (stream for reactive updates)
  Stream<List<TodoTask>> watchAllTodos() {
    return (_db.select(_db.todoTasks)).watch();
  }

  /// Watch a specific todo by UUID
  Stream<TodoTask?> watchTodoByUuid(String uuid) {
    return (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.uuid.equals(uuid))).watchSingleOrNull();
  }

  /// Get todos due today
  Future<List<TodoTask>> getTodosDueToday() async {
    return await (_db.select(_db.todoTasks)..where(
          (tbl) => tbl.isDueToday.equals(true) & tbl.isCompleted.equals(false),
        ))
        .get();
  }

  /// Get overdue todos
  Future<List<TodoTask>> getOverdueTodos() async {
    return await (_db.select(_db.todoTasks)..where(
          (tbl) => tbl.isOverdue.equals(true) & tbl.isCompleted.equals(false),
        ))
        .get();
  }

  /// Get todos by importance level
  Future<List<TodoTask>> getTodosByImportance(
    ImportanceLevel importance,
  ) async {
    return await (_db.select(_db.todoTasks)..where(
          (tbl) =>
              tbl.importance.equals(importance.name) &
              tbl.isCompleted.equals(false),
        ))
        .get();
  }

  /// Get todos by status
  Future<List<TodoTask>> getTodosByStatus(TaskStatus status) async {
    return await (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.status.equals(status.name))).get();
  }

  /// Get completed todos
  Future<List<TodoTask>> getCompletedTodos() async {
    return await (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.isCompleted.equals(true))).get();
  }

  /// Get incomplete todos
  Future<List<TodoTask>> getIncompleteTodos() async {
    return await (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.isCompleted.equals(false))).get();
  }

  /// Get todos with a specific tag
  Future<List<TodoTask>> getTodosByTag(int tagId) async {
    final query = _db.select(_db.todoTasks).join([
      innerJoin(
        _db.todoTaskTags,
        _db.todoTaskTags.taskId.equalsExp(_db.todoTasks.id),
      ),
    ])..where(_db.todoTaskTags.tagId.equals(tagId));

    final rows = await query.get();
    return rows.map((row) => row.readTable(_db.todoTasks)).toList();
  }

  /// Search todos by title or description
  Future<List<TodoTask>> searchTodos(String query) async {
    return await (_db.select(_db.todoTasks)..where(
          (tbl) =>
              tbl.title.like('%$query%') | tbl.description.like('%$query%'),
        ))
        .get();
  }

  // UPDATE

  /// Update a todo task
  Future<bool> updateTodo(
    int id, {
    String? title,
    String? description,
    ImportanceLevel? importance,
    TaskStatus? status,
    DateTime? dueDate,
    List<DateTime>? reminders, // Replaces existing reminders if provided
    DateTime?
    reminderDateTime, // Optional: Update the cached next reminder directly
    bool? isCompleted,
    DateTime? completedAt,
    bool? isDueToday,
    bool? isOverdue,
  }) async {
    final success =
        await (_db.update(
          _db.todoTasks,
        )..where((tbl) => tbl.id.equals(id))).write(
          TodoTasksCompanion(
            title: title != null ? Value(title) : const Value.absent(),
            description: description != null
                ? Value(description)
                : const Value.absent(),
            importance: importance != null
                ? Value(importance.name)
                : const Value.absent(),
            status: status != null ? Value(status.name) : const Value.absent(),
            dueDate: dueDate != null ? Value(dueDate) : const Value.absent(),
            reminderDateTime: reminderDateTime != null
                ? Value(reminderDateTime)
                : const Value.absent(),
            isCompleted: isCompleted != null
                ? Value(isCompleted)
                : const Value.absent(),
            completedAt: completedAt != null
                ? Value(completedAt)
                : const Value.absent(),
            isDueToday: isDueToday != null
                ? Value(isDueToday)
                : const Value.absent(),
            isOverdue: isOverdue != null
                ? Value(isOverdue)
                : const Value.absent(),
          ),
        ) >
        0;

    if (reminders != null) {
      // Delete existing reminders
      await (_db.delete(
        _db.taskReminders,
      )..where((tbl) => tbl.taskId.equals(id))).go();

      // Add new ones
      for (final date in reminders) {
        await _db
            .into(_db.taskReminders)
            .insert(
              TaskRemindersCompanion(
                taskId: Value(id),
                scheduledAt: Value(date),
              ),
            );
      }
      // Update next reminder
      await _updateNextReminder(id);
    }

    return success;
  }

  // REMINDERS

  /// Get reminders for a task
  Future<List<TaskReminder>> getReminders(int taskId) async {
    return await (_db.select(_db.taskReminders)
          ..where((tbl) => tbl.taskId.equals(taskId))
          ..orderBy([(t) => OrderingTerm(expression: t.scheduledAt)]))
        .get();
  }

  /// Watch reminders for a task
  Stream<List<TaskReminder>> watchReminders(int taskId) {
    return (_db.select(_db.taskReminders)
          ..where((tbl) => tbl.taskId.equals(taskId))
          ..orderBy([(t) => OrderingTerm(expression: t.scheduledAt)]))
        .watch();
  }

  /// Add a reminder
  Future<void> addReminder(int taskId, DateTime scheduledAt) async {
    await _db
        .into(_db.taskReminders)
        .insert(
          TaskRemindersCompanion(
            taskId: Value(taskId),
            scheduledAt: Value(scheduledAt),
          ),
        );
    await _updateNextReminder(taskId);
  }

  /// Remove a reminder
  Future<void> removeReminder(int reminderId) async {
    final reminder = await (_db.select(
      _db.taskReminders,
    )..where((tbl) => tbl.id.equals(reminderId))).getSingleOrNull();

    if (reminder != null) {
      await _db.delete(_db.taskReminders).delete(reminder);
      await _updateNextReminder(reminder.taskId);
    }
  }

  /// Update the legacy/cache `reminderDateTime` field on the task
  Future<void> _updateNextReminder(int taskId) async {
    final reminders = await getReminders(taskId);
    final now = DateTime.now();
    final upcoming = reminders
        .where((r) => r.scheduledAt.isAfter(now))
        .toList();
    // Already sorted by query, but ensure
    upcoming.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

    final next = upcoming.isNotEmpty ? upcoming.first.scheduledAt : null;

    // We avoid infinite loop by calling updateTodo WITHOUT reminders list
    await updateTodo(taskId, reminderDateTime: next);
  }

  /// Mark a todo as completed
  Future<bool> completeTodo(int taskId) async {
    return await updateTodo(
      taskId,
      isCompleted: true,
      completedAt: DateTime.now(),
      status: TaskStatus.completed,
    );
  }

  /// Mark a todo as incomplete
  Future<bool> uncompleteTodo(int taskId) async {
    return await updateTodo(
      taskId,
      isCompleted: false,
      completedAt: null,
      status: TaskStatus.notStarted,
    );
  }

  /// Add a tag to a todo
  Future<void> addTagToTodo(int taskId, int tagId) async {
    await _db
        .into(_db.todoTaskTags)
        .insert(
          TodoTaskTagsCompanion(taskId: Value(taskId), tagId: Value(tagId)),
          onConflict: DoNothing(),
        );
  }

  /// Remove a tag from a todo
  Future<void> removeTagFromTodo(int taskId, int tagId) async {
    await (_db.delete(_db.todoTaskTags)
          ..where((tbl) => tbl.taskId.equals(taskId) & tbl.tagId.equals(tagId)))
        .go();
  }

  // DELETE

  /// Delete a todo task
  Future<bool> deleteTodo(int taskId) async {
    // Delete tag associations
    await (_db.delete(
      _db.todoTaskTags,
    )..where((tbl) => tbl.taskId.equals(taskId))).go();

    // Delete the task
    final count = await (_db.delete(
      _db.todoTasks,
    )..where((tbl) => tbl.id.equals(taskId))).go();

    return count > 0;
  }

  /// Delete a todo by UUID
  Future<bool> deleteTodoByUuid(String uuid) async {
    final task = await getTodoByUuid(uuid);
    if (task == null) return false;
    return await deleteTodo(task.id);
  }

  /// Delete all completed todos
  Future<int> deleteCompletedTodos() async {
    return await (_db.delete(
      _db.todoTasks,
    )..where((tbl) => tbl.isCompleted.equals(true))).go();
  }

  /// Delete all todos (use with caution!)
  Future<int> deleteAllTodos() async {
    // Delete all tag associations first
    await _db.delete(_db.todoTaskTags).go();
    // Delete all tasks
    return await _db.delete(_db.todoTasks).go();
  }

  // STATISTICS

  /// Get count of all todos
  Future<int> getTodoCount() async {
    final result =
        await (_db.selectOnly(_db.todoTasks)
              ..addColumns([_db.todoTasks.id.count()]))
            .map((row) => row.read(_db.todoTasks.id.count()))
            .getSingle();
    return result ?? 0;
  }

  /// Get count of completed todos
  Future<int> getCompletedCount() async {
    final result =
        await (_db.selectOnly(_db.todoTasks)
              ..addColumns([_db.todoTasks.id.count()])
              ..where(_db.todoTasks.isCompleted.equals(true)))
            .map((row) => row.read(_db.todoTasks.id.count()))
            .getSingle();
    return result ?? 0;
  }

  /// Get count of incomplete todos
  Future<int> getIncompleteCount() async {
    final result =
        await (_db.selectOnly(_db.todoTasks)
              ..addColumns([_db.todoTasks.id.count()])
              ..where(_db.todoTasks.isCompleted.equals(false)))
            .map((row) => row.read(_db.todoTasks.id.count()))
            .getSingle();
    return result ?? 0;
  }

  /// Get count of overdue todos
  Future<int> getOverdueCount() async {
    final result =
        await (_db.selectOnly(_db.todoTasks)
              ..addColumns([_db.todoTasks.id.count()])
              ..where(
                _db.todoTasks.isOverdue.equals(true) &
                    _db.todoTasks.isCompleted.equals(false),
              ))
            .map((row) => row.read(_db.todoTasks.id.count()))
            .getSingle();
    return result ?? 0;
  }

  /// Get count of todos due today
  Future<int> getTodayCount() async {
    final result =
        await (_db.selectOnly(_db.todoTasks)
              ..addColumns([_db.todoTasks.id.count()])
              ..where(
                _db.todoTasks.isDueToday.equals(true) &
                    _db.todoTasks.isCompleted.equals(false),
              ))
            .map((row) => row.read(_db.todoTasks.id.count()))
            .getSingle();
    return result ?? 0;
  }

  // RECURRING TASKS

  /// Create a recurring task with pattern
  Future<int> createRecurringTask({
    required String title,
    required ImportanceLevel importance,
    required int recurringPatternId,
    String? description,
    String? seriesId,
  }) async {
    final series = seriesId ?? _uuid.v4();

    final now = DateTime.now();
    final entry = TodoTasksCompanion(
      uuid: Value(_uuid.v4()),
      title: Value(title),
      description: description != null
          ? Value(description)
          : const Value.absent(),
      importance: Value(importance.name),
      status: Value(TaskStatus.notStarted.name),
      createdAt: Value(now),
      isRecurring: const Value(true),
      isRecurringTemplate: const Value(true),
      recurringSeriesId: Value(series),
      isCompleted: const Value(false),
    );

    return await _db.into(_db.todoTasks).insert(entry);
  }

  /// Get all recurring templates
  Future<List<TodoTask>> getRecurringTemplates() async {
    return await (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.isRecurringTemplate.equals(true))).get();
  }

  /// Get all instances of a recurring series
  Future<List<TodoTask>> getRecurringInstances(String seriesId) async {
    return await (_db.select(_db.todoTasks)
          ..where(
            (tbl) =>
                tbl.recurringSeriesId.equals(seriesId) &
                tbl.isRecurringTemplate.equals(false),
          )
          ..orderBy([(t) => OrderingTerm(expression: t.dueDate)]))
        .get();
  }

  /// Get the template for a recurring series
  Future<TodoTask?> getRecurringTemplate(String seriesId) async {
    return await (_db.select(_db.todoTasks)..where(
          (tbl) =>
              tbl.recurringSeriesId.equals(seriesId) &
              tbl.isRecurringTemplate.equals(true),
        ))
        .getSingleOrNull();
  }

  /// Update entire series
  Future<void> updateEntireSeries(
    String seriesId, {
    String? title,
    String? description,
    ImportanceLevel? importance,
  }) async {
    await (_db.update(_db.todoTasks)..where(
          (tbl) =>
              tbl.recurringSeriesId.equals(seriesId) &
              tbl.isRecurringException.equals(false),
        ))
        .write(
          TodoTasksCompanion(
            title: title != null ? Value(title) : const Value.absent(),
            description: description != null
                ? Value(description)
                : const Value.absent(),
            importance: importance != null
                ? Value(importance.name)
                : const Value.absent(),
          ),
        );
  }

  /// Update future instances (from a specific instance onwards)
  Future<void> updateFutureInstances(
    int fromInstanceId, {
    String? title,
    String? description,
    ImportanceLevel? importance,
  }) async {
    final fromTask = await getTodoById(fromInstanceId);
    if (fromTask == null || fromTask.recurringSeriesId == null) return;

    final instances = await getRecurringInstances(fromTask.recurringSeriesId!);
    final instanceNumber = fromTask.recurringInstanceNumber ?? 0;

    for (final instance in instances) {
      if (instance.isRecurringException) continue;
      if ((instance.recurringInstanceNumber ?? 0) >= instanceNumber) {
        await updateTodo(
          instance.id,
          title: title,
          description: description,
          importance: importance,
        );
      }
    }
  }

  /// Delete entire series
  Future<int> deleteEntireSeries(String seriesId) async {
    return await (_db.delete(
      _db.todoTasks,
    )..where((tbl) => tbl.recurringSeriesId.equals(seriesId))).go();
  }

  /// Delete this and future instances
  Future<int> deleteFutureInstances(int fromInstanceId) async {
    final fromTask = await getTodoById(fromInstanceId);
    if (fromTask == null || fromTask.recurringSeriesId == null) return 0;

    final instances = await getRecurringInstances(fromTask.recurringSeriesId!);
    final instanceNumber = fromTask.recurringInstanceNumber ?? 0;

    var deletedCount = 0;
    for (final instance in instances) {
      if ((instance.recurringInstanceNumber ?? 0) >= instanceNumber) {
        await deleteTodo(instance.id);
        deletedCount++;
      }
    }

    return deletedCount;
  }

  /// Skip an instance
  Future<bool> skipInstance(int instanceId) async {
    return await updateTodo(instanceId, isCompleted: true);
  }

  /// Postpone an instance to a new date
  Future<bool> postponeInstance(int instanceId, DateTime newDate) async {
    return await updateTodo(instanceId, dueDate: newDate);
  }

  /// Cleanup old completed instances
  Future<int> cleanupOldInstances({int daysToKeep = 30}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));

    return await (_db.delete(_db.todoTasks)..where(
          (tbl) =>
              tbl.isRecurring.equals(true) &
              tbl.isRecurringTemplate.equals(false) &
              tbl.isCompleted.equals(true) &
              tbl.isRecurringException.equals(false) &
              tbl.completedAt.isSmallerThanValue(cutoffDate),
        ))
        .go();
  }

  /// Stream of recurring templates
  Stream<List<TodoTask>> watchRecurringTemplates() {
    return (_db.select(
      _db.todoTasks,
    )..where((tbl) => tbl.isRecurringTemplate.equals(true))).watch();
  }

  /// Get upcoming instances for a series
  Future<List<TodoTask>> getUpcomingInstances(
    String seriesId, {
    int count = 10,
  }) async {
    final now = DateTime.now();
    return await (_db.select(_db.todoTasks)
          ..where(
            (tbl) =>
                tbl.recurringSeriesId.equals(seriesId) &
                tbl.isRecurringTemplate.equals(false) &
                tbl.isCompleted.equals(false) &
                tbl.dueDate.isBiggerThanValue(now),
          )
          ..orderBy([(t) => OrderingTerm(expression: t.dueDate)])
          ..limit(count))
        .get();
  }

  // BULK OPERATIONS

  /// Complete multiple tasks at once
  Future<int> bulkComplete(List<int> taskIds) async {
    return await (_db.update(
      _db.todoTasks,
    )..where((tbl) => tbl.id.isIn(taskIds))).write(
      TodoTasksCompanion(
        isCompleted: const Value(true),
        completedAt: Value(DateTime.now()),
        status: Value(TaskStatus.completed.name),
      ),
    );
  }

  /// Delete multiple tasks at once
  Future<int> bulkDelete(List<int> taskIds) async {
    return await (_db.delete(
      _db.todoTasks,
    )..where((tbl) => tbl.id.isIn(taskIds))).go();
  }

  /// Update importance for multiple tasks
  Future<int> bulkUpdateImportance(
    List<int> taskIds,
    ImportanceLevel importance,
  ) async {
    return await (_db.update(_db.todoTasks)
          ..where((tbl) => tbl.id.isIn(taskIds)))
        .write(TodoTasksCompanion(importance: Value(importance.name)));
  }

  /// Add a tag to multiple tasks
  Future<int> bulkAddTag(List<int> taskIds, int tagId) async {
    var count = 0;
    for (final taskId in taskIds) {
      await _db
          .into(_db.todoTaskTags)
          .insert(
            TodoTaskTagsCompanion(taskId: Value(taskId), tagId: Value(tagId)),
            onConflict: DoNothing(),
          );
      count++;
    }
    return count;
  }

  /// Remove a tag from multiple tasks
  Future<int> bulkRemoveTag(List<int> taskIds, int tagId) async {
    return await (_db.delete(
      _db.todoTaskTags,
    )..where((tbl) => tbl.taskId.isIn(taskIds) & tbl.tagId.equals(tagId))).go();
  }

  // HELPER METHODS

  bool _isDueToday(DateTime? dueDate) {
    if (dueDate == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(dueDate.year, dueDate.month, dueDate.day);
    return date.isAtSameMomentAs(today);
  }

  bool _isOverdue(DateTime? dueDate) {
    if (dueDate == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(dueDate.year, dueDate.month, dueDate.day);
    return date.isBefore(today);
  }
}
