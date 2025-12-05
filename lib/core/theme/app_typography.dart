import 'package:flutter/material.dart';

/// Typography system for Metro/Fluent style
/// Features bold, prominent headings inspired by Windows Metro design
class AppTypography {
  // Font family - defaults to system font (Segoe UI on Windows, San Francisco on iOS)
  static const String fontFamily = 'System';

  // Metro-style hero text (extra large, bold)
  static const TextStyle hero = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.5,
    height: 1.1,
  );

  // Heading 1 - Large section headers
  static const TextStyle h1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    letterSpacing: -1.0,
    height: 1.2,
  );

  // Heading 2 - Medium section headers
  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.25,
  );

  // Heading 3 - Small section headers
  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.3,
  );

  // Heading 4 - Card titles
  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.4,
  );

  // Body 1 - Primary body text
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  // Body 2 - Secondary body text
  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.5,
  );

  // Caption - Small supporting text
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.5,
  );

  // Button text - Medium weight for buttons
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    height: 1.0,
  );

  // Overline - Small uppercase labels
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.0,
  );
}
