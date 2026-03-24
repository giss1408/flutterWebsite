import 'package:flutter/material.dart';

/// Theme provider for managing light/dark theme preference
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode {
    return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  /// Initialize theme based on system preference
  void initializeTheme() {
    // Check system theme preference
    final brightness = WidgetsBinding.instance.window.platformDispatcher.views.first.platformDispatcher.platformBrightness;
    _isDarkMode = brightness == Brightness.dark;
    notifyListeners();
  }

  /// Toggle between light and dark theme
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  /// Set theme explicitly
  void setDarkMode(bool isDark) {
    if (_isDarkMode != isDark) {
      _isDarkMode = isDark;
      notifyListeners();
    }
  }
}
