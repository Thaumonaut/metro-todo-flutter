import 'package:flutter/material.dart';

/// Shadow definitions for Fluent design depth system
class AppShadows {
  // Subtle shadow - For slightly elevated elements
  // Used for: Chips, small cards
  static const BoxShadow subtle = BoxShadow(
    color: Color(0x0A000000), // 4% opacity
    blurRadius: 4,
    offset: Offset(0, 1),
    spreadRadius: 0,
  );

  // Medium shadow - For moderately elevated elements
  // Used for: Cards, buttons
  static const BoxShadow medium = BoxShadow(
    color: Color(0x14000000), // 8% opacity
    blurRadius: 8,
    offset: Offset(0, 2),
    spreadRadius: 0,
  );

  // Elevated shadow - For prominently elevated elements
  // Used for: Modals, drawers
  static const BoxShadow elevated = BoxShadow(
    color: Color(0x1F000000), // 12% opacity
    blurRadius: 16,
    offset: Offset(0, 4),
    spreadRadius: 0,
  );

  // Floating shadow - For floating elements
  // Used for: FABs, tooltips, menus
  static const BoxShadow floating = BoxShadow(
    color: Color(0x29000000), // 16% opacity
    blurRadius: 24,
    offset: Offset(0, 8),
    spreadRadius: 0,
  );

  // Helper methods to get shadow lists
  static List<BoxShadow> get subtleShadows => [subtle];
  static List<BoxShadow> get mediumShadows => [medium];
  static List<BoxShadow> get elevatedShadows => [elevated];
  static List<BoxShadow> get floatingShadows => [floating];

  // Combined shadow for extra depth (use sparingly)
  static List<BoxShadow> get combinedElevated => [
    const BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
    const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];
}
