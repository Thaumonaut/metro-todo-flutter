import 'package:flutter/material.dart';
import 'importance_level.dart';

/// User preferences for the application
class AppPreferences {
  /// Theme mode: light, dark, or system default
  final ThemeMode themeMode;

  /// Accent color name (e.g., 'purple', 'blue', 'green')
  final String accentColor;

  /// Default importance level for new tasks
  final ImportanceLevel defaultImportance;

  /// Whether notifications are enabled
  final bool notificationsEnabled;

  /// Enable reminders before due date
  final bool dueDateReminders;

  /// Enable alerts for overdue tasks
  final bool overdueReminders;

  /// Enable reminders for upcoming tasks
  final bool upcomingReminders;

  /// How many hours before due date to send reminder (1-48)
  final int reminderHoursBefore;

  const AppPreferences({
    this.themeMode = ThemeMode.system,
    this.accentColor = 'purple',
    this.defaultImportance = ImportanceLevel.medium,
    this.notificationsEnabled = true,
    this.dueDateReminders = true,
    this.overdueReminders = true,
    this.upcomingReminders = false,
    this.reminderHoursBefore = 24,
  });

  /// Create AppPreferences from JSON
  factory AppPreferences.fromJson(Map<String, dynamic> json) {
    return AppPreferences(
      themeMode: ThemeMode.values.firstWhere(
        (e) => e.name == json['themeMode'],
        orElse: () => ThemeMode.system,
      ),
      accentColor: json['accentColor'] as String? ?? 'purple',
      defaultImportance: ImportanceLevel.values.firstWhere(
        (e) => e.name == json['defaultImportance'],
        orElse: () => ImportanceLevel.medium,
      ),
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      dueDateReminders: json['dueDateReminders'] as bool? ?? true,
      overdueReminders: json['overdueReminders'] as bool? ?? true,
      upcomingReminders: json['upcomingReminders'] as bool? ?? false,
      reminderHoursBefore: json['reminderHoursBefore'] as int? ?? 24,
    );
  }

  /// Convert AppPreferences to JSON
  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.name,
      'accentColor': accentColor,
      'defaultImportance': defaultImportance.name,
      'notificationsEnabled': notificationsEnabled,
      'dueDateReminders': dueDateReminders,
      'overdueReminders': overdueReminders,
      'upcomingReminders': upcomingReminders,
      'reminderHoursBefore': reminderHoursBefore,
    };
  }

  /// Create a copy with updated values
  AppPreferences copyWith({
    ThemeMode? themeMode,
    String? accentColor,
    ImportanceLevel? defaultImportance,
    bool? notificationsEnabled,
    bool? dueDateReminders,
    bool? overdueReminders,
    bool? upcomingReminders,
    int? reminderHoursBefore,
  }) {
    return AppPreferences(
      themeMode: themeMode ?? this.themeMode,
      accentColor: accentColor ?? this.accentColor,
      defaultImportance: defaultImportance ?? this.defaultImportance,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      dueDateReminders: dueDateReminders ?? this.dueDateReminders,
      overdueReminders: overdueReminders ?? this.overdueReminders,
      upcomingReminders: upcomingReminders ?? this.upcomingReminders,
      reminderHoursBefore: reminderHoursBefore ?? this.reminderHoursBefore,
    );
  }

  /// Default preferences
  static const AppPreferences defaults = AppPreferences();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppPreferences &&
        other.themeMode == themeMode &&
        other.accentColor == accentColor &&
        other.defaultImportance == defaultImportance &&
        other.notificationsEnabled == notificationsEnabled &&
        other.dueDateReminders == dueDateReminders &&
        other.overdueReminders == overdueReminders &&
        other.upcomingReminders == upcomingReminders &&
        other.reminderHoursBefore == reminderHoursBefore;
  }

  @override
  int get hashCode {
    return Object.hash(
      themeMode,
      accentColor,
      defaultImportance,
      notificationsEnabled,
      dueDateReminders,
      overdueReminders,
      upcomingReminders,
      reminderHoursBefore,
    );
  }
}
