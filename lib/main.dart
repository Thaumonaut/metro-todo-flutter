import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/preferences_providers.dart';
import 'data/services/database_service.dart';
import 'data/services/background_task_service.dart';
import 'data/services/notification_service.dart';
import 'features/home/presentation/pages/home_page.dart';

import 'dart:io';
import 'shared/widgets/metro_title_bar.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar database
  await DatabaseService.initialize();

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Initialize notification service
  await NotificationService().initialize();

  // Initialize background task service (only on Android/iOS)
  try {
    await BackgroundTaskService.initialize();
    await BackgroundTaskService.registerPeriodicTasks();
  } catch (e) {
    debugPrint('Background tasks not supported on this platform: $e');
  }

  // Run the app with Riverpod
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );

  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    appWindow.minSize = const Size(600, 450);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final accentColor = ref.watch(accentColorProvider);

    return MaterialApp(
      title: 'Metro Todo',
      debugShowCheckedModeBanner: false,
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
