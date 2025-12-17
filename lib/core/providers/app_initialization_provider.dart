import 'dart:io';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/database_service.dart';
import '../../data/services/notification_service.dart';
import '../../data/services/background_task_service.dart';

/// Tracks the initialization state of the app
enum AppInitializationState {
  notStarted,
  initializing,
  completed,
  error,
}

/// Provider for app initialization status
final appInitializationProvider =
    StateNotifierProvider<AppInitializationNotifier, AppInitializationState>(
  (ref) => AppInitializationNotifier(),
);

/// Manages async initialization of heavy services
/// This prevents blocking the main thread during app startup
class AppInitializationNotifier extends StateNotifier<AppInitializationState> {
  AppInitializationNotifier() : super(AppInitializationState.notStarted) {
    _initialize();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> _initialize() async {
    if (state != AppInitializationState.notStarted) return;

    state = AppInitializationState.initializing;
    debugPrint('🚀 [APP INIT] Starting async initialization...');

    try {
      // Initialize database
      debugPrint('   📦 Initializing database...');
      await DatabaseService.initialize();
      debugPrint('   ✅ Database initialized');

      // Initialize notification service
      debugPrint('   🔔 Initializing notification service...');
      final notificationService = NotificationService();
      await notificationService.initialize();
      debugPrint('   ✅ Notification service initialized');

      // Request notification permissions on mobile platforms
      // This is done AFTER the UI is rendered to avoid blocking
      if (Platform.isAndroid || Platform.isIOS) {
        try {
          debugPrint('   🔐 Requesting notification permissions...');

          // Request basic notification permission
          final granted = await notificationService.requestPermissions();
          debugPrint('   📋 Basic notification permission: $granted');

          // Request exact alarm permission (Android 12+)
          // Note: On some devices (especially OnePlus), this may conflict
          // with aggressive battery optimization
          final hasExactAlarmPermission =
              await notificationService.requestExactAlarmPermission();
          debugPrint('   ⏰ Exact alarm permission: $hasExactAlarmPermission');

          if (!hasExactAlarmPermission) {
            debugPrint(
                '   ⚠️ Exact alarm permission not granted. Scheduled notifications may not work.');
            debugPrint(
                '   ⚠️ On OnePlus devices, you may need to enable Auto-Launch and disable battery optimization.');
          }
        } catch (e) {
          debugPrint('   ❌ Error requesting notification permissions: $e');
        }
      }

      // Initialize background task service (only on Android/iOS)
      // IMPORTANT: This uses WorkManager which may conflict with OnePlus battery optimization
      // On OnePlus devices, background tasks may be killed aggressively
      if (Platform.isAndroid || Platform.isIOS) {
        try {
          debugPrint('   🔄 Initializing background task service...');
          await BackgroundTaskService.initialize();
          await BackgroundTaskService.registerPeriodicTasks();
          debugPrint('   ✅ Background tasks registered');
          debugPrint(
              '   ⚠️ Note: OnePlus devices may kill background tasks aggressively.');
        } catch (e) {
          debugPrint('   ⚠️ Background tasks failed (may not be supported): $e');
          // Don't fail initialization if background tasks fail
          // They're nice to have but not critical
        }
      }

      debugPrint('🎉 [APP INIT] Initialization complete!');
      state = AppInitializationState.completed;
    } catch (e, stackTrace) {
      debugPrint('❌ [APP INIT] Initialization failed: $e');
      debugPrint('   Stack trace: $stackTrace');
      _errorMessage = e.toString();
      state = AppInitializationState.error;
    }
  }

  /// Retry initialization if it failed
  Future<void> retry() async {
    if (state == AppInitializationState.error) {
      _errorMessage = null;
      state = AppInitializationState.notStarted;
      await _initialize();
    }
  }
}
