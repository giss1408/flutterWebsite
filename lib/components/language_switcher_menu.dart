import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_website/providers/locale_provider.dart';
import 'package:flutter_website/i18n/locale_utils.dart';

/// Simple flag-only language switcher - tap to cycle through languages
class LanguageSwitcherMenu extends StatelessWidget {
  final EdgeInsets padding;
  final double borderRadius;

  const LanguageSwitcherMenu({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        final current = localeProvider.locale;

        return Tooltip(
          message: 'Language: ${LocaleUtils.getNativeName(current)} (tap to cycle)',
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                localeProvider.cycleLocale();
              },
              child: Container(
                padding: padding,
                child: Text(
                  LocaleUtils.getLocaleEmoji(current),
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        offset: Offset(0.5, 0.5),
                        blurRadius: 1,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Enhanced language switcher with dropdown menu
class LanguageSwitcherMenuDropdown extends StatelessWidget {
  final bool showEmoji;
  final bool showFullName;
  final EdgeInsets padding;
  final double borderRadius;

  const LanguageSwitcherMenuDropdown({
    super.key,
    this.showEmoji = true,
    this.showFullName = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        final current = localeProvider.locale;
        final availableLocales = LocaleUtils.getAvailableLocales();

        return Theme(
          data: Theme.of(context).copyWith(
            useMaterial3: true,
          ),
          child: PopupMenuButton<String>(
            onSelected: (locale) {
              // Use read with listen: false to avoid Provider errors
              context.read<LocaleProvider>().setLocale(locale);
            },
            itemBuilder: (context) => [
              for (final locale in LocaleUtils.supportedLocales)
                PopupMenuItem<String>(
                  value: locale,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showEmoji) ...[
                        Text(
                          LocaleUtils.getLocaleEmoji(locale),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        showFullName
                            ? LocaleUtils.getNativeName(locale)
                            : locale.toUpperCase(),
                      ),
                      if (current == locale) ...[
                        const SizedBox(width: 8),
                        const Icon(Icons.check, size: 16),
                      ],
                    ],
                  ),
                ),
            ],
            tooltip: 'Change language',
            splashRadius: 0,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius + 2),
            ),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: const Color(0xFFD1D5DB),
                  width: 1,
                ),
              ),
              child: Text(
                LocaleUtils.getLocaleEmoji(current),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Simple pill-style language switcher with chevron icons
class LanguageSwitcherPill extends StatelessWidget {
  final EdgeInsets padding;

  const LanguageSwitcherPill({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => localeProvider.cycleLocale(),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFD1D5DB),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 4),
                  Icon(
                    Icons.translate,
                    size: 14,
                    color: const Color(0xFF6E7274),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    localeProvider.locale.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.chevron_right,
                    size: 14,
                    color: const Color(0xFF6E7274),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
