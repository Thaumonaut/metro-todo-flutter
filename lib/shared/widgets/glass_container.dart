import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/animation_constants.dart';

/// A container with glassmorphism effect
/// Features backdrop blur, transparency, and subtle borders
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.blur = AnimationConstants.glassBlurSigma,
    this.opacity = 0.2,
    this.borderRadius,
    this.border,
    this.shadows,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
  });

  /// Child widget to display inside the glass container
  final Widget child;

  /// Blur amount (sigma) for the backdrop filter
  final double blur;

  /// Opacity of the glass effect (0.0 to 1.0)
  final double opacity;

  /// Border radius for rounded corners
  final BorderRadius? borderRadius;

  /// Custom border (if null, uses default glass border)
  final Border? border;

  /// Box shadows for depth
  final List<BoxShadow>? shadows;

  /// Padding inside the container
  final EdgeInsetsGeometry? padding;

  /// Margin outside the container
  final EdgeInsetsGeometry? margin;

  /// Container width
  final double? width;

  /// Container height
  final double? height;

  /// Base color for the glass effect (defaults to white)
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Colors.white;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        boxShadow: shadows,
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: effectiveColor.withValues(alpha: opacity),
              borderRadius: effectiveBorderRadius,
              border: border ??
                  Border.all(
                    color: AppColors.glassBorder,
                    width: 1.5,
                  ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A simpler glass container without backdrop blur
/// More performant for less critical UI elements
class SimpleGlassContainer extends StatelessWidget {
  const SimpleGlassContainer({
    super.key,
    required this.child,
    this.opacity = 0.2,
    this.borderRadius,
    this.border,
    this.shadows,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
  });

  final Widget child;
  final double opacity;
  final BorderRadius? borderRadius;
  final Border? border;
  final List<BoxShadow>? shadows;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Colors.white;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: effectiveColor.withValues(alpha: opacity),
        borderRadius: effectiveBorderRadius,
        border: border ??
            Border.all(
              color: AppColors.glassBorder,
              width: 1.5,
            ),
        boxShadow: shadows,
      ),
      child: child,
    );
  }
}
