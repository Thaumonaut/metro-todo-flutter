import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../shared/widgets/fluent_card.dart';

/// A compact card displaying task summary information
/// Used in horizontal scrollable lists on the home page
class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
    required this.task,
    this.onTap,
    this.width = 280,
    this.onComplete,
    this.onDelete,
    this.enableSwipeActions = false,
  });

  final TodoTask task;
  final VoidCallback? onTap;
  final double width;
  final VoidCallback? onComplete;
  final VoidCallback? onDelete;
  final bool enableSwipeActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: FluentCard(
        shadowLevel: ShadowLevel.subtle,
        borderRadius: AppConstants.radiusLarge,
        padding: const EdgeInsets.all(16),
        onTap: onTap,
        onSwipeRight: enableSwipeActions ? onComplete : null,
        onSwipeLeft: enableSwipeActions ? onDelete : null,
        swipeRightLabel: 'Complete',
        swipeRightIcon: Icons.check_circle,
        swipeRightColor: AppColors.purple4,
        swipeLeftLabel: 'Delete',
        swipeLeftIcon: Icons.delete,
        swipeLeftColor: AppColors.error,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header: Importance indicator + Due date
            Row(
              children: [
                // Importance indicator
                _ImportanceIndicator(importance: task.importance),
                const Spacer(),
                // Due date
                if (task.dueDate != null)
                  _DueDateBadge(dueDate: task.dueDate!, isOverdue: task.isOverdue),
              ],
            ),

            const SizedBox(height: 12),

            // Task title
            Row(children: [
              Text(
                task.title,
                style: AppTypography.h4.copyWith(
                  color: AppColors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Text(
                task.status.label
              ),
            ]),

            if (task.description != null && task.description!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                task.description!,
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            // Tags (if any)
            if (task.tags.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: task.tags.take(3).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(tag.colorValue).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                    ),
                    child: Text(
                      tag.name,
                      style: AppTypography.caption.copyWith(
                        color: Color(tag.colorValue),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Importance level indicator
class _ImportanceIndicator extends StatelessWidget {
  const _ImportanceIndicator({required this.importance});

  final ImportanceLevel importance;

  @override
  Widget build(BuildContext context) {
    final color = _getImportanceColor(importance);
    final label = importance.label;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getImportanceColor(ImportanceLevel importance) {
    switch (importance) {
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

/// Due date badge
class _DueDateBadge extends StatelessWidget {
  const _DueDateBadge({
    required this.dueDate,
    required this.isOverdue,
  });

  final DateTime dueDate;
  final bool isOverdue;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dueDateOnly = DateTime(dueDate.year, dueDate.month, dueDate.day);

    final String text;
    final Color color;

    if (isOverdue) {
      text = 'Overdue';
      color = AppColors.error;
    } else if (dueDateOnly.isAtSameMomentAs(today)) {
      text = 'Today';
      color = AppColors.warning;
    } else if (dueDateOnly.difference(today).inDays == 1) {
      text = 'Tomorrow';
      color = AppColors.inProgress;
    } else if (dueDateOnly.difference(today).inDays <= 7) {
      text = '${dueDateOnly.difference(today).inDays}d';
      color = AppColors.textSecondary;
    } else {
      text = '${dueDate.month}/${dueDate.day}';
      color = AppColors.textSecondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: AppTypography.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
