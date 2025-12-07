import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/task_tag.dart';
import '../../../../data/providers/repository_providers.dart';
import '../../providers/task_providers.dart';

/// Widget for selecting tags with multi-select chips and inline creation
class TagSelector extends ConsumerStatefulWidget {
  const TagSelector({
    super.key,
    required this.selectedTags,
    required this.onTagsChanged,
  });

  final List<TaskTag> selectedTags;
  final ValueChanged<List<TaskTag>> onTagsChanged;

  @override
  ConsumerState<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends ConsumerState<TagSelector> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tagsAsync = ref.watch(watchAllTagsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: AppTypography.body2.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        // Search & Create Field
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search or create tag...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onChanged: (value) => setState(() => _searchQuery = value.trim()),
        ),
        const SizedBox(height: 16),

        // Tag List
        tagsAsync.when(
          data: (tags) {
            final filteredTags = tags
                .where(
                  (tag) => tag.name.toLowerCase().contains(
                    _searchQuery.toLowerCase(),
                  ),
                )
                .toList();

            final showCreateButton =
                _searchQuery.isNotEmpty &&
                !tags.any(
                  (t) => t.name.toLowerCase() == _searchQuery.toLowerCase(),
                );

            if (filteredTags.isEmpty && !showCreateButton) {
              return Text(
                'No tags found.',
                style: AppTypography.body2.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                ),
              );
            }

            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...filteredTags.map((tag) => _buildTagChip(tag)),
                if (showCreateButton) _buildCreateChip(),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text('Error loading tags: $error'),
        ),
      ],
    );
  }

  Widget _buildTagChip(TaskTag tag) {
    final isSelected = widget.selectedTags.any((t) => t.id == tag.id);
    final color = Color(tag.colorValue);

    return GestureDetector(
      onTap: () => _toggleTag(tag),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 6),
                child: Icon(Icons.check, size: 16, color: Colors.white),
              ),
            Text(
              tag.name,
              style: AppTypography.caption.copyWith(
                color: isSelected ? Colors.white : color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateChip() {
    return GestureDetector(
      onTap: _createTag,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 4),
            Text(
              'Create "$_searchQuery"',
              style: AppTypography.caption.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleTag(TaskTag tag) {
    final List<TaskTag> newTags = List.from(widget.selectedTags);
    final existingIndex = newTags.indexWhere((t) => t.id == tag.id);

    if (existingIndex >= 0) {
      newTags.removeAt(existingIndex);
    } else {
      newTags.add(tag);
    }

    widget.onTagsChanged(newTags);
  }

  Future<void> _createTag() async {
    if (_searchQuery.isEmpty) return;

    final tagRepo = ref.read(tagRepositoryProvider);
    final colorValue = Colors.blue;

    try {
      final newTagId = await tagRepo.createTag(
        name: _searchQuery,
        color: colorValue,
      );
      final newTag = await tagRepo.getTagById(newTagId);

      if (newTag != null) {
        _toggleTag(newTag);
        _searchController.clear();
        setState(() => _searchQuery = '');
      }
    } catch (e) {
      debugPrint('Error creating tag: $e');
    }
  }
}
