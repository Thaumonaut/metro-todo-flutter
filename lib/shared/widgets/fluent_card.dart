import 'package:flutter/material.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/constants/app_constants.dart';

/// A card widget with Fluent design system styling
/// Features subtle shadows, rounded corners, and optional glass effect
class FluentCard extends StatelessWidget {
  const FluentCard({
    super.key,
    required this.child,
    this.color,
    this.shadowLevel = ShadowLevel.medium,
    this.borderRadius = AppConstants.radiusLarge,
    this.padding,
    this.margin,
    this.border,
    this.onTap,
    this.width,
    this.height,
  });

  /// Child widget to display inside the card
  final Widget child;

  /// Background color (defaults to surface color)
  final Color? color;

  /// Shadow depth level
  final ShadowLevel shadowLevel;

  /// Border radius for rounded corners
  final double borderRadius;

  /// Padding inside the card
  final EdgeInsetsGeometry? padding;

  /// Margin outside the card
  final EdgeInsetsGeometry? margin;

  /// Custom border
  final Border? border;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Card width
  final double? width;

  /// Card height
  final double? height;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.surface;
    final shadows = _getShadows(shadowLevel);

    final cardContent = Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: effectiveColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadows,
        border: border,
      ),
      child: child,
    );

    Widget content = cardContent;

    // Wrap with GestureDetector if onTap is provided
    if (onTap != null) {
      content = GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return Container(
      margin: margin,
      child: content,
    );
  }

  List<BoxShadow> _getShadows(ShadowLevel level) {
    switch (level) {
      case ShadowLevel.none:
        return [];
      case ShadowLevel.subtle:
        return AppShadows.subtleShadows;
      case ShadowLevel.medium:
        return AppShadows.mediumShadows;
      case ShadowLevel.elevated:
        return AppShadows.elevatedShadows;
      case ShadowLevel.floating:
        return AppShadows.floatingShadows;
    }
  }
}

/// Shadow depth levels for Fluent design
enum ShadowLevel {
  none,
  subtle,
  medium,
  elevated,
  floating,
}

/// A Fluent card with glass effect
class GlassFluentCard extends StatelessWidget {
  const GlassFluentCard({
    super.key,
    required this.child,
    this.opacity = 0.8,
    this.borderRadius = AppConstants.radiusLarge,
    this.padding,
    this.margin,
    this.onTap,
    this.width,
    this.height,
  });

  final Widget child;
  final double opacity;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return FluentCard(
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
      shadowLevel: ShadowLevel.subtle,
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        width: 1.5,
      ),
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }
}

/// A compact Fluent card for list items
class CompactFluentCard extends StatelessWidget {
  const CompactFluentCard({
    super.key,
    required this.child,
    this.color,
    this.shadowLevel = ShadowLevel.subtle,
    this.onTap,
  });

  final Widget child;
  final Color? color;
  final ShadowLevel shadowLevel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FluentCard(
      color: color,
      shadowLevel: shadowLevel,
      borderRadius: AppConstants.radiusMedium,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      onTap: onTap,
      child: child,
    );
  }
}
