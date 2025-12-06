import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../providers/home_providers.dart';
import 'task_summary_card.dart';
import '../../../tasks/presentation/pages/task_detail_page.dart';

/// A bottom sheet that displays tasks due today
/// Features a draggable scrollable sheet with task list
class TodayTasksSheet extends ConsumerWidget {
  const TodayTasksSheet({super.key});

  /// Shows the today tasks sheet as a modal bottom sheet
  ///
  /// TODO: Implement the show() method
  /// PARAMETERS:
  ///   - context: BuildContext for showing the modal
  ///
  /// REQUIREMENTS:
  /// 1. Use showModalBottomSheet() to display the sheet
  /// 2. Set backgroundColor to AppColors.surface
  /// 3. Set isScrollControlled to true (allows custom sizing)
  /// 4. Use RoundedRectangleBorder with top radius of 16
  /// 5. Return TodayTasksSheet() as the builder content
  ///
  /// EXAMPLE USAGE:
  ///   TodayTasksSheet.show(context);
  ///
  /// EXAMPLE IMPLEMENTATION:
  /// static void show(BuildContext context) {
  ///   showModalBottomSheet(
  ///     context: context,
  ///     backgroundColor: AppColors.surface,
  ///     isScrollControlled: true,
  ///     shape: const RoundedRectangleBorder(
  ///       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ///     ),
  ///     builder: (context) => const TodayTasksSheet(),
  ///   );
  /// }
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const TodayTasksSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayTasksAsync = ref.watch(todayTasksProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          // Drag handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textHint,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Icon(Icons.today, color: AppColors.primary),
                const SizedBox(width: 12),
                Text(
                  'Due Today',
                  style: AppTypography.h3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Tasks list
          Expanded(
            child: todayTasksAsync.when(
              data: (tasks) => tasks.isEmpty
                  ? _buildEmptyState()
                  : _buildTasksList(context, tasks, scrollController),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => _buildErrorState(),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the empty state when no tasks are due today
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 48,
            color: AppColors.textHint,
          ),
          const SizedBox(height: 12),
          Text(
            'No tasks due today',
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

  Widget _buildTasksList(
    BuildContext context,
    List<TodoTask> tasks,
    ScrollController scrollController,
  ) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TaskSummaryCard(
            task: tasks[index],
            width: MediaQuery.of(context).size.width - 48,
            onEdit: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TaskDetailPage(taskId: tasks[index].id),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
