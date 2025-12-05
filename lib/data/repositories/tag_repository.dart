import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/task_tag.dart';

/// Repository for managing task tags with Isar database
class TagRepository {
  final Isar _isar;

  TagRepository(this._isar);

  // CREATE

  /// Create a new tag
  Future<TaskTag> createTag({
    required String name,
    required Color color,
    String? icon,
  }) async {
    // Check if tag with this name already exists
    final existing = await getTagByName(name);
    if (existing != null) {
      throw Exception('Tag with name "$name" already exists');
    }

    final tag = TaskTag()
      ..name = name
      ..colorValue = color.toARGB32()
      ..icon = icon;

    await _isar.writeTxn(() async {
      await _isar.taskTags.put(tag);
    });

    return tag;
  }

  // READ

  /// Get all tags
  Future<List<TaskTag>> getAllTags() async {
    return await _isar.taskTags.where().findAll();
  }

  /// Get a tag by ID
  Future<TaskTag?> getTagById(Id id) async {
    return await _isar.taskTags.get(id);
  }

  /// Get a tag by name
  Future<TaskTag?> getTagByName(String name) async {
    return await _isar.taskTags
        .filter()
        .nameEqualTo(name)
        .findFirst();
  }

  /// Watch all tags (stream for reactive updates)
  Stream<List<TaskTag>> watchAllTags() {
    return _isar.taskTags.where().watch(fireImmediately: true);
  }

  /// Watch a specific tag by ID
  Stream<TaskTag?> watchTagById(Id id) {
    return _isar.taskTags
        .watchObject(id, fireImmediately: true);
  }

  /// Get tags sorted by usage (most used first)
  Future<List<TaskTag>> getTagsSortedByUsage() async {
    final tags = await getAllTags();

    // Load task relationships for each tag
    for (final tag in tags) {
      await tag.tasks.load();
    }

    // Sort by number of associated tasks (descending)
    tags.sort((a, b) => b.tasks.length.compareTo(a.tasks.length));

    return tags;
  }

  /// Search tags by name
  Future<List<TaskTag>> searchTags(String query) async {
    return await _isar.taskTags
        .filter()
        .nameContains(query, caseSensitive: false)
        .findAll();
  }

  // UPDATE

  /// Update a tag
  Future<void> updateTag(TaskTag tag) async {
    await _isar.writeTxn(() async {
      await _isar.taskTags.put(tag);
    });
  }

  /// Update tag name
  Future<void> updateTagName(TaskTag tag, String newName) async {
    // Check if new name already exists
    if (newName != tag.name) {
      final existing = await getTagByName(newName);
      if (existing != null) {
        throw Exception('Tag with name "$newName" already exists');
      }
    }

    tag.name = newName;
    await updateTag(tag);
  }

  /// Update tag color
  Future<void> updateTagColor(TaskTag tag, Color newColor) async {
    tag.colorValue = newColor.toARGB32();
    await updateTag(tag);
  }

  /// Update tag icon
  Future<void> updateTagIcon(TaskTag tag, String? newIcon) async {
    tag.icon = newIcon;
    await updateTag(tag);
  }

  // DELETE

  /// Delete a tag
  /// This will also remove the tag from all associated tasks
  Future<bool> deleteTag(TaskTag tag) async {
    return await _isar.writeTxn(() async {
      // Load tasks first
      await tag.tasks.load();

      // Remove tag from all tasks
      for (final task in tag.tasks) {
        task.tags.remove(tag);
        await task.tags.save();
      }

      // Delete the tag
      return await _isar.taskTags.delete(tag.id);
    });
  }

  /// Delete a tag by ID
  Future<bool> deleteTagById(Id id) async {
    final tag = await getTagById(id);
    if (tag == null) return false;
    return await deleteTag(tag);
  }

  /// Delete all tags (use with caution!)
  Future<int> deleteAllTags() async {
    return await _isar.writeTxn(() async {
      // Clear all tag relationships from tasks first
      final allTags = await getAllTags();
      for (final tag in allTags) {
        await tag.tasks.load();
        for (final task in tag.tasks) {
          task.tags.remove(tag);
          await task.tags.save();
        }
      }

      return await _isar.taskTags.where().deleteAll();
    });
  }

  // STATISTICS

  /// Get total count of tags
  Future<int> getTagCount() async {
    return await _isar.taskTags.count();
  }

  /// Get count of tasks for a specific tag
  Future<int> getTaskCountForTag(TaskTag tag) async {
    await tag.tasks.load();
    return tag.tasks.length;
  }

  /// Check if tag name is available
  Future<bool> isTagNameAvailable(String name) async {
    final existing = await getTagByName(name);
    return existing == null;
  }

  // UTILITIES

  /// Get color from tag
  Color getTagColor(TaskTag tag) {
    return Color(tag.colorValue);
  }
}
