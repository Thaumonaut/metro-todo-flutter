import 'package:flutter/animation.dart';

/// Animation constants for consistent timing and curves
class AnimationConstants {
  // Duration values (in milliseconds)
  static const int durationFast = 150;
  static const int durationNormal = 250;
  static const int durationSlow = 350;

  // Duration objects for Flutter animations
  static const Duration fast = Duration(milliseconds: durationFast);
  static const Duration normal = Duration(milliseconds: durationNormal);
  static const Duration slow = Duration(milliseconds: durationSlow);

  // Animation curves
  static const Curve curveDefault = Curves.easeOutCubic;
  static const Curve curveEmphasized = Curves.easeInOutCubic;
  static const Curve curveDecelerate = Curves.easeOut;
  static const Curve curveAccelerate = Curves.easeIn;
  static const Curve curveLinear = Curves.linear;

  // Stagger delays for list animations (in milliseconds)
  static const int staggerDelay = 50;
  static const Duration stagger = Duration(milliseconds: staggerDelay);

  // Page transition duration
  static const Duration pageTransition = Duration(milliseconds: 300);

  // Hero animation duration (uses Flutter default)
  static const Duration hero = Duration(milliseconds: 300);

  // Glassmorphism blur amount
  static const double glassBlurSigma = 10.0;
  static const double glassBlurSigmaStrong = 20.0;
}
