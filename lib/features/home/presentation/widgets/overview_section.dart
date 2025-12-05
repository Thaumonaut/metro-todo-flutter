import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/providers/repository_providers.dart';
import '../../providers/home_providers.dart';
import 'live_stats_tile.dart';
import 'quick_action_icon.dart';
import 'task_summary_card.dart';

/// The overview section of the home page
/// Features a live stats tile, quick action buttons, and recent tasks
class OverviewSection extends ConsumerWidget {
  const OverviewSection({
    super.key,
    required this.width,
    required this.statsAsync,
    required this.onNewTaskTap,
    required this.onDueTodayTap,
    required this.onMoreTap,
    this.onTaskTap,
  });

  /// Width of the screen (for card sizing)
  final double width;

  /// Async value containing todo statistics
  final AsyncValue<TodoStats> statsAsync;

  /// Callback when "New Task" button is tapped
  /// TODO: Implement navigation to "All Tasks" section (page 1)
  final VoidCallback onNewTaskTap;

  /// Callback when "Due Today" button is tapped
  /// TODO: Implement showing the today tasks sheet
  final VoidCallback onDueTodayTap;

  /// Callback when "More" button is tapped
  /// TODO: Implement showing the quick actions menu
  final VoidCallback onMoreTap;

  /// Callback when a task is tapped
  /// TODO: Implement navigation to task detail page
  final void Function(TodoTask task)? onTaskTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentTasksAsync = ref.watch(recentTasksProvider);
    const tileSize = 80.0; // Size for square quick action buttons

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            'overview',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.0,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          // Horizontal layout: Live tile + Quick action icons
          SizedBox(
            height: tileSize,
            child: Row(
              children: [
                // Live tile - 2w x 1h (exactly 2x width of a button)
                SizedBox(
                  width: (tileSize * 2) + 8, // Two buttons + one gap
                  child: statsAsync.when(
                    data: (stats) => LiveStatsTile(stats: stats),
                    loading: () => Container(
                      decoration: BoxDecoration(
                        color: AppColors.purple6,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    error: (error, _) => const SizedBox(),
                  ),
                ),
                const Spacer(), // Push quick actions to the right

                // Quick action buttons
                QuickActionIcon(
                  icon: Icons.add,
                  label: 'New Task',
                  color: AppColors.primary,
                  size: tileSize,
                  onTap: onNewTaskTap,
                ),
                const SizedBox(width: 8),

                QuickActionIcon(
                  icon: Icons.today,
                  label: 'Due Today',
                  color: AppColors.purple4,
                  size: tileSize,
                  onTap: onDueTodayTap,
                ),
                const SizedBox(width: 8),

                QuickActionIcon(
                  icon: Icons.more_horiz,
                  label: 'More',
                  color: AppColors.purple7,
                  size: tileSize,
                  onTap: onMoreTap,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'recent',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // Recent tasks list
          recentTasksAsync.when(
            data: (tasks) => tasks.isEmpty
                ? _buildEmptyState()
                : _buildRecentTasksList(tasks),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, _) => const SizedBox(),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Builds the empty state when no tasks exist
  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 48,
              color: AppColors.textHint,
            ),
            const SizedBox(height: 12),
            Text(
              'No tasks yet',
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the list of recent tasks (max 5)
  ///
  /// TODO: Implement task navigation
  /// CURRENT BEHAVIOR: Displays up to 5 most recent tasks
  /// FUTURE ENHANCEMENT: Navigate to task detail when tapped
  ///
  /// HINT: The onTaskTap callback should be implemented in the parent widget
  Widget _buildRecentTasksList(List<TodoTask> tasks) {
    return Column(
      children: tasks.take(5).map((task) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TaskSummaryCard(
            task: task,
            width: width - 48,
            onTap: onTaskTap != null ? () => onTaskTap!(task) : null,
          ),
        );
      }).toList(),
    );
  }
}
