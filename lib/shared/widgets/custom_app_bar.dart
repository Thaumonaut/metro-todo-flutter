import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_constants.dart';

/// Custom AppBar with Metro/Fluent styling
/// Supports transparent/glass background and custom actions
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.transparent = false,
    this.glassEffect = false,
    this.elevation = 0,
    this.centerTitle = false,
    this.bottom,
  });

  /// Title widget (typically Text)
  final Widget? title;

  /// Leading widget (typically back button or menu)
  final Widget? leading;

  /// Action widgets on the right side
  final List<Widget>? actions;

  /// Background color (ignored if transparent or glassEffect is true)
  final Color? backgroundColor;

  /// Foreground color for text and icons
  final Color? foregroundColor;

  /// Whether the app bar should be transparent
  final bool transparent;

  /// Whether to apply glass effect (backdrop blur)
  final bool glassEffect;

  /// Elevation shadow
  final double elevation;

  /// Whether to center the title
  final bool centerTitle;

  /// Optional bottom widget (e.g., TabBar)
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(
        AppConstants.appBarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    final effectiveForegroundColor = foregroundColor ?? AppColors.textPrimary;

    Widget appBarContent = AppBar(
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: transparent || glassEffect
          ? Colors.transparent
          : backgroundColor ?? AppColors.surface,
      foregroundColor: effectiveForegroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      bottom: bottom,
      titleTextStyle: AppTypography.h3.copyWith(
        color: effectiveForegroundColor,
      ),
      iconTheme: IconThemeData(
        color: effectiveForegroundColor,
      ),
    );

    // Wrap with glass effect if enabled
    if (glassEffect && !transparent) {
      appBarContent = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceGlass,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.glassBorder,
                  width: 1,
                ),
              ),
            ),
            child: appBarContent,
          ),
        ),
      );
    }

    return appBarContent;
  }
}

/// A large Metro-style header for panoramic pages
class MetroPageHeader extends StatelessWidget {
  const MetroPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.backgroundColor,
  });

  /// Large bold title
  final String title;

  /// Optional subtitle
  final String? subtitle;

  /// Action buttons
  final List<Widget>? actions;

  /// Background color
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Actions row
          if (actions != null && actions!.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!,
            ),

          // Title
          Text(
            title,
            style: AppTypography.hero.copyWith(
              color: AppColors.textPrimary,
            ),
          ),

          // Subtitle
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A collapsible app bar with Metro styling
class MetroSliverAppBar extends StatelessWidget {
  const MetroSliverAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.backgroundColor,
    this.expandedHeight = 200.0,
    this.floating = true,
    this.pinned = true,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double expandedHeight;
  final bool floating;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: floating,
      pinned: pinned,
      backgroundColor: backgroundColor ?? AppColors.primary,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: AppTypography.h2.copyWith(
            color: Colors.white,
          ),
        ),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                backgroundColor ?? AppColors.primary,
                (backgroundColor ?? AppColors.primary).withValues(alpha: 0.8),
              ],
            ),
          ),
          child: subtitle != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 48),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      subtitle!,
                      style: AppTypography.body1.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
