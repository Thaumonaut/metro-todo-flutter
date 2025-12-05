import 'package:flutter/material.dart';

/// Color palette for the Metro/Fluent Todo app
/// Purple gradient palette from: https://coolors.co/palette/ea698b-d55d92-c05299-ac46a1-973aa8-822faf-6d23b6-6411ad-571089-47126b
class AppColors {
  // Purple gradient palette (10 shades)
  static const Color purple1 = Color(0xFFEA698B);
  static const Color purple2 = Color(0xFFD55D92);
  static const Color purple3 = Color(0xFFC05299);
  static const Color purple4 = Color(0xFFAC46A1);
  static const Color purple5 = Color(0xFF973AA8);
  static const Color purple6 = Color(0xFF822FAF);
  static const Color purple7 = Color(0xFF6D23B6);
  static const Color purple8 = Color(0xFF6411AD);
  static const Color purple9 = Color(0xFF571089);
  static const Color purple10 = Color(0xFF47126B);

  // Semantic colors
  static const Color primary = purple6; // Main app color
  static const Color accent = purple4; // Accent/highlight color
  static const Color background = Color(0xFFF5F5F5); // Light background
  static const Color surface = Colors.white; // Card/surface color
  static const Color surfaceGlass = Color(0xCCFFFFFF); // 80% opacity for glass effect

  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Colors.white;

  // Importance level colors
  static const Color lowImportance = Color(0xFF4CAF50); // Green
  static const Color mediumImportance = Color(0xFFFF9800); // Orange
  static const Color highImportance = Color(0xFFFF5722); // Deep orange/red
  static const Color criticalImportance = Color(0xFFD32F2F); // Red

  // Status colors
  static const Color notStarted = Color(0xFF9E9E9E); // Gray
  static const Color inProgress = Color(0xFF2196F3); // Blue
  static const Color onHold = Color(0xFFFF9800); // Orange
  static const Color completed = Color(0xFF4CAF50); // Green

  // UI element colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);

  // Glass effect border color
  static const Color glassBorder = Color(0x4DFFFFFF); // 30% white opacity
}
