import 'package:flutter/material.dart';
import 'package:flutter_website/i18n/translations.dart';

/// Manages the current locale (language) for the app.
class LocaleProvider extends ChangeNotifier {
  String _locale = 'fr'; // default: French

  String get locale => _locale;

  /// Returns the locale as a Locale object for MaterialApp.
  Locale get flutterLocale => Locale(_locale);

  void setLocale(String code) {
    if (code == _locale) return;
    if (!Translations.supportedLocales.contains(code)) return;
    _locale = code;
    notifyListeners();
  }

  /// Toggle between FR → EN → DE.
  void cycleLocale() {
    final locales = Translations.supportedLocales;
    final idx = locales.indexOf(_locale);
    _locale = locales[(idx + 1) % locales.length];
    notifyListeners();
  }

  /// Get a translation by key.
  String tr(String key) => Translations.translate(key, _locale);
}
