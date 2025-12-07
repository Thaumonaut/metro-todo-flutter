import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/animation_constants.dart';

/// A button with Metro/Fluent design styling
class MetroButton extends StatefulWidget {
  const MetroButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.variant = MetroButtonVariant.filled,
    this.size = MetroButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.borderRadius,
  });

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Child widget (typically Text)
  final Widget child;

  /// Background color (defaults based on variant)
  final Color? backgroundColor;

  /// Foreground color for text/icon (defaults based on variant)
  final Color? foregroundColor;

  /// Button style variant
  final MetroButtonVariant variant;

  /// Button size
  final MetroButtonSize size;

  /// Optional leading icon
  final IconData? icon;

  /// Whether button is in loading state
  final bool isLoading;

  /// Custom border radius
  final double? borderRadius;

  @override
  State<MetroButton> createState() => _MetroButtonState();
}

class _MetroButtonState extends State<MetroButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null && !widget.isLoading;
    final buttonPadding = _getPadding(widget.size);
    final buttonRadius = widget.borderRadius ?? AppConstants.radiusMedium;

    final backgroundColor = _getBackgroundColor(context);
    final foregroundColor = _getForegroundColor(context);

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      onTap: isEnabled ? widget.onPressed : null,
      child: AnimatedScale(
        scale: _isPressed ? 0.97 : 1.0,
        duration: AnimationConstants.fast,
        curve: AnimationConstants.curveDefault,
        child: AnimatedOpacity(
          opacity: isEnabled ? 1.0 : 0.5,
          duration: AnimationConstants.fast,
          child: Container(
            padding: buttonPadding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(buttonRadius),
              border: widget.variant == MetroButtonVariant.outlined
                  ? Border.all(
                      color: foregroundColor,
                      width: 2,
                    )
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.isLoading)
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
                    ),
                  )
                else if (widget.icon != null)
                  Icon(
                    widget.icon,
                    size: _getIconSize(widget.size),
                    color: foregroundColor,
                  ),
                if ((widget.isLoading || widget.icon != null))
                  const SizedBox(width: 8),
                DefaultTextStyle(
                  style: AppTypography.button.copyWith(
                    color: foregroundColor,
                    fontSize: _getFontSize(widget.size),
                  ),
                  child: widget.child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }

    switch (widget.variant) {
      case MetroButtonVariant.filled:
        return Theme.of(context).colorScheme.primary;
      case MetroButtonVariant.outlined:
      case MetroButtonVariant.text:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor(BuildContext context) {
    if (widget.foregroundColor != null) {
      return widget.foregroundColor!;
    }

    switch (widget.variant) {
      case MetroButtonVariant.filled:
        return Theme.of(context).colorScheme.onPrimary;
      case MetroButtonVariant.outlined:
      case MetroButtonVariant.text:
        return Theme.of(context).colorScheme.primary;
    }
  }

  EdgeInsetsGeometry _getPadding(MetroButtonSize size) {
    switch (size) {
      case MetroButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case MetroButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case MetroButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  double _getIconSize(MetroButtonSize size) {
    switch (size) {
      case MetroButtonSize.small:
        return 16;
      case MetroButtonSize.medium:
        return 20;
      case MetroButtonSize.large:
        return 24;
    }
  }

  double _getFontSize(MetroButtonSize size) {
    switch (size) {
      case MetroButtonSize.small:
        return 12;
      case MetroButtonSize.medium:
        return 14;
      case MetroButtonSize.large:
        return 16;
    }
  }
}

/// Button style variants
enum MetroButtonVariant {
  /// Filled background with primary color
  filled,

  /// Transparent background with border
  outlined,

  /// Transparent background, no border
  text,
}

/// Button size options
enum MetroButtonSize {
  small,
  medium,
  large,
}

/// Convenience widget for icon-only Metro buttons
class MetroIconButton extends StatelessWidget {
  const MetroIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.size = 48.0,
    this.iconSize,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;
    final fgColor = foregroundColor ?? AppColors.textOnPrimary;
    final effectiveIconSize = iconSize ?? size * 0.5;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: Icon(
          icon,
          size: effectiveIconSize,
          color: fgColor,
        ),
      ),
    );
  }
}
