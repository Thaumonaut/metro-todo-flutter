import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/fluent_card.dart';

/// A square icon button used for quick actions on the home page
/// Features an icon, label, and custom color with Fluent design styling
class QuickActionIcon extends StatelessWidget {
  const QuickActionIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.size,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FluentCard(
        shadowLevel: ShadowLevel.subtle,
        borderRadius: AppConstants.radiusSmall,
        padding: EdgeInsets.zero,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTypography.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
