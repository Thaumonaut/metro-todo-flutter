import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/constants/app_constants.dart';

/// A card widget with Fluent design system styling
/// Features subtle shadows, rounded corners, and optional glass effect
class FluentCard extends StatefulWidget {
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
    this.onSwipeLeft,
    this.onSwipeRight,
    this.swipeLeftLabel,
    this.swipeRightLabel,
    this.swipeLeftIcon,
    this.swipeRightIcon,
    this.swipeLeftColor,
    this.swipeRightColor,
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

  /// Callback when card is swiped left (right to left)
  final VoidCallback? onSwipeLeft;

  /// Callback when card is swiped right (left to right)
  final VoidCallback? onSwipeRight;

  /// Label for left swipe action
  final String? swipeLeftLabel;

  /// Label for right swipe action
  final String? swipeRightLabel;

  /// Icon for left swipe action
  final IconData? swipeLeftIcon;

  /// Icon for right swipe action
  final IconData? swipeRightIcon;

  /// Color for left swipe action
  final Color? swipeLeftColor;

  /// Color for right swipe action
  final Color? swipeRightColor;

  @override
  State<FluentCard> createState() => _FluentCardState();
}

class _FluentCardState extends State<FluentCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _dragExtent = 0.0;
  bool _isSwipeEnabled = false;
  bool _isHovering = false;
  DateTime? _pressStartTime;
  static const double _swipeThreshold = 80.0;
  static const double _maxSwipeExtent = 120.0;
  static const Duration _activationDelay = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleHoverEnter(PointerEvent event) {
    setState(() {
      _isHovering = true;
    });
    // Enable swipe after hover delay
    Future.delayed(_activationDelay, () {
      if (mounted && _isHovering) {
        setState(() {
          _isSwipeEnabled = true;
        });
      }
    });
  }

  void _handleHoverExit(PointerEvent event) {
    // Immediately disable swipe when mouse leaves
    // (unless they're in the middle of a swipe)
    setState(() {
      _isHovering = false;
      if (_dragExtent == 0.0) {
        _isSwipeEnabled = false;
      }
    });
  }

  void _handleDragStart(DragStartDetails details) {
    // Record when the user first touches down
    _pressStartTime = DateTime.now();
    _dragExtent = 0.0;

    // Start a timer to check if they're holding still
    Future.delayed(_activationDelay, () {
      if (mounted && _pressStartTime != null) {
        final holdDuration = DateTime.now().difference(_pressStartTime!);
        // If they've been holding for the activation delay, enable swipe
        if (holdDuration >= _activationDelay && _dragExtent.abs() < 5.0) {
          setState(() {
            _isSwipeEnabled = true;
          });
        }
      }
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final delta = details.primaryDelta ?? 0.0;

    // If not yet enabled, check if they're trying to move too soon
    if (!_isSwipeEnabled) {
      // Track small movements but don't allow large swipes yet
      if (_pressStartTime != null) {
        final holdDuration = DateTime.now().difference(_pressStartTime!);
        // If they held still long enough, enable swiping
        if (holdDuration >= _activationDelay && _dragExtent.abs() < 5.0) {
          setState(() {
            _isSwipeEnabled = true;
          });
        }
      }
      // Don't process the swipe if not enabled yet
      if (!_isSwipeEnabled) return;
    }

    // Only allow swipe if corresponding action is provided
    if (delta > 0 && widget.onSwipeRight == null) return;
    if (delta < 0 && widget.onSwipeLeft == null) return;

    setState(() {
      _dragExtent = (_dragExtent + delta).clamp(-_maxSwipeExtent, _maxSwipeExtent);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0.0;
    final shouldTriggerAction = _dragExtent.abs() > _swipeThreshold ||
        velocity.abs() > 500;

    // Reset the gate - user must hold again for next swipe
    setState(() {
      _isSwipeEnabled = false;
      _pressStartTime = null;
    });

    if (shouldTriggerAction) {
      if (_dragExtent > 0 && widget.onSwipeRight != null) {
        // Swiped right (left to right)
        _animateToPosition(_maxSwipeExtent, () {
          widget.onSwipeRight!();
          _resetPosition();
        });
      } else if (_dragExtent < 0 && widget.onSwipeLeft != null) {
        // Swiped left (right to left)
        _animateToPosition(-_maxSwipeExtent, () {
          widget.onSwipeLeft!();
          _resetPosition();
        });
      } else {
        _resetPosition();
      }
    } else {
      _resetPosition();
    }
  }

  void _animateToPosition(double target, VoidCallback onComplete) {
    final animation = Tween<double>(
      begin: _dragExtent,
      end: target,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    animation.addListener(() {
      setState(() {
        _dragExtent = animation.value;
      });
    });

    _controller.forward(from: 0.0).then((_) {
      onComplete();
    });
  }

  void _resetPosition() {
    final animation = Tween<double>(
      begin: _dragExtent,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    animation.addListener(() {
      setState(() {
        _dragExtent = animation.value;
      });
    });

    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = widget.color ?? AppColors.surface;
    final shadows = _getShadows(widget.shadowLevel);
    final hasSwipeActions = widget.onSwipeLeft != null || widget.onSwipeRight != null;

    final cardContent = Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: effectiveColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: shadows,
        border: widget.border,
      ),
      child: widget.child,
    );

    Widget content = cardContent;

    // Wrap with GestureDetector if onTap is provided
    if (widget.onTap != null) {
      content = GestureDetector(
        onTap: widget.onTap,
        child: content,
      );
    }

    // Wrap with swipe functionality if swipe actions are provided
    if (hasSwipeActions) {
      return Container(
        margin: widget.margin,
        child: Stack(
          children: [
            // Background actions
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                child: Row(
                  children: [
                    // Right swipe action (left side)
                    if (widget.onSwipeRight != null)
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: widget.swipeRightColor ?? AppColors.purple4,
                            borderRadius: BorderRadius.circular(widget.borderRadius),
                          ),
                          child: AnimatedOpacity(
                            opacity: _dragExtent > 0 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 150),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  widget.swipeRightIcon ?? Icons.check,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                if (widget.swipeRightLabel != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.swipeRightLabel!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    // Left swipe action (right side)
                    if (widget.onSwipeLeft != null)
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: widget.swipeLeftColor ?? AppColors.error,
                            borderRadius: BorderRadius.circular(widget.borderRadius),
                          ),
                          child: AnimatedOpacity(
                            opacity: _dragExtent < 0 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 150),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  widget.swipeLeftIcon ?? Icons.delete,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                if (widget.swipeLeftLabel != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.swipeLeftLabel!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Sliding card content
            Transform.translate(
              offset: Offset(_dragExtent, 0),
              child: MouseRegion(
                onEnter: _handleHoverEnter,
                onExit: _handleHoverExit,
                child: GestureDetector(
                  onHorizontalDragStart: _handleDragStart,
                  onHorizontalDragUpdate: _handleDragUpdate,
                  onHorizontalDragEnd: _handleDragEnd,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      // Visual feedback when swipe is enabled
                      boxShadow: _isSwipeEnabled
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                blurRadius: 8,
                                spreadRadius: 2,
                              )
                            ]
                          : null,
                    ),
                    child: content,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: widget.margin,
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
      color: AppColors.surfaceGlass,
      shadowLevel: ShadowLevel.subtle,
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
      border: Border.all(
        color: AppColors.glassBorder,
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
