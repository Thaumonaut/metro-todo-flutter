import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/preferences_providers.dart';
import '../widgets/theme_mode_selector.dart';
import '../widgets/accent_color_picker.dart';

/// Theme settings page for customizing app appearance
class ThemeSettingsPage extends ConsumerWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(appPreferencesProvider);
    final preferencesNotifier = ref.read(appPreferencesProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme mode section
          Text(
            'Theme Mode',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ThemeModeSelector(
            currentMode: preferences.themeMode,
            onChanged: (mode) {
              preferencesNotifier.setThemeMode(mode);
            },
          ),
          const SizedBox(height: 32),

          // Accent color section
          Text(
            'Accent Color',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          AccentColorPicker(
            currentColor: preferences.accentColor,
            onChanged: (color) {
              preferencesNotifier.setAccentColor(color);
            },
          ),
          const SizedBox(height: 32),

          // Preview section
          Text(
            'Preview',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildPreviewCard(context),
        ],
      ),
    );
  }

  Widget _buildPreviewCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sample Task',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'This is how your tasks will appear with the selected theme.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('Primary Button'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Secondary'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
