import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_website/providers/locale_provider.dart';
import 'package:flutter_website/i18n/locale_utils.dart';
import 'package:flutter_website/i18n/localization_extension.dart';
import 'package:flutter_website/components/language_switcher.dart';
import 'package:flutter_website/components/language_switcher_menu.dart';

/// Example page showing different ways to use localization
/// This is NOT used in production but serves as a reference/documentation
class LocalizationExamplePage extends StatelessWidget {
  const LocalizationExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization Examples'),
        actions: [
          // Example 1: Original simple cycler
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LanguageSwitcher(),
          ),
          // Example 2: Enhanced menu with dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LanguageSwitcherMenu(showEmoji: true),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            
            // ===== METHOD 1: Using context.watch (with rebuild) =====
            _Section(
              title: 'Method 1: context.watch() - Rebuilds on language change',
              code: "context.watch<LocaleProvider>().tr('menu.home')",
              example: _Example1(),
            ),
            
            const SizedBox(height: 32),

            // ===== METHOD 2: Using extension (recommended) =====
            _Section(
              title: 'Method 2: Extension - context.watchTr() (RECOMMENDED)',
              code: "context.watchTr('menu.home')",
              example: _Example2(),
            ),
            
            const SizedBox(height: 32),

            // ===== METHOD 3: Using context.tr (read-only) =====
            _Section(
              title: 'Method 3: context.tr() - No rebuild',
              code: "context.tr('menu.home')  // Use in callbacks",
              example: _Example3(),
            ),
            
            const SizedBox(height: 32),

            // ===== METHOD 4: Using LocaleUtils =====
            _Section(
              title: 'Method 4: LocaleUtils - Utility functions',
              code: """
LocaleUtils.getDisplayName('fr')  // 'Français'
LocaleUtils.getNativeName('en')   // 'English'
LocaleUtils.getLocaleEmoji('de')  // '🇩🇪'
              """,
              example: _Example4(),
            ),
            
            const SizedBox(height: 32),

            // ===== METHOD 5: Language switching =====
            _Section(
              title: 'Method 5: Language Switching',
              code: """
context.setLanguage('en')  // Switch directly
context.cycleLanguage()    // Cycle FR → EN → DE
              """,
              example: _Example5(),
            ),
            
            const SizedBox(height: 32),

            // ===== METHOD 6: Conditional rendering =====
            _Section(
              title: 'Method 6: Conditional rendering based on locale',
              code: """
if (context.isFrench) { ... }
if (context.isEnglish) { ... }
if (context.isGerman) { ... }
              """,
              example: _Example6(),
            ),

            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Examples
// ============================================================================

/// Example 1: Using context.watch()
class _Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current menu item: ${localeProvider.tr("menu.home")}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: localeProvider.cycleLocale,
            child: const Text('Cycle Language (watch updates)'),
          ),
        ],
      ),
    );
  }
}

/// Example 2: Using extension context.watchTr()
class _Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        border: Border.all(color: Colors.green.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Simpler approach: ${context.watchTr("menu.home")}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            'Current locale: ${context.currentLocale}',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => context.setLanguage('fr'),
                child: const Text('FR'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => context.setLanguage('en'),
                child: const Text('EN'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => context.setLanguage('de'),
                child: const Text('DE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Example 3: Using context.tr() in callbacks
class _Example3 extends StatefulWidget {
  @override
  State<_Example3> createState() => _Example3State();
}

class _Example3State extends State<_Example3> {
  String? _lastMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Click button to show current locale in a message:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // Use context.tr() to get message at click time
              final message = context.tr('menu.home');
              setState(() => _lastMessage = message);
            },
            child: const Text('Get Current Translation'),
          ),
          if (_lastMessage != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.orange.shade200),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Message: $_lastMessage',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Example 4: Using LocaleUtils
class _Example4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        border: Border.all(color: Colors.purple.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available locales: ${LocaleUtils.supportedLocales.join(", ")}',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          ...LocaleUtils.supportedLocales.map(
            (locale) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(LocaleUtils.getLocaleEmoji(locale)),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 100,
                    child: Text(
                      LocaleUtils.getDisplayName(locale),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(LocaleUtils.getNativeName(locale)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Example 5: Language switching
class _Example5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick language switch buttons:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...LocaleUtils.supportedLocales.map(
                (locale) => ElevatedButton.icon(
                  onPressed: () => context.setLanguage(locale),
                  icon: Text(LocaleUtils.getLocaleEmoji(locale)),
                  label: Text(LocaleUtils.getNativeName(locale)),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: context.cycleLanguage,
                child: const Text('Cycle Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Example 6: Conditional rendering
class _Example6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        border: Border.all(color: Colors.teal.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.isFrench)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('Bienvenue en français! 🇫🇷'),
            ),
          if (context.isEnglish)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('Welcome to English! 🇬🇧'),
            ),
          if (context.isGerman)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('Willkommen auf Deutsch! 🇩🇪'),
            ),
        ],
      ),
    );
  }
}

// ============================================================================
// Shared UI Components
// ============================================================================

class _Section extends StatelessWidget {
  final String title;
  final String code;
  final Widget example;

  const _Section({
    required this.title,
    required this.code,
    required this.example,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
            fontFeature: const [],
          ),
          child: Text(
            code,
            style: const TextStyle(
              color: Colors.amber,
              fontFamily: 'Courier New',
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
        example,
      ],
    );
  }
}
