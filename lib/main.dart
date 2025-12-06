import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/preferences_providers.dart';
import 'data/services/database_service.dart';
import 'data/services/background_task_service.dart';
import 'data/services/notification_service.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar database
  await DatabaseService.initialize();

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Initialize notification service
  await NotificationService().initialize();

  // Initialize background task service
  await BackgroundTaskService.initialize();
  await BackgroundTaskService.registerPeriodicTasks();

  // Run the app with Riverpod
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
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
    );
  }
}
