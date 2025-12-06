import 'package:flutter/material.dart';

/// Widget for selecting theme mode (light, dark, system)
class ThemeModeSelector extends StatelessWidget {
  final ThemeMode currentMode;
  final ValueChanged<ThemeMode> onChanged;

  const ThemeModeSelector({
    super.key,
    required this.currentMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ThemeMode>(
      segments: const [
        ButtonSegment<ThemeMode>(
          value: ThemeMode.light,
          label: Text('Light'),
          icon: Icon(Icons.light_mode),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.dark,
          label: Text('Dark'),
          icon: Icon(Icons.dark_mode),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.system,
          label: Text('System'),
          icon: Icon(Icons.brightness_auto),
        ),
      ],
      selected: {currentMode},
      onSelectionChanged: (Set<ThemeMode> selection) {
        onChanged(selection.first);
      },
    );
  }
}
