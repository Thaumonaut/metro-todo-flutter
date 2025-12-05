import 'package:isar/isar.dart';
import 'task_tag.dart';
import 'importance_level.dart';
import 'task_status.dart';

part 'todo_task.g.dart';

/// Isar collection model for todo tasks
@collection
class TodoTask {
  /// Auto-incrementing ID for Isar
  Id id = Isar.autoIncrement;

  /// UUID for potential future sync functionality
  late String uuid;

  /// Task title
  late String title;

  /// Optional task description
  String? description;

  /// Importance level (Low, Medium, High, Critical)
  @Enumerated(EnumType.name)
  late ImportanceLevel importance;

  /// Task status (Not Started, In Progress, On Hold, Completed)
  @Enumerated(EnumType.name)
  late TaskStatus status;

  /// Optional due date
  DateTime? dueDate;

  /// Creation timestamp
  late DateTime createdAt;

  /// Completion timestamp (null if not completed)
  DateTime? completedAt;

  /// Whether the task is completed
  late bool isCompleted;

  /// Many-to-many relationship with tags
  final tags = IsarLinks<TaskTag>();

  /// Computed property: is the task due today?
  /// Indexed for fast queries
  @Index()
  late bool isDueToday;

  /// Computed property: is the task overdue?
  /// Indexed for fast queries
  @Index()
  late bool isOverdue;

  /// Helper method to get importance value for sorting
  int get importanceValue => importance.value;

  /// Helper method to update computed properties
  void updateComputedProperties() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (dueDate != null) {
      final dueDateOnly = DateTime(dueDate!.year, dueDate!.month, dueDate!.day);
      isDueToday = dueDateOnly.isAtSameMomentAs(today);
      isOverdue = dueDateOnly.isBefore(today) && !isCompleted;
    } else {
      isDueToday = false;
      isOverdue = false;
    }
  }
}
