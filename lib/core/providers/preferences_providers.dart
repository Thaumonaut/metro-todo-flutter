import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/app_preferences.dart';
import '../../data/models/importance_level.dart';
import '../../data/services/preferences_service.dart';

/// Provider for SharedPreferences instance
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized in main.dart');
});

/// Provider for PreferencesService
final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PreferencesService(prefs);
});

/// StateNotifier for managing app preferences
class AppPreferencesNotifier extends StateNotifier<AppPreferences> {
  final PreferencesService _service;

  AppPreferencesNotifier(this._service) : super(AppPreferences.defaults) {
    _loadPreferences();
  }

  /// Load preferences from storage
  void _loadPreferences() {
    state = _service.loadPreferences();
  }

  /// Update theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    final updated = state.copyWith(themeMode: mode);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Update accent color
  Future<void> setAccentColor(String color) async {
    final updated = state.copyWith(accentColor: color);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Update default importance
  Future<void> setDefaultImportance(ImportanceLevel importance) async {
    final updated = state.copyWith(defaultImportance: importance);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Toggle notifications enabled
  Future<void> setNotificationsEnabled(bool enabled) async {
    final updated = state.copyWith(notificationsEnabled: enabled);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Toggle due date reminders
  Future<void> setDueDateReminders(bool enabled) async {
    final updated = state.copyWith(dueDateReminders: enabled);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Toggle overdue reminders
  Future<void> setOverdueReminders(bool enabled) async {
    final updated = state.copyWith(overdueReminders: enabled);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Toggle upcoming reminders
  Future<void> setUpcomingReminders(bool enabled) async {
    final updated = state.copyWith(upcomingReminders: enabled);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Update reminder hours before
  Future<void> setReminderHoursBefore(int hours) async {
    final updated = state.copyWith(reminderHoursBefore: hours);
    await _service.savePreferences(updated);
    state = updated;
  }

  /// Reset to defaults
  Future<void> resetToDefaults() async {
    await _service.resetToDefaults();
    state = AppPreferences.defaults;
  }
}

/// Provider for app preferences state
final appPreferencesProvider =
    StateNotifierProvider<AppPreferencesNotifier, AppPreferences>((ref) {
  final service = ref.watch(preferencesServiceProvider);
  return AppPreferencesNotifier(service);
});

/// Computed provider for theme mode
final themeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(appPreferencesProvider).themeMode;
});

/// Computed provider for accent color
final accentColorProvider = Provider<String>((ref) {
  return ref.watch(appPreferencesProvider).accentColor;
});

/// Computed provider for default importance
final defaultImportanceProvider = Provider<ImportanceLevel>((ref) {
  return ref.watch(appPreferencesProvider).defaultImportance;
});
