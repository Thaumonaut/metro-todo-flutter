import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/task_tag.dart';
import '../../../data/providers/repository_providers.dart';

/// Provider for watching all tags
final watchAllTagsProvider = StreamProvider<List<TaskTag>>((ref) {
  final tagRepo = ref.watch(tagRepositoryProvider);
  return tagRepo.watchAllTags();
});

/// Provider for creating a tag
final createTagProvider = Provider<Future<TaskTag> Function({
  required String name,
  required Color color,
  String? icon,
})>((ref) {
  final tagRepo = ref.watch(tagRepositoryProvider);
  return ({
    required String name,
    required Color color,
    String? icon,
  }) {
    return tagRepo.createTag(
      name: name,
      color: color,
      icon: icon,
    );
  };
});

/// Provider for updating a tag
final updateTagProvider = Provider<Future<void> Function(TaskTag)>((ref) {
  final tagRepo = ref.watch(tagRepositoryProvider);
  return (TaskTag tag) => tagRepo.updateTag(tag);
});

/// Provider for deleting a tag
final deleteTagProvider = Provider<Future<bool> Function(TaskTag)>((ref) {
  final tagRepo = ref.watch(tagRepositoryProvider);
  return (TaskTag tag) => tagRepo.deleteTag(tag);
});
