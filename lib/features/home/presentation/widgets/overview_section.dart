import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/importance_level.dart';
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
    this.onTaskEdit,
    this.onTaskComplete,
    this.onTaskDelete,
    this.onTaskImportanceChange,
  });

  /// Width of the screen (for card sizing)
  final double width;

  /// Async value containing todo statistics
  final AsyncValue<TodoStats> statsAsync;

  /// Callback when "New Task" button is tapped
  final VoidCallback onNewTaskTap;

  /// Callback when "Due Today" button is tapped
  final VoidCallback onDueTodayTap;

  /// Callback when "More" button is tapped
  final VoidCallback onMoreTap;

  /// Callback when a task edit is requested
  final void Function(TodoTask task)? onTaskEdit;

  /// Callback when a task is completed
  final void Function(TodoTask task)? onTaskComplete;

  /// Callback when a task is deleted
  final void Function(TodoTask task)? onTaskDelete;

  /// Callback when a task's importance is changed
  final void Function(TodoTask task, ImportanceLevel importance)? onTaskImportanceChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentTasksAsync = ref.watch(recentTasksProvider);

    // Responsive layout: compact mode for small screens
    final isCompact = width < 480;
    final tileSize = isCompact ? 56.0 : 80.0;

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
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),

          // Responsive layout: stacked on small screens, horizontal on large
          if (isCompact)
            _buildCompactLayout(tileSize, context)
          else
            _buildWideLayout(tileSize, context),

          const SizedBox(height: 24),

          Text(
            'recent',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              color: Theme.of(context).colorScheme.onSurface,
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

  /// Builds the compact layout for small screens (< 480px)
  /// Live tile on top, quick actions below
  Widget _buildCompactLayout(double tileSize, BuildContext context) {
    return Column(
      children: [
        // Live stats tile - full width
        SizedBox(
          height: tileSize * 2,
          width: double.infinity,
          child: statsAsync.when(
            data: (stats) => LiveStatsTile(stats: stats),
            loading: () => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => const SizedBox(),
          ),
        ),
        const SizedBox(height: 8),
        // Quick action buttons row
        SizedBox(
          height: tileSize,
          child: Row(
            children: [
              Expanded(
                child: QuickActionIcon(
                  icon: Icons.add,
                  label: 'New Task',
                  color: Theme.of(context).colorScheme.primary,
                  size: tileSize,
                  onTap: onNewTaskTap,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: QuickActionIcon(
                  icon: Icons.today,
                  label: 'Due Today',
                  color: Theme.of(context).colorScheme.secondary,
                  size: tileSize,
                  onTap: onDueTodayTap,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: QuickActionIcon(
                  icon: Icons.more_horiz,
                  label: 'More',
                  color: Theme.of(context).colorScheme.tertiary,
                  size: tileSize,
                  onTap: onMoreTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the wide layout for larger screens (>= 480px)
  /// Live tile and quick actions side by side
  Widget _buildWideLayout(double tileSize, BuildContext context) {
    return SizedBox(
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
                  color: Theme.of(context).colorScheme.primaryContainer,
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
            color: Theme.of(context).colorScheme.primary,
            size: tileSize,
            onTap: onNewTaskTap,
          ),
          const SizedBox(width: 8),

          QuickActionIcon(
            icon: Icons.today,
            label: 'Due Today',
            color: Theme.of(context).colorScheme.secondary,
            size: tileSize,
            onTap: onDueTodayTap,
          ),
          const SizedBox(width: 8),

          QuickActionIcon(
            icon: Icons.more_horiz,
            label: 'More',
            color: Theme.of(context).colorScheme.tertiary,
            size: tileSize,
            onTap: onMoreTap,
          ),
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
  /// HINT: The onTaskEdit callback should be implemented in the parent widget
  Widget _buildRecentTasksList(List<TodoTask> tasks) {
    return Column(
      children: tasks.take(5).map((task) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TaskSummaryCard(
            task: task,
            width: width - 48,
            onEdit: onTaskEdit != null ? () => onTaskEdit!(task) : null,
            onComplete: onTaskComplete != null ? () => onTaskComplete!(task) : null,
            onDelete: onTaskDelete != null ? () => onTaskDelete!(task) : null,
            onImportanceChange: onTaskImportanceChange != null
                ? (importance) => onTaskImportanceChange!(task, importance)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
