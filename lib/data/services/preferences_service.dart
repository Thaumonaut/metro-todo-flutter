import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_preferences.dart';

/// Service for managing user preferences using SharedPreferences
class PreferencesService {
  static const String _preferencesKey = 'app_preferences';

  final SharedPreferences _prefs;

  PreferencesService(this._prefs);

  /// Load preferences from storage
  AppPreferences loadPreferences() {
    final jsonString = _prefs.getString(_preferencesKey);
    if (jsonString == null) {
      return AppPreferences.defaults;
    }

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return AppPreferences.fromJson(json);
    } catch (e) {
      // If there's an error parsing, return defaults
      return AppPreferences.defaults;
    }
  }

  /// Save preferences to storage
  Future<bool> savePreferences(AppPreferences preferences) async {
    try {
      final jsonString = jsonEncode(preferences.toJson());
      return await _prefs.setString(_preferencesKey, jsonString);
    } catch (e) {
      return false;
    }
  }

  /// Reset preferences to defaults
  Future<bool> resetToDefaults() async {
    try {
      return await _prefs.remove(_preferencesKey);
    } catch (e) {
      return false;
    }
  }

  /// Clear all preferences (for testing or logout)
  Future<bool> clearAll() async {
    try {
      return await _prefs.clear();
    } catch (e) {
      return false;
    }
  }
}
