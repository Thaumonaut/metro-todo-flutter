import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/preferences_providers.dart';
import 'core/providers/app_initialization_provider.dart';
import 'core/utils/global_keys.dart';
import 'features/home/presentation/pages/home_page.dart';

import 'dart:io';
import 'shared/widgets/metro_title_bar.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // CRITICAL: Only do lightweight initialization synchronously
  // Heavy operations are deferred to prevent blocking the main thread
  final sharedPreferences = await SharedPreferences.getInstance();

  // Run the app immediately - don't block on heavy initialization
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );

  // Configure window size only on desktop platforms
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() {
      const initialSize = Size(1280, 720);
      appWindow.minSize = const Size(600, 450);
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final accentColor = ref.watch(accentColorProvider);

    // Trigger async initialization (non-blocking)
    // This starts database, notifications, and background tasks in the background
    // without blocking the main thread
    ref.watch(appInitializationProvider);

    return MaterialApp(
      title: 'Metro Todo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme(accentColor),
      darkTheme: AppTheme.darkTheme(accentColor),
      themeMode: themeMode,
      home: const HomePage(),
      builder: (context, child) {
        if (Platform.isWindows) {
          return Column(
            children: [
              const MetroTitleBar(),
              Expanded(child: child!),
            ],
          );
        }
        return child!;
      },
    );
  }
}
