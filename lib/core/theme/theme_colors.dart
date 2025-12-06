import 'package:flutter/material.dart';

/// Theme color definitions for different accent colors
class ThemeColors {
  // Purple (default)
  static const purple = Color(0xFF8B5CF6);
  static const purpleLight = Color(0xFFA78BFA);
  static const purpleDark = Color(0xFF7C3AED);

  // Blue
  static const blue = Color(0xFF3B82F6);
  static const blueLight = Color(0xFF60A5FA);
  static const blueDark = Color(0xFF2563EB);

  // Green
  static const green = Color(0xFF10B981);
  static const greenLight = Color(0xFF34D399);
  static const greenDark = Color(0xFF059669);

  // Orange
  static const orange = Color(0xFFF97316);
  static const orangeLight = Color(0xFFFB923C);
  static const orangeDark = Color(0xFFEA580C);

  // Red
  static const red = Color(0xFFEF4444);
  static const redLight = Color(0xFFF87171);
  static const redDark = Color(0xFFDC2626);

  // Pink
  static const pink = Color(0xFFEC4899);
  static const pinkLight = Color(0xFFF472B6);
  static const pinkDark = Color(0xFFDB2777);

  /// Get primary color by name
  static Color getPrimaryColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return blue;
      case 'green':
        return green;
      case 'orange':
        return orange;
      case 'red':
        return red;
      case 'pink':
        return pink;
      case 'purple':
      default:
        return purple;
    }
  }

  /// Get light variant by name
  static Color getLightVariant(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return blueLight;
      case 'green':
        return greenLight;
      case 'orange':
        return orangeLight;
      case 'red':
        return redLight;
      case 'pink':
        return pinkLight;
      case 'purple':
      default:
        return purpleLight;
    }
  }

  /// Get dark variant by name
  static Color getDarkVariant(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return blueDark;
      case 'green':
        return greenDark;
      case 'orange':
        return orangeDark;
      case 'red':
        return redDark;
      case 'pink':
        return pinkDark;
      case 'purple':
      default:
        return purpleDark;
    }
  }

  /// Available color names
  static const List<String> availableColors = [
    'purple',
    'blue',
    'green',
    'orange',
    'red',
    'pink',
  ];
}
