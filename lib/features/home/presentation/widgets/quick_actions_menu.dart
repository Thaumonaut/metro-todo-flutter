import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';

/// A bottom sheet menu displaying quick action options
/// Used from the "More" button on the home page
class QuickActionsMenu extends StatelessWidget {
  const QuickActionsMenu({
    super.key,
    required this.onUrgentTap,
    required this.onTagsTap,
    required this.onSearchTap,
    required this.onSettingsTap,
  });

  final VoidCallback onUrgentTap;
  final VoidCallback onTagsTap;
  final VoidCallback onSearchTap;
  final VoidCallback onSettingsTap;


  static void show(
    BuildContext context, {
    required VoidCallback onUrgentTap,
    required VoidCallback onTagsTap,
    required VoidCallback onSearchTap,
    required VoidCallback onSettingsTap,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => QuickActionsMenu(
        onUrgentTap: () {
          Navigator.pop(context);
          onUrgentTap();
        },
        onTagsTap: () {
          Navigator.pop(context);
          onTagsTap();
        },
        onSearchTap: () {
          Navigator.pop(context);
          onSearchTap();
        },
        onSettingsTap: () {
          Navigator.pop(context);
          onSettingsTap();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Menu items
          _QuickActionMenuItem(
            icon: Icons.priority_high,
            title: 'Urgent Tasks',
            onTap: onUrgentTap,
          ),
          _QuickActionMenuItem(
            icon: Icons.label,
            title: 'Tags',
            onTap: onTagsTap,
          ),
          _QuickActionMenuItem(
            icon: Icons.search,
            title: 'Search',
            onTap: onSearchTap,
          ),
          _QuickActionMenuItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: onSettingsTap,
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// A single menu item in the quick actions menu
class _QuickActionMenuItem extends StatelessWidget {
  const _QuickActionMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTypography.body1.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
