import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import 'task_summary_card.dart';

/// A generic reusable section for displaying a list of tasks
/// Used for "All Tasks" and "Urgent" sections (and potentially others)
class TaskListSection extends StatelessWidget {
  const TaskListSection({
    super.key,
    required this.title,
    required this.tasksAsync,
    required this.width,
    required this.emptyStateIcon,
    required this.emptyStateMessage,
    this.onTaskTap,
    this.onTaskComplete,
    this.onTaskDelete,
    this.enableSwipeActions = true,
  });

  /// Section title (e.g., "all tasks", "urgent")
  final String title;

  /// Async value containing the list of tasks
  final AsyncValue<List<TodoTask>> tasksAsync;

  /// Width of the screen (for card sizing)
  final double width;

  /// Icon to display when the list is empty
  final IconData emptyStateIcon;

  /// Message to display when the list is empty
  final String emptyStateMessage;

  /// Callback when a task is tapped
  final void Function(TodoTask task)? onTaskTap;

  /// Callback when a task is completed via swipe
  final void Function(TodoTask task)? onTaskComplete;

  /// Callback when a task is deleted via swipe
  final void Function(TodoTask task)? onTaskDelete;

  /// Whether to enable swipe actions on task cards
  final bool enableSwipeActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title.toLowerCase(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.0,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Tasks list
        Expanded(
          child: tasksAsync.when(
            data: (tasks) => tasks.isEmpty
                ? _buildEmptyState()
                : _buildTasksList(tasks),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => _buildErrorState(),
          ),
        ),
      ],
    );
  }

  /// Builds the empty state when no tasks are available
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            emptyStateIcon,
            size: 64,
            color: AppColors.textHint,
          ),
          const SizedBox(height: 16),
          Text(
            emptyStateMessage,
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the error state when tasks fail to load
  Widget _buildErrorState() {
    return Center(
      child: Text(
        'Error loading tasks',
        style: AppTypography.body1.copyWith(color: AppColors.error),
      ),
    );
  }

  /// Builds the scrollable list of tasks
  Widget _buildTasksList(List<TodoTask> tasks) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TaskSummaryCard(
            task: task,
            width: width - 48,
            onTap: onTaskTap != null ? () => onTaskTap!(task) : null,
            onComplete: onTaskComplete != null ? () => onTaskComplete!(task) : null,
            onDelete: onTaskDelete != null ? () => onTaskDelete!(task) : null,
            enableSwipeActions: enableSwipeActions,
          ),
        );
      },
    );
  }
}
