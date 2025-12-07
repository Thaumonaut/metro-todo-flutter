import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/task_tag.dart';
import '../../../../shared/widgets/metro_button.dart';
import '../../../../shared/widgets/glass_container.dart';
import '../../../../data/providers/repository_providers.dart';
import '../../providers/tag_providers.dart';

/// Page for managing tags (create, edit, delete)
class TagsPage extends ConsumerStatefulWidget {
  const TagsPage({super.key});

  @override
  ConsumerState<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends ConsumerState<TagsPage> {
  @override
  Widget build(BuildContext context) {
    final tagsAsync = ref.watch(watchAllTagsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text(
          'Tags',
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
      ),
      body: tagsAsync.when(
        data: (tags) {
          if (tags.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildTagsList(context, tags);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text(
            'Error loading tags',
            style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTagDialog(context),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.label_outline, size: 64, color: AppColors.textHint),
          const SizedBox(height: 16),
          Text(
            'No tags yet',
            style: AppTypography.h3.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Create tags to organize your tasks',
            style: AppTypography.body1.copyWith(color: AppColors.textHint),
          ),
          const SizedBox(height: 24),
          MetroButton(
            onPressed: () => _showTagDialog(context),
            icon: Icons.add,
            child: const Text('Create Tag'),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsList(BuildContext context, List<TaskTag> tags) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: tags.length,
      itemBuilder: (context, index) {
        final tag = tags[index];
        final color = Color(tag.colorValue);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GlassContainer(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Color indicator
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 16),
                // Tag name
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tag.name,
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      FutureBuilder<int>(
                        future: _getTaskCount(tag),
                        builder: (context, snapshot) {
                          final count = snapshot.data ?? 0;
                          return Text(
                            '$count task${count != 1 ? 's' : ''}',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Edit button
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  color: AppColors.textSecondary,
                  onPressed: () => _showTagDialog(context, tag: tag),
                ),
                // Delete button
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: Colors.red,
                  onPressed: () => _confirmDelete(context, tag),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<int> _getTaskCount(TaskTag tag) async {
    final tagRepo = ref.read(tagRepositoryProvider);
    return await tagRepo.getTagUsageCount(tag.id);
  }

  void _showTagDialog(BuildContext context, {TaskTag? tag}) {
    final nameController = TextEditingController(text: tag?.name ?? '');
    Color selectedColor = tag != null
        ? Color(tag.colorValue)
        : AppColors.primary;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text(
            tag == null ? 'Create Tag' : 'Edit Tag',
            style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name field
              TextField(
                controller: nameController,
                style: AppTypography.body1.copyWith(
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  labelText: 'Tag Name',
                  labelStyle: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Color picker
              Text(
                'Color',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _getColorOptions().map((color) {
                  final isSelected =
                      color.toARGB32() == selectedColor.toARGB32();
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            MetroButton(
              onPressed: () => Navigator.pop(context),
              variant: MetroButtonVariant.text,
              child: const Text('Cancel'),
            ),
            MetroButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isEmpty) return;

                try {
                  if (tag == null) {
                    // Create new tag
                    final createTag = ref.read(createTagProvider);
                    await createTag(name: name, color: selectedColor);
                  } else {
                    // Update existing tag
                    final updatedTag = tag.copyWith(
                      name: name,
                      colorValue:
                          selectedColor.value, // ignore: deprecated_member_use
                    );
                    final updateTag = ref.read(updateTagProvider);
                    await updateTag(updatedTag);
                  }
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: Text(tag == null ? 'Create' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getColorOptions() {
    return [
      AppColors.primary,
      AppColors.purple4,
      AppColors.purple6,
      AppColors.purple7,
      Colors.red,
      Colors.orange,
      Colors.amber,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
      Colors.pink,
    ];
  }

  Future<void> _confirmDelete(BuildContext context, TaskTag tag) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Delete Tag',
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
        content: Text(
          'Are you sure you want to delete "${tag.name}"? This will remove it from all tasks.',
          style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          MetroButton(
            onPressed: () => Navigator.pop(context, false),
            variant: MetroButtonVariant.text,
            child: const Text('Cancel'),
          ),
          MetroButton(
            onPressed: () => Navigator.pop(context, true),
            backgroundColor: Colors.red,
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final deleteTag = ref.read(deleteTagProvider);
      try {
        await deleteTag(tag);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error deleting tag: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
