import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../database/database.dart';

/// Repository for managing task tags with Drift database
class TagRepository {
  final AppDatabase _db;

  TagRepository(this._db);

  // CREATE

  /// Create a new tag
  Future<int> createTag({
    required String name,
    required Color color,
    String? icon,
  }) async {
    // Check if tag with this name already exists
    final existing = await getTagByName(name);
    if (existing != null) {
      throw Exception('Tag with name "$name" already exists');
    }

    final entry = TaskTagsCompanion(
      name: Value(name),
      colorValue: Value(color.value), // ignore: deprecated_member_use
      icon: icon != null ? Value(icon) : const Value.absent(),
    );

    return await _db.into(_db.taskTags).insert(entry);
  }

  // READ

  /// Get all tags
  Future<List<TaskTag>> getAllTags() async {
    return await _db.select(_db.taskTags).get();
  }

  /// Get a tag by ID
  Future<TaskTag?> getTagById(int id) async {
    return await (_db.select(
      _db.taskTags,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get a tag by name
  Future<TaskTag?> getTagByName(String name) async {
    return await (_db.select(
      _db.taskTags,
    )..where((tbl) => tbl.name.equals(name))).getSingleOrNull();
  }

  /// Get tags for a specific task
  Future<List<TaskTag>> getTagsForTask(int taskId) async {
    final query = _db.select(_db.taskTags).join([
      innerJoin(
        _db.todoTaskTags,
        _db.todoTaskTags.tagId.equalsExp(_db.taskTags.id),
      ),
    ])..where(_db.todoTaskTags.taskId.equals(taskId));

    final rows = await query.get();
    return rows.map((row) => row.readTable(_db.taskTags)).toList();
  }

  /// Watch all tags (stream for reactive updates)
  Stream<List<TaskTag>> watchAllTags() {
    return _db.select(_db.taskTags).watch();
  }

  /// Watch a specific tag by ID
  Stream<TaskTag?> watchTagById(int id) {
    return (_db.select(
      _db.taskTags,
    )..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  /// Get tags sorted by usage (most used first)
  Future<List<TaskTag>> getTagsSortedByUsage() async {
    final query = _db.select(_db.taskTags).join([
      leftOuterJoin(
        _db.todoTaskTags,
        _db.todoTaskTags.tagId.equalsExp(_db.taskTags.id),
      ),
    ])..groupBy([_db.taskTags.id]);

    final results = await query.get();

    // Create a map of tag usage counts
    final tagUsage = <int, int>{};
    for (final result in results) {
      final tag = result.readTable(_db.taskTags);
      final taskId = result.readTableOrNull(_db.todoTaskTags)?.taskId;
      tagUsage[tag.id] = (tagUsage[tag.id] ?? 0) + (taskId != null ? 1 : 0);
    }

    // Get all tags and sort by usage
    final allTags = await getAllTags();
    allTags.sort(
      (a, b) => (tagUsage[b.id] ?? 0).compareTo(tagUsage[a.id] ?? 0),
    );

    return allTags;
  }

  /// Search tags by name
  Future<List<TaskTag>> searchTags(String query) async {
    return await (_db.select(
      _db.taskTags,
    )..where((tbl) => tbl.name.like('%$query%'))).get();
  }

  // UPDATE

  /// Update a tag
  Future<bool> updateTag(
    int id, {
    String? name,
    int? colorValue,
    String? icon,
  }) async {
    if (name != null) {
      // Check if new name already exists
      final existing = await getTagByName(name);
      if (existing != null && existing.id != id) {
        throw Exception('Tag with name "$name" already exists');
      }
    }

    return (await (_db.update(
          _db.taskTags,
        )..where((tbl) => tbl.id.equals(id))).write(
          TaskTagsCompanion(
            name: name != null ? Value(name) : const Value.absent(),
            colorValue: colorValue != null
                ? Value(colorValue)
                : const Value.absent(),
            icon: icon != null ? Value(icon) : const Value.absent(),
          ),
        )) >
        0;
  }

  /// Update tag name
  Future<bool> updateTagName(int tagId, String newName) async {
    return await updateTag(tagId, name: newName);
  }

  /// Update tag color
  Future<bool> updateTagColor(int tagId, Color newColor) async {
    return await updateTag(
      tagId,
      colorValue: newColor.value, // ignore: deprecated_member_use
    );
  }

  /// Update tag icon
  Future<bool> updateTagIcon(int tagId, String? newIcon) async {
    return await updateTag(tagId, icon: newIcon);
  }

  // DELETE

  /// Delete a tag
  /// This will also remove the tag from all associated tasks
  Future<bool> deleteTag(int tagId) async {
    // Delete tag associations first
    await (_db.delete(
      _db.todoTaskTags,
    )..where((tbl) => tbl.tagId.equals(tagId))).go();

    // Delete the tag
    final count = await (_db.delete(
      _db.taskTags,
    )..where((tbl) => tbl.id.equals(tagId))).go();

    return count > 0;
  }

  /// Delete a tag by name
  Future<bool> deleteTagByName(String name) async {
    final tag = await getTagByName(name);
    if (tag == null) return false;
    return await deleteTag(tag.id);
  }

  /// Delete all tags
  Future<int> deleteAllTags() async {
    // Delete all tag associations first
    await _db.delete(_db.todoTaskTags).go();
    // Delete all tags
    return await _db.delete(_db.taskTags).go();
  }

  // STATISTICS

  /// Get count of all tags
  Future<int> getTagCount() async {
    final result =
        await (_db.selectOnly(_db.taskTags)
              ..addColumns([_db.taskTags.id.count()]))
            .map((row) => row.read(_db.taskTags.id.count()))
            .getSingle();
    return result ?? 0;
  }

  /// Get count of tasks with a specific tag
  Future<int> getTagUsageCount(int tagId) async {
    final result =
        await (_db.selectOnly(_db.todoTaskTags)
              ..addColumns([_db.todoTaskTags.tagId.count()])
              ..where(_db.todoTaskTags.tagId.equals(tagId)))
            .map((row) => row.read(_db.todoTaskTags.tagId.count()))
            .getSingle();
    return result ?? 0;
  }

  /// Get color from color value
  static Color getColorFromValue(int colorValue) {
    return Color(colorValue);
  }
}
