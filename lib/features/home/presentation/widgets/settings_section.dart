import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/features/settings/presentation/pages/notification_settings_page.dart';
import '../../../../core/theme/app_typography.dart';
// Using Flutter framework's `RadioGroup`.
import '../../../../core/providers/preferences_providers.dart';
import '../../../../data/models/importance_level.dart';
import '../../../settings/presentation/pages/theme_settings_page.dart';

/// The settings section of the home page
/// Displays various settings options organized into groups
class SettingsSection extends ConsumerWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(appPreferencesProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'settings',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w300,
                letterSpacing: -1.0,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Preferences group
          _buildSettingsGroup(context, 'Preferences', [
            SettingsItem(
              title: 'Theme',
              subtitle: _getThemeModeLabel(preferences.themeMode),
              icon: Icons.palette,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemeSettingsPage(),
                  ),
                );
              },
            ),
            SettingsItem(
              title: 'Notifications',
              subtitle: preferences.notificationsEnabled
                  ? 'Enabled'
                  : 'Disabled',
              icon: Icons.notifications,
              onTap: () {
                // TODO: Implement notification settings
                // HINT: You'll need to create a notifications settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettingsPage(),
                  ),
                );
              },
            ),
            SettingsItem(
              title: 'Default Importance',
              subtitle: preferences.defaultImportance.label,
              icon: Icons.flag,
              onTap: () => _showDefaultImportanceDialog(context, ref),
            ),
          ]),

          const SizedBox(height: 24),

          // Data group
          // _buildSettingsGroup(
          //   'Data',
          //   [
          //     SettingsItem(
          //       title: 'Export Data',
          //       subtitle: 'Backup your tasks',
          //       icon: Icons.upload,
          //       onTap: () {
          //         // TODO: Implement export data functionality
          //         // HINT: You'll need to serialize tasks to JSON and save to file
          //       },
          //     ),
          //     SettingsItem(
          //       title: 'Import Data',
          //       subtitle: 'Restore from backup',
          //       icon: Icons.download,
          //       onTap: () {
          //         // TODO: Implement import data functionality
          //         // HINT: You'll need to read JSON file and restore tasks
          //       },
          //     ),
          //     SettingsItem(
          //       title: 'Clear Completed',
          //       subtitle: 'Remove all completed tasks',
          //       icon: Icons.delete_sweep,
          //       onTap: () {
          //         // TODO: Implement clear completed tasks functionality
          //         // HINT: Show a confirmation dialog first, then delete from repository
          //       },
          //       isDestructive: true,
          //     ),
          //   ],
          // ),
          const SizedBox(height: 24),

          // About group
          _buildSettingsGroup(context, 'About', [
            SettingsItem(
              title: 'Version',
              subtitle: '1.0.0',
              icon: Icons.info,
              onTap: () {
                // TODO: Implement about/version info
                // HINT: You could show a dialog with app version and credits
              },
            ),
            SettingsItem(
              title: 'Help & Support',
              subtitle: 'Get help using the app',
              icon: Icons.help,
              onTap: () {
                // TODO: Implement help & support page
                // HINT: You could navigate to a help page or open external URL
              },
            ),
          ]),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Builds a group of settings items with a title
  Widget _buildSettingsGroup(
    BuildContext context,
    String title,
    List<SettingsItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title.toLowerCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _buildSettingsItemWidget(context, item),
          ),
        ),
      ],
    );
  }

  /// Builds a single settings item widget
  Widget _buildSettingsItemWidget(BuildContext context, SettingsItem item) {
    return InkWell(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: item.isDestructive
                    ? Theme.of(context).colorScheme.error.withValues(alpha: 0.1)
                    : Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item.icon,
                size: 20,
                color: item.isDestructive
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),

            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTypography.body1.copyWith(
                      color: item.isDestructive
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      item.subtitle!,
                      style: AppTypography.body2.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Chevron icon
            Icon(
              Icons.chevron_right,
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to get theme mode label
  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  /// Show dialog to select default importance
  void _showDefaultImportanceDialog(BuildContext context, WidgetRef ref) {
    final currentImportance = ref
        .read(appPreferencesProvider)
        .defaultImportance;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Default Importance', style: AppTypography.h3),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...ImportanceLevel.values.map((importance) {
              return RadioListTile<ImportanceLevel>(
                value: importance,
                groupValue: currentImportance, // ignore: deprecated_member_use
                title: Text(importance.label),
                onChanged: (v) {
                  // ignore: deprecated_member_use
                  if (v != null) {
                    ref
                        .read(appPreferencesProvider.notifier)
                        .setDefaultImportance(v);
                    Navigator.pop(context);
                  }
                },
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

/// Data class for a settings item
class SettingsItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;

  SettingsItem({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onTap,
    this.isDestructive = false,
  });
}
