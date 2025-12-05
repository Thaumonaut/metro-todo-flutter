import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// A section container for the panoramic home page
/// Features a header and scrollable content area
class PanoramaSection extends StatelessWidget {
  const PanoramaSection({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
    required this.child,
    this.padding,
  });

  /// Section title
  final String title;

  /// Optional subtitle
  final String? subtitle;

  /// Optional action button (e.g., "See All")
  final Widget? action;

  /// Content of the section
  final Widget child;

  /// Section padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.h2.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          style: AppTypography.body2.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Action button
                if (action != null) action!,
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Content
          child,
        ],
      ),
    );
  }
}

/// Horizontal scrollable list wrapper
class HorizontalScrollList extends StatelessWidget {
  const HorizontalScrollList({
    super.key,
    required this.children,
    this.height,
    this.padding,
  });

  final List<Widget> children;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
        children: children,
      ),
    );
  }
}

/// Grid layout for tiles/cards
class SectionGrid extends StatelessWidget {
  const SectionGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.spacing = 12,
    this.padding,
  });

  final List<Widget> children;
  final int crossAxisCount;
  final double spacing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        children: children,
      ),
    );
  }
}

/// Empty state for sections with no content
class SectionEmptyState extends StatelessWidget {
  const SectionEmptyState({
    super.key,
    required this.message,
    this.icon,
    this.action,
  });

  final String message;
  final IconData? icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 48,
                color: AppColors.textHint,
              ),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[
              const SizedBox(height: 16),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
