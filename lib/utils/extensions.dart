import 'package:flutter/material.dart';

/// Extensions for BuildContext
extension BuildContextExtension on BuildContext {
  /// Get screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Check if device is in landscape
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  /// Check if device is in portrait
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Get device padding (safe area)
  EdgeInsets get devicePadding => MediaQuery.of(this).padding;

  /// Check if device is mobile (width < 600)
  bool get isMobile => screenWidth < 600;

  /// Check if device is tablet (width 600-1200)
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;

  /// Check if device is desktop (width >= 1200)
  bool get isDesktop => screenWidth >= 1200;

  /// Get theme data
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Check if dark mode is enabled
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

/// Extensions for Widget building
extension WidgetExtension on Widget {
  /// Wrap widget with padding
  Widget withPadding({
    double all = 0,
    double horizontal = 0,
    double vertical = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left > 0 ? left : horizontal,
        top > 0 ? top : vertical,
        right > 0 ? right : horizontal,
        bottom > 0 ? bottom : vertical,
      ),
      child: this,
    );
  }

  /// Wrap widget with container
  Widget withContainer({
    Color? color,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
    Alignment? alignment,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      color: color,
      decoration: decoration,
      alignment: alignment,
      child: this,
    );
  }

  /// Wrap widget with single child scroll view
  Widget withSingleChildScrollView({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      child: this,
    );
  }

  /// Wrap widget with opacity animation
  Widget withFadeInAnimation({
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: this,
    );
  }
}

/// Extensions for Duration
extension DurationExtension on Duration {
  /// Get milliseconds as string
  String get toMillisecondsString => '${inMilliseconds}ms';

  /// Get seconds as string with format
  String get toSecondsString => '${(inMilliseconds / 1000).toStringAsFixed(2)}s';
}

/// Extensions for String
extension StringExtension on String {
  /// Capitalize first letter
  String get capitalize {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  }

  /// Check if string is email
  bool get isEmail {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }

  /// Check if string is URL
  bool get isUrl {
    return RegExp(r'^https?://').hasMatch(this);
  }
}

/// Extensions for List
extension ListExtension<T> on List<T> {
  /// Get first or null
  T? get firstOrNull => isEmpty ? null : first;

  /// Get last or null
  T? get lastOrNull => isEmpty ? null : last;

  /// Divide list into chunks
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}
