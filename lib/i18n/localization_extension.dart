import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_website/providers/locale_provider.dart';

/// Extension on BuildContext to provide convenient localization methods
extension LocalizationExtension on BuildContext {
  /// Get the current LocaleProvider (use listen: false for event handlers)
  LocaleProvider get locale => read<LocaleProvider>();

  /// Translate a key using the current locale
  /// Use in build() methods or event handlers
  /// Example: context.tr('menu.home')
  String tr(String key) {
    return read<LocaleProvider>().tr(key);
  }

  /// Watch the locale provider and get a translation
  /// Rebuilds widget when language changes
  /// Use ONLY in build() methods, NOT in event handlers
  /// Example: context.watchTr('menu.home')
  String watchTr(String key) {
    return watch<LocaleProvider>().tr(key);
  }

  /// Get the current language code ('fr', 'en', 'de')
  /// Safe to use in event handlers
  String get currentLocale => read<LocaleProvider>().locale;

  /// Check if current locale is French (safe in event handlers)
  bool get isFrench => read<LocaleProvider>().locale == 'fr';

  /// Check if current locale is English (safe in event handlers)
  bool get isEnglish => read<LocaleProvider>().locale == 'en';

  /// Check if current locale is German (safe in event handlers)
  bool get isGerman => read<LocaleProvider>().locale == 'de';

  /// Get all available locales
  List<String> get availableLocales => ['fr', 'en', 'de'];

  /// Change the language (safe in event handlers)
  void setLanguage(String code) {
    read<LocaleProvider>().setLocale(code);
  }

  /// Cycle to the next language (safe in event handlers)
  void cycleLanguage() {
    read<LocaleProvider>().cycleLocale();
  }

  /// Get a localized string with parameter replacement
  /// Example: context.trWithParams('hello.name', {'name': 'John'})
  /// Note: Requires translation to have {name} placeholder
  String trWithParams(String key, Map<String, String> params) {
    var translation = tr(key);
    params.forEach((paramKey, value) {
      translation = translation.replaceAll('{$paramKey}', value);
    });
    return translation;
  }
}
