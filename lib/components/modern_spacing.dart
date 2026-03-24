import 'package:flutter/material.dart';

/// Advanced spacing system with micro-spacing for professional layouts
class ModernSpacing {
  // Micro-spacing (4-8px) for tight relationships
  static const double xs = 4.0;
  static const double sm = 8.0;

  // Standard spacing (12-24px) for general use
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;

  // Large spacing (32-64px) for sections
  static const double xxl = 32.0;
  static const double xxxl = 48.0;
  static const double maxSpacing = 64.0;

  // Card and container spacing
  static const double cardPadding = 24.0;
  static const double sectionPadding = 32.0;

  // Responsive padding helper with modern breakpoints
  static EdgeInsets responsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 480) {
      // Mobile - compact
      return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0);
    } else if (width < 1024) {
      // Tablet - balanced
      return const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0);
    } else {
      // Desktop - generous
      return const EdgeInsets.symmetric(horizontal: 48.0, vertical: 60.0);
    }
  }

  // Section spacing with proper visual hierarchy
  static EdgeInsets sectionSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 480) {
      return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0);
    } else if (width < 1024) {
      return const EdgeInsets.symmetric(horizontal: 32.0, vertical: 56.0);
    } else {
      return const EdgeInsets.symmetric(horizontal: 64.0, vertical: 80.0);
    }
  }

  // Gutter for grid layouts
  static double gutter(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 480) return 12.0;
    if (width < 1024) return 16.0;
    return 24.0;
  }

  // Container width constraints
  static double containerWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 480) {
      return width - 32;
    } else if (width < 1024) {
      return width - 64;
    } else {
      return 1280; // Max width
    }
  }
}
