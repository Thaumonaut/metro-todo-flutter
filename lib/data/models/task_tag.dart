import 'package:isar/isar.dart';
import 'todo_task.dart';

part 'task_tag.g.dart';

/// Isar collection model for task tags
@collection
class TaskTag {
  /// Auto-incrementing ID for Isar
  Id id = Isar.autoIncrement;

  /// Tag name (must be unique)
  @Index(unique: true)
  late String name;

  /// Color value stored as int (use Color.value)
  late int colorValue;

  /// Optional icon/emoji for the tag
  String? icon;

  /// Backlink to todos that have this tag
  @Backlink(to: 'tags')
  final tasks = IsarLinks<TodoTask>();
}
