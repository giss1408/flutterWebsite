import 'package:flutter/material.dart';

/// Professional animations and transitions for smooth, polished interactions
class ModernAnimations {
  // Standard durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // Curves for different animation types
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeIn = Curves.easeIn;
  static const Curve elastic = Curves.elasticOut;
  static const Curve bouncy = Curves.bounceOut;

  // Standard transitions
  static Tween<double> fadeTransition = Tween<double>(begin: 0, end: 1);
  static Tween<Offset> slideInFromLeft = Tween<Offset>(
    begin: const Offset(-0.3, 0),
    end: Offset.zero,
  );
  static Tween<Offset> slideInFromRight = Tween<Offset>(
    begin: const Offset(0.3, 0),
    end: Offset.zero,
  );
  static Tween<Offset> slideInFromTop = Tween<Offset>(
    begin: const Offset(0, -0.3),
    end: Offset.zero,
  );
  static Tween<Offset> slideInFromBottom = Tween<Offset>(
    begin: const Offset(0, 0.3),
    end: Offset.zero,
  );

  // Scale animation
  static Tween<double> scaleAnimation = Tween<double>(begin: 0.8, end: 1.0);

  /// Fade animation with custom duration
  static Animation<double> fade(
    AnimationController controller, {
    Duration duration = normal,
  }) {
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: easeInOut),
    );
  }

  /// Slide animation from left
  static Animation<Offset> slideInLeft(
    AnimationController controller, {
    Duration duration = normal,
  }) {
    return Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: easeOut),
    );
  }

  /// Slide animation from right
  static Animation<Offset> slideInRight(
    AnimationController controller, {
    Duration duration = normal,
  }) {
    return Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: easeOut),
    );
  }

  /// Scale animation
  static Animation<double> scale(
    AnimationController controller, {
    Duration duration = normal,
    double begin = 0.8,
  }) {
    return Tween<double>(begin: begin, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: easeOut),
    );
  }
}

/// Widget animation helpers
class ModernAnimatedWidgets {
  /// Fade in animation widget
  static Widget fadeInWidget({
    required Widget child,
    required bool show,
    Duration duration = const Duration(milliseconds: 300),
    Duration delay = const Duration(milliseconds: 0),
  }) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return AnimatedOpacity(
          opacity: show ? 1 : 0,
          duration: duration,
          child: child,
        );
      },
    );
  }

  /// Slide transition widget
  static Widget slideInWidget({
    required Widget child,
    required bool show,
    Duration duration = const Duration(milliseconds: 400),
    Offset begin = const Offset(0, 0.5),
  }) {
    return AnimatedSlide(
      offset: show ? Offset.zero : begin,
      duration: duration,
      curve: Curves.easeOut,
      child: child,
    );
  }

  /// Scale transition widget
  static Widget scaleInWidget({
    required Widget child,
    required bool show,
    Duration duration = const Duration(milliseconds: 300),
    double scale = 0.8,
  }) {
    return AnimatedScale(
      scale: show ? 1.0 : scale,
      duration: duration,
      curve: Curves.easeOut,
      child: child,
    );
  }
}

/// Custom transition builders
class ModernPageTransitions {
  /// Fade page transition
  static PageRouteBuilder fadePageTransition({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  /// Slide from right page transition
  static PageRouteBuilder slideInRightTransition({
    required Widget page,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  /// Slide from bottom page transition
  static PageRouteBuilder slideInBottomTransition({
    required Widget page,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  /// Scale page transition
  static PageRouteBuilder scaleTransition({
    required Widget page,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(scale: animation, child: child);
      },
    );
  }
}
