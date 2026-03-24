import 'package:flutter/material.dart';
import 'modern_colors.dart';
import 'modern_shadows.dart';

/// Professional component styling system
class ModernComponents {
  // Button styles configuration
  static ButtonStyle primaryButtonStyle({
    bool isSmall = false,
    bool isFullWidth = false,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: ModernColors.primary,
      foregroundColor: ModernColors.textWhite,
      elevation: 2,
      padding: isSmall
          ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ModernRadius.md),
      ),
    ).copyWith(
      elevation: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) return 4;
        if (states.contains(MaterialState.pressed)) return 1;
        return 2;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return ModernColors.textTertiary;
        }
        if (states.contains(MaterialState.hovered)) {
          return ModernColors.primaryLight;
        }
        return ModernColors.primary;
      }),
    );
  }

  static ButtonStyle secondaryButtonStyle({
    bool isSmall = false,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: ModernColors.primary,
      side: const BorderSide(
        color: ModernColors.border,
        width: 1.5,
      ),
      padding: isSmall
          ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ModernRadius.md),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(MaterialState.hovered)) {
          return const BorderSide(
            color: ModernColors.primary,
            width: 2,
          );
        }
        return const BorderSide(
          color: ModernColors.border,
          width: 1.5,
        );
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return ModernColors.primary.withOpacity(0.05);
        }
        return Colors.transparent;
      }),
    );
  }

  static ButtonStyle ghostButtonStyle({
    bool isSmall = false,
  }) {
    return TextButton.styleFrom(
      foregroundColor: ModernColors.primary,
      padding: isSmall
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return ModernColors.primary.withOpacity(0.08);
        }
        return Colors.transparent;
      }),
    );
  }

  // Card styling
  static BoxDecoration cardDecoration({
    bool isDark = false,
    bool hasHover = false,
  }) {
    return BoxDecoration(
      color: isDark ? ModernColors.backgroundCardDark : ModernColors.backgroundCard,
      borderRadius: BorderRadius.circular(ModernRadius.lg),
      border: Border.all(
        color: isDark ? ModernColors.borderDark : ModernColors.border,
        width: 1,
      ),
      boxShadow: ModernShadows.elevation2,
    );
  }

  // Input field styling
  static InputDecoration inputDecoration({
    required String labelText,
    bool isDark = false,
  }) {
    return InputDecoration(
      labelText: labelText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ModernRadius.md),
        borderSide: BorderSide(
          color: isDark ? ModernColors.borderDark : ModernColors.border,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ModernRadius.md),
        borderSide: BorderSide(
          color: isDark ? ModernColors.borderDark : ModernColors.border,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ModernRadius.md),
        borderSide: const BorderSide(
          color: ModernColors.primary,
          width: 2,
        ),
      ),
    );
  }

  // Chip styling
  static ChipThemeData chipTheme({bool isDark = false}) {
    return ChipThemeData(
      backgroundColor: isDark ? ModernColors.backgroundCardDark : ModernColors.backgroundHover,
      selectedColor: ModernColors.primary,
      disabledColor: ModernColors.border,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ModernRadius.sm),
      ),
    );
  }
}

/// Modern list tile styling
class ModernListTile {
  static BoxDecoration listTileDecoration({
    bool isDark = false,
    bool isHovered = false,
  }) {
    return BoxDecoration(
      color: isHovered
          ? (isDark
              ? ModernColors.backgroundCardDark.withOpacity(0.8)
              : ModernColors.backgroundHover)
          : (isDark ? ModernColors.backgroundCardDark : ModernColors.backgroundCard),
      borderRadius: BorderRadius.circular(ModernRadius.md),
      boxShadow: isHovered ? ModernShadows.elevation2 : ModernShadows.elevation0,
    );
  }
}

/// Modern bottom sheet styling
class ModernBottomSheet {
  static BoxDecoration bottomSheetDecoration({bool isDark = false}) {
    return BoxDecoration(
      color: isDark ? ModernColors.backgroundCardDark : ModernColors.backgroundCard,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(ModernRadius.lg),
        topRight: Radius.circular(ModernRadius.lg),
      ),
      boxShadow: ModernShadows.elevation5,
    );
  }
}
