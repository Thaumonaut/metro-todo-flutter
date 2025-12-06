import 'package:flutter/material.dart';
import '../../../../core/theme/theme_colors.dart';

/// Widget for picking accent color
class AccentColorPicker extends StatelessWidget {
  final String currentColor;
  final ValueChanged<String> onChanged;

  const AccentColorPicker({
    super.key,
    required this.currentColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: ThemeColors.availableColors.map((colorName) {
        final color = ThemeColors.getPrimaryColor(colorName);
        final isSelected = currentColor.toLowerCase() == colorName.toLowerCase();

        return GestureDetector(
          onTap: () => onChanged(colorName),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.transparent,
                width: 3,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 32,
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }
}
