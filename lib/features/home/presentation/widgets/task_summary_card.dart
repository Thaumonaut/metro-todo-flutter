import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/todo_task.dart';
import '../../../../data/models/importance_level.dart';
import '../../../../shared/widgets/fluent_card.dart';

/// A compact card displaying task summary information
/// Used in horizontal scrollable lists on the home page
/// Tap to expand and reveal action buttons (Edit, Complete, Delete)
class TaskSummaryCard extends StatefulWidget {
  const TaskSummaryCard({
    super.key,
    required this.task,
    this.onEdit,
    this.width = 280,
    this.onComplete,
    this.onDelete,
    this.onImportanceChange,
  });

  final TodoTask task;
  final VoidCallback? onEdit;
  final double width;
  final VoidCallback? onComplete;
  final VoidCallback? onDelete;
  final void Function(ImportanceLevel importance)? onImportanceChange;

  @override
  State<TaskSummaryCard> createState() => _TaskSummaryCardState();
}

class _TaskSummaryCardState extends State<TaskSummaryCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _showImportancePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => _ImportancePickerSheet(
        currentImportance: widget.task.importance,
        onSelect: (importance) {
          Navigator.pop(context);
          widget.onImportanceChange?.call(importance);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;

    return Container(
      width: widget.width,
      margin: const EdgeInsets.only(right: 12),
      child: FluentCard(
        shadowLevel: ShadowLevel.subtle,
        borderRadius: AppConstants.radiusLarge,
        padding: EdgeInsets.zero,
        onTap: _toggleExpanded,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Main content with padding
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header: Importance indicator + Due date + Recurring badge
                    Row(
                      children: [
                        _ImportanceIndicator(importance: task.importance),
                        const Spacer(),
                        if (task.isRecurring && task.isRecurringTemplate) ...[
                          _RecurringBadge(),
                          const SizedBox(width: 6),
                        ],
                        if (task.dueDate != null)
                          _DueDateBadge(dueDate: task.dueDate!, isOverdue: task.isOverdue),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Task title
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            task.title,
                            style: AppTypography.h4.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          task.status.label,
                          style: AppTypography.caption.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),

                    if (task.description != null && task.description!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        task.description!,
                        style: AppTypography.body2.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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

              // Expandable action buttons
              if (_isExpanded) ...[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Edit button
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.edit_outlined,
                          label: 'Edit',
                          color: Theme.of(context).colorScheme.primary,
                          onTap: widget.onEdit,
                        ),
                      ),
                      // Importance button
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.flag_outlined,
                          label: 'Priority',
                          color: AppColors.warning,
                          onTap: widget.onImportanceChange != null ? _showImportancePicker : null,
                        ),
                      ),
                      // Complete button
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.check_circle_outline,
                          label: 'Complete',
                          color: AppColors.purple4,
                          onTap: widget.onComplete,
                        ),
                      ),
                      // Delete button
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.delete_outline,
                          label: 'Delete',
                          color: AppColors.error,
                          onTap: widget.onDelete,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Action button for expanded card state
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: color,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.caption.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
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
      color = Theme.of(context).colorScheme.onSurfaceVariant;
    } else {
      text = '${dueDate.month}/${dueDate.day}';
      color = Theme.of(context).colorScheme.onSurfaceVariant;
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

/// Recurring task badge
class _RecurringBadge extends StatelessWidget {
  const _RecurringBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.repeat,
            size: 12,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            'Repeats',
            style: AppTypography.caption.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom sheet for selecting task importance
class _ImportancePickerSheet extends StatelessWidget {
  const _ImportancePickerSheet({
    required this.currentImportance,
    required this.onSelect,
  });

  final ImportanceLevel currentImportance;
  final void Function(ImportanceLevel) onSelect;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Set Priority',
                style: AppTypography.h3.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Importance options
            ...ImportanceLevel.values.map((importance) {
              final isSelected = importance == currentImportance;
              final color = _getImportanceColor(importance);
              return InkWell(
                onTap: () => onSelect(importance),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  color: isSelected ? color.withValues(alpha: 0.1) : null,
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          importance.label,
                          style: AppTypography.body1.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check,
                          color: color,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
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
