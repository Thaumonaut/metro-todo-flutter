import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/importance_level.dart';

/// Widget for selecting task importance level with Metro-style chips
class ImportanceSelector extends StatelessWidget {
  const ImportanceSelector({
    super.key,
    required this.selectedImportance,
    required this.onImportanceChanged,
  });

  final ImportanceLevel selectedImportance;
  final ValueChanged<ImportanceLevel> onImportanceChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: AppTypography.body2.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ImportanceLevel.values.map((importance) {
            final isSelected = importance == selectedImportance;
            final color = _getImportanceColor(importance);

            return GestureDetector(
              onTap: () => onImportanceChanged(importance),
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
                      _getImportanceIcon(importance),
                      size: 18,
                      color: isSelected ? Colors.white : color,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _getImportanceLabel(importance),
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

  IconData _getImportanceIcon(ImportanceLevel importance) {
    switch (importance) {
      case ImportanceLevel.low:
        return Icons.flag_outlined;
      case ImportanceLevel.medium:
        return Icons.flag;
      case ImportanceLevel.high:
        return Icons.priority_high;
      case ImportanceLevel.critical:
        return Icons.warning;
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
}
