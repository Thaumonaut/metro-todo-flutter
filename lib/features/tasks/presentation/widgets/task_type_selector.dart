import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/task_type.dart';

/// Widget for selecting task type with Metro-style chips
class TaskTypeSelector extends StatelessWidget {
  const TaskTypeSelector({
    super.key,
    required this.selectedTaskType,
    required this.onTaskTypeChanged,
  });

  final TaskType selectedTaskType;
  final ValueChanged<TaskType> onTaskTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task Type',
          style: AppTypography.body2.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: TaskType.values.map((taskType) {
            final isSelected = taskType == selectedTaskType;
            final color = _getTaskTypeColor(context, taskType);

            return GestureDetector(
              onTap: () => onTaskTypeChanged(taskType),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? color : color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? color : color.withValues(alpha: 0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getTaskTypeIcon(taskType),
                      size: 18,
                      color: isSelected ? Colors.white : color,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      taskType.label,
                      style: AppTypography.body2.copyWith(
                        color: isSelected ? Colors.white : color,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getTaskTypeColor(BuildContext context, TaskType taskType) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (taskType) {
      case TaskType.standard:
        return AppColors.textPrimary;
      case TaskType.medication:
        return colorScheme.error;
      case TaskType.habit:
        return const Color(0xFF00BFA5); // Teal
      case TaskType.bill:
        return const Color(0xFFFF6D00); // Orange
      case TaskType.exercise:
        return const Color(0xFF00C853); // Green
      case TaskType.chore:
        return const Color(0xFF6200EA); // Purple
      case TaskType.daysSince:
        return const Color(0xFFD50000); // Red
    }
  }

  IconData _getTaskTypeIcon(TaskType taskType) {
    switch (taskType) {
      case TaskType.standard:
        return Icons.task_alt;
      case TaskType.medication:
        return Icons.medication;
      case TaskType.habit:
        return Icons.trending_up;
      case TaskType.bill:
        return Icons.receipt_long;
      case TaskType.exercise:
        return Icons.fitness_center;
      case TaskType.chore:
        return Icons.cleaning_services;
      case TaskType.daysSince:
        return Icons.calendar_today;
    }
  }
}
