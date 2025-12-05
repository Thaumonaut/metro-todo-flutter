import 'package:flutter/material.dart';
import '../../core/constants/animation_constants.dart';

/// Custom page route transitions for Metro/Fluent style navigation
class RouteTransitions {
  /// Slide transition from right (default for forward navigation)
  static Route<T> slideRight<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: AnimationConstants.pageTransition,
      reverseTransitionDuration: AnimationConstants.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: AnimationConstants.curveDefault),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  /// Slide transition from bottom (good for modals)
  static Route<T> slideUp<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: AnimationConstants.pageTransition,
      reverseTransitionDuration: AnimationConstants.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: AnimationConstants.curveDefault),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  /// Fade transition (subtle, elegant)
  static Route<T> fade<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: AnimationConstants.pageTransition,
      reverseTransitionDuration: AnimationConstants.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// Scale and fade transition (emphasis)
  static Route<T> scaleFade<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: AnimationConstants.pageTransition,
      reverseTransitionDuration: AnimationConstants.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.8;
        const end = 1.0;
        final scaleTween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: AnimationConstants.curveDefault),
        );
        final scaleAnimation = animation.drive(scaleTween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  /// Combined slide and fade (smooth, modern)
  static Route<T> slideFade<T>(Widget page, {SlideDirection direction = SlideDirection.right}) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: AnimationConstants.pageTransition,
      reverseTransitionDuration: AnimationConstants.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Offset begin;
        switch (direction) {
          case SlideDirection.left:
            begin = const Offset(-0.3, 0.0);
            break;
          case SlideDirection.right:
            begin = const Offset(0.3, 0.0);
            break;
          case SlideDirection.up:
            begin = const Offset(0.0, -0.3);
            break;
          case SlideDirection.down:
            begin = const Offset(0.0, 0.3);
            break;
        }

        final tween = Tween(begin: begin, end: Offset.zero).chain(
          CurveTween(curve: AnimationConstants.curveDefault),
        );
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  /// No transition (instant)
  static Route<T> none<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  /// Custom panoramic slide (Metro style)
  /// Slides in from right with previous page sliding out to left
  static Route<T> panoramic<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: AnimationConstants.pageTransition,
      reverseTransitionDuration: AnimationConstants.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Incoming page slides from right
        final incomingTween = Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: AnimationConstants.curveDefault));
        final incomingAnimation = animation.drive(incomingTween);

        // Outgoing page slides to left
        final outgoingTween = Tween(
          begin: Offset.zero,
          end: const Offset(-0.3, 0.0),
        ).chain(CurveTween(curve: AnimationConstants.curveDefault));
        final outgoingAnimation = secondaryAnimation.drive(outgoingTween);

        return Stack(
          children: [
            SlideTransition(
              position: outgoingAnimation,
              child: FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.5).animate(secondaryAnimation),
                child: Container(),
              ),
            ),
            SlideTransition(
              position: incomingAnimation,
              child: child,
            ),
          ],
        );
      },
    );
  }
}

/// Directions for slide transitions
enum SlideDirection {
  left,
  right,
  up,
  down,
}

/// Extension method to add route transitions to any widget
extension RouteTransitionExtension on Widget {
  /// Navigate to this widget with slide right transition
  Future<T?> navigateSlideRight<T>(BuildContext context) {
    return Navigator.push<T>(
      context,
      RouteTransitions.slideRight(this),
    );
  }

  /// Navigate to this widget with slide up transition
  Future<T?> navigateSlideUp<T>(BuildContext context) {
    return Navigator.push<T>(
      context,
      RouteTransitions.slideUp(this),
    );
  }

  /// Navigate to this widget with fade transition
  Future<T?> navigateFade<T>(BuildContext context) {
    return Navigator.push<T>(
      context,
      RouteTransitions.fade(this),
    );
  }

  /// Navigate to this widget with scale fade transition
  Future<T?> navigateScaleFade<T>(BuildContext context) {
    return Navigator.push<T>(
      context,
      RouteTransitions.scaleFade(this),
    );
  }

  /// Navigate to this widget with panoramic transition
  Future<T?> navigatePanoramic<T>(BuildContext context) {
    return Navigator.push<T>(
      context,
      RouteTransitions.panoramic(this),
    );
  }
}
