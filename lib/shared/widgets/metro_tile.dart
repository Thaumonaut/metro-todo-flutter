import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/animation_constants.dart';

/// A large, bold, colorful tile inspired by Windows Metro design
class MetroTile extends StatefulWidget {
  const MetroTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.color,
    this.icon,
    this.badge,
    this.onTap,
    this.width = AppConstants.metroTileMedium,
    this.height = AppConstants.metroTileMedium,
    this.borderRadius = AppConstants.radiusLarge,
  });

  /// Main title text (bold, prominent)
  final String title;

  /// Optional subtitle text
  final String? subtitle;

  /// Background color of the tile
  final Color color;

  /// Optional icon to display
  final IconData? icon;

  /// Optional badge widget (e.g., for counts)
  final Widget? badge;

  /// Callback when tile is tapped
  final VoidCallback? onTap;

  /// Width of the tile
  final double width;

  /// Height of the tile
  final double height;

  /// Border radius for rounded corners
  final double borderRadius;

  @override
  State<MetroTile> createState() => _MetroTileState();
}

class _MetroTileState extends State<MetroTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: widget.onTap != null ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: widget.onTap != null ? () => setState(() => _isPressed = false) : null,
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: AnimationConstants.fast,
        curve: AnimationConstants.curveDefault,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: _isPressed ? AppShadows.subtleShadows : AppShadows.mediumShadows,
          ),
          child: Stack(
            children: [
              // Main content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: widget.subtitle != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    // Icon (if provided)
                    if (widget.icon != null)
                      Icon(
                        widget.icon,
                        size: AppConstants.iconLarge,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),

                    // Title and subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.title,
                            style: AppTypography.h3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (widget.subtitle != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              widget.subtitle!,
                              style: AppTypography.body2.copyWith(
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Badge (if provided)
              if (widget.badge != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: widget.badge!,
                ),
            ],
          ),
        ),
      ),
    ).animate(
      onPlay: (controller) => controller.forward(),
    ).fadeIn(
      duration: AnimationConstants.normal,
    ).slideY(
      begin: 0.2,
      end: 0,
      duration: AnimationConstants.normal,
      curve: AnimationConstants.curveDefault,
    );
  }
}

/// A wide Metro tile variant (2x1 aspect ratio)
class WideMetroTile extends StatelessWidget {
  const WideMetroTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.color,
    this.icon,
    this.badge,
    this.onTap,
    this.height = AppConstants.metroTileMedium,
    this.borderRadius = AppConstants.radiusLarge,
  });

  final String title;
  final String? subtitle;
  final Color color;
  final IconData? icon;
  final Widget? badge;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MetroTile(
      title: title,
      subtitle: subtitle,
      color: color,
      icon: icon,
      badge: badge,
      onTap: onTap,
      width: AppConstants.metroTileWide,
      height: height,
      borderRadius: borderRadius,
    );
  }
}

/// A small Metro tile variant
class SmallMetroTile extends StatelessWidget {
  const SmallMetroTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.color,
    this.icon,
    this.badge,
    this.onTap,
    this.borderRadius = AppConstants.radiusLarge,
  });

  final String title;
  final String? subtitle;
  final Color color;
  final IconData? icon;
  final Widget? badge;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MetroTile(
      title: title,
      subtitle: subtitle,
      color: color,
      icon: icon,
      badge: badge,
      onTap: onTap,
      width: AppConstants.metroTileSmall,
      height: AppConstants.metroTileSmall,
      borderRadius: borderRadius,
    );
  }
}
