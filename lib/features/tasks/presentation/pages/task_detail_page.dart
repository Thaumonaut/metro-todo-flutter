import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/task_status.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../shared/widgets/glass_container.dart';
import '../../../../shared/widgets/metro_button.dart';
import '../../providers/task_providers.dart';
import 'task_form_page.dart';

/// Page for viewing and managing task details
class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({
    super.key,
    required this.taskId,
  });

  /// Task ID (Isar ID) to display
  final int taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the task for reactive updates
    final taskAsync = ref.watch(watchTaskByIdProvider(taskId));

    return Scaffold(
      body: taskAsync.when(
        data: (task) {
          if (task == null) {
            return _buildTaskNotFound(context);
          }
          return _buildTaskDetail(context, ref, task);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text(
            'Error loading task',
            style: AppTypography.body1.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskNotFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Task not found',
            style: AppTypography.h3.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          MetroButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskDetail(BuildContext context, WidgetRef ref, TodoTask task) {
    final dateFormatter = DateFormat('MMM dd, yyyy');

    return CustomScrollView(
      slivers: [
        // App Bar
        SliverAppBar(
          expandedHeight: 120,
          floating: false,
          pinned: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            // Edit button
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _navigateToEdit(context, task),
            ),
            // Delete button
            IconButton(
              icon: const Icon(Icons.delete_outline),
              color: Colors.red,
              onPressed: () => _confirmDelete(context, ref, task),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Task Details',
              style: AppTypography.h3.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),

        // Content
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Title and Description
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: AppTypography.h2.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    if (task.description != null &&
                        task.description!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        task.description!,
                        style: AppTypography.body1.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Status Toggle
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: AppTypography.body2.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: TaskStatus.values.map((status) {
                        final isSelected = status == task.status;
                        final color = _getStatusColor(status);

                        return GestureDetector(
                          onTap: () => _updateStatus(ref, task, status),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? color
                                  : color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? color
                                    : color.withValues(alpha: 0.3),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Text(
                              _getStatusLabel(status),
                              style: AppTypography.caption.copyWith(
                                color: isSelected ? Colors.white : color,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Metadata
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: AppTypography.body2.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      context,
                      Icons.flag,
                      'Importance',
                      _getImportanceLabel(task.importance),
                      _getImportanceColor(task.importance),
                    ),
                    const SizedBox(height: 12),
                    if (task.dueDate != null)
                      _buildInfoRow(
                        context,
                        Icons.calendar_today,
                        'Due Date',
                        dateFormatter.format(task.dueDate!),
                        task.isOverdue
                            ? Theme.of(context).colorScheme.error
                            : task.isDueToday
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                      ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      context,
                      Icons.access_time,
                      'Created',
                      dateFormatter.format(task.createdAt),
                      Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    if (task.completedAt != null) ...[
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        context,
                        Icons.check_circle,
                        'Completed',
                        dateFormatter.format(task.completedAt!),
                        AppColors.purple4,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Tags
              if (task.tags.isNotEmpty)
                GlassContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
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
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: task.tags.map((tag) {
                          final color = Color(tag.colorValue);
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: color,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              tag.name,
                              style: AppTypography.caption.copyWith(
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 32),

              // Quick Actions
              Row(
                children: [
                  Expanded(
                    child: MetroButton(
                      onPressed: () {
                        if (task.isCompleted) {
                          _uncompleteTask(ref, task);
                        } else {
                          _completeTask(ref, task);
                        }
                      },
                      backgroundColor:
                          task.isCompleted ? AppColors.textSecondary : AppColors.primary,
                      icon: task.isCompleted
                          ? Icons.replay
                          : Icons.check_circle,
                      child: Text(
                          task.isCompleted ? 'Reopen' : 'Mark Complete'),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: AppTypography.body2.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTypography.body2.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return AppColors.textSecondary;
      case TaskStatus.inProgress:
        return AppColors.primary;
      case TaskStatus.onHold:
        return AppColors.purple6;
      case TaskStatus.completed:
        return AppColors.purple4;
    }
  }

  String _getStatusLabel(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.onHold:
        return 'On Hold';
      case TaskStatus.completed:
        return 'Completed';
    }
  }

  Color _getImportanceColor(ImportanceLevel importance) {
    switch (importance) {
      case ImportanceLevel.low:
        return AppColors.purple4;
      case ImportanceLevel.medium:
        return AppColors.primary;
      case ImportanceLevel.high:
        return AppColors.purple6;
      case ImportanceLevel.critical:
        return AppColors.purple7;
    }
  }

  String _getImportanceLabel(ImportanceLevel importance) {
    switch (importance) {
      case ImportanceLevel.low:
        return 'Low';
      case ImportanceLevel.medium:
        return 'Medium';
      case ImportanceLevel.high:
        return 'High';
      case ImportanceLevel.critical:
        return 'Critical';
    }
  }

  Future<void> _navigateToEdit(BuildContext context, TodoTask task) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFormPage(task: task),
      ),
    );
  }

  void _updateStatus(WidgetRef ref, TodoTask task, TaskStatus newStatus) async {
    task.status = newStatus;
    if (newStatus == TaskStatus.completed) {
      task.isCompleted = true;
      task.completedAt = DateTime.now();
    } else if (task.isCompleted) {
      task.isCompleted = false;
      task.completedAt = null;
    }

    final updateTask = ref.read(updateTaskProvider);
    try {
      await updateTask(task);
    } catch (e) {
      // Error handling done by the provider
    }
  }

  void _completeTask(WidgetRef ref, TodoTask task) async {
    final completeTask = ref.read(completeTaskProvider);
    try {
      await completeTask(task);
    } catch (e) {
      // Error handling done by the provider
    }
  }

  void _uncompleteTask(WidgetRef ref, TodoTask task) async {
    final uncompleteTask = ref.read(uncompleteTaskProvider);
    try {
      await uncompleteTask(task);
    } catch (e) {
      // Error handling done by the provider
    }
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, TodoTask task) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Delete Task',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${task.title}"? This action cannot be undone.',
          style: AppTypography.body1.copyWith(
            color: AppColors.textSecondary,
          ),
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
      final deleteTask = ref.read(deleteTaskProvider);
      try {
        await deleteTask(task);
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error deleting task: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
