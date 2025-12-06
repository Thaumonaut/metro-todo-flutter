import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/importance_level.dart';

/// Floating action bar for bulk operations on selected tasks
class BulkActionBar extends StatelessWidget {
  final List<TodoTask> selectedTasks;
  final VoidCallback onComplete;
  final VoidCallback onDelete;
  final Function(ImportanceLevel) onChangeImportance;
  final VoidCallback onCancel;

  const BulkActionBar({
    super.key,
    required this.selectedTasks,
    required this.onComplete,
    required this.onDelete,
    required this.onChangeImportance,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Selection count
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${selectedTasks.length} selected',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),

          // Complete button
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: onComplete,
            tooltip: 'Complete selected',
            color: AppColors.success,
          ),

          // Importance button
          IconButton(
            icon: const Icon(Icons.flag_outlined),
            onPressed: () => _showImportanceDialog(context),
            tooltip: 'Change importance',
            color: Theme.of(context).colorScheme.primary,
          ),

          // Delete button
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context),
            tooltip: 'Delete selected',
            color: AppColors.error,
          ),

          // Cancel button
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: onCancel,
            tooltip: 'Cancel selection',
          ),
        ],
      ),
    );
  }

  void _showImportanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Importance'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ImportanceLevel.values.map((level) {
            return ListTile(
              leading: Icon(
                Icons.flag,
                color: _getImportanceColor(level),
              ),
              title: Text(level.label),
              onTap: () {
                Navigator.pop(context);
                onChangeImportance(level);
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Tasks?'),
        content: Text(
          'Are you sure you want to delete ${selectedTasks.length} task${selectedTasks.length > 1 ? 's' : ''}? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            child: Text(
              'Delete',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  Color _getImportanceColor(ImportanceLevel level) {
    switch (level) {
      case ImportanceLevel.low:
        return AppColors.lowImportance;
      case ImportanceLevel.medium:
        return AppColors.mediumImportance;
      case ImportanceLevel.high:
        return AppColors.highImportance;
      case ImportanceLevel.critical:
        return AppColors.criticalImportance;
    }
  }
}
