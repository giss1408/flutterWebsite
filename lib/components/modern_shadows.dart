import 'package:flutter/material.dart';

/// Professional elevation and shadow system for depth and hierarchy
class ModernShadows {
  // Elevation 0: No shadow - flat elements
  static const List<BoxShadow> elevation0 = [];

  // Elevation 1: Subtle shadow for raised elements
  static const List<BoxShadow> elevation1 = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 1),
      blurRadius: 2.0,
      spreadRadius: 0,
    ),
  ];

  // Elevation 2: Small shadow for cards and buttons
  static const List<BoxShadow> elevation2 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 2),
      blurRadius: 4.0,
      spreadRadius: 0,
    ),
  ];

  // Elevation 3: Medium shadow for hovered elements
  static const List<BoxShadow> elevation3 = [
    BoxShadow(
      color: Color(0x24000000),
      offset: Offset(0, 3),
      blurRadius: 8.0,
      spreadRadius: 0,
    ),
  ];

  // Elevation 4: Large shadow for floating elements
  static const List<BoxShadow> elevation4 = [
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 4),
      blurRadius: 12.0,
      spreadRadius: 0,
    ),
  ];

  // Elevation 5: Extra large shadow for modals
  static const List<BoxShadow> elevation5 = [
    BoxShadow(
      color: Color(0x42000000),
      offset: Offset(0, 5),
      blurRadius: 16.0,
      spreadRadius: 0,
    ),
  ];

  // Glow effect - for special highlights
  static const List<BoxShadow> glow = [
    BoxShadow(
      color: Color(0x331389FD),
      offset: Offset(0, 0),
      blurRadius: 24.0,
      spreadRadius: 2,
    ),
  ];

  // Glow soft - subtle glow
  static const List<BoxShadow> glowSoft = [
    BoxShadow(
      color: Color(0x1F1389FD),
      offset: Offset(0, 0),
      blurRadius: 16.0,
      spreadRadius: 0,
    ),
  ];

  // Focus ring shadow
  static List<BoxShadow> focusRing([Color? color]) {
    final focusColor = color ?? const Color(0xFF1389FD);
    return [
      BoxShadow(
        color: focusColor.withOpacity(0.25),
        offset: Offset.zero,
        blurRadius: 0,
        spreadRadius: 3,
      ),
    ];
  }

  // Inset shadow (for depth)
  static const List<BoxShadow> inset = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, -1),
      blurRadius: 2.0,
      spreadRadius: 0,
    ),
  ];
}

/// Border radius system for consistent design
class ModernRadius {
  // No rounding
  static const double none = 0.0;

  // Micro rounding - 4px (for small elements)
  static const double xs = 4.0;

  // Small rounding - 8px (for buttons, tags)
  static const double sm = 8.0;

  // Medium rounding - 12px (for cards)
  static const double md = 12.0;

  // Large rounding - 16px (for containers)
  static const double lg = 16.0;

  // Extra large - 20px (for major sections)
  static const double xl = 20.0;

  // Full circle
  static const double circle = 999.0;

  // BorderRadius constants
  static const BorderRadius radiusXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius radiusSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius radiusMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius radiusLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius radiusXl = BorderRadius.all(Radius.circular(xl));
}

/// Border system for consistent visual structure
class ModernBorder {
  // Thin border - 1px
  static const double thin = 1.0;

  // Medium border - 2px
  static const double medium = 2.0;

  // Thick border - 3px
  static const double thick = 3.0;

  // Border constants
  static const Border thinBorder = Border(
    top: BorderSide(color: Color(0xFFE2E8F0), width: thin),
    bottom: BorderSide(color: Color(0xFFE2E8F0), width: thin),
    left: BorderSide(color: Color(0xFFE2E8F0), width: thin),
    right: BorderSide(color: Color(0xFFE2E8F0), width: thin),
  );

  static Border thinBorderWithColor(Color color) {
    return Border.all(color: color, width: thin);
  }

  static Border mediumBorderWithColor(Color color) {
    return Border.all(color: color, width: medium);
  }

  static Border topBorder([Color? color]) {
    return Border(
      top: BorderSide(
        color: color ?? const Color(0xFFE2E8F0),
        width: thin,
      ),
    );
  }
}
