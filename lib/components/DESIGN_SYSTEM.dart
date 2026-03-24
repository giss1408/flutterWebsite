/// # Modern Design System Guide - 2026 Professional UI/UX
///
/// This guide showcases the professional design system implemented for a 2026-ready,
/// modern web experience with expert UX principles.
///
/// ## System Overview
///
/// The modern design system consists of:
/// - **Colors**: Professional palette with primary, accent, status, and semantic colors
/// - **Typography**: 8-level hierarchy with display, heading, title, body, and label styles
/// - **Spacing**: Responsive spacing system with xs-xxxl sizes
/// - **Shadows**: Professional elevation system (0-5) with glow effects
/// - **Borders**: Subtle border radius system (xs-xl)
/// - **Animations**: Smooth transitions and micro-interactions
/// - **Components**: Pre-styled buttons, cards, inputs, and more
///
/// ## Color System
///
/// Import: `import 'package:flutter_website/components/modern_colors.dart';`
///
/// ### Primary Colors
/// - `ModernColors.primary` (#1389FD) - Main action color
/// - `ModernColors.primaryLight` (#3FA9FF) - Hover/disabled states
/// - `ModernColors.primaryDark` (#0075E6) - Active/pressed states
/// - `ModernColors.primaryGradient` - Smooth gradient blend
///
/// ### Accent Colors
/// - `ModernColors.accent` (#00D9FF) - Cyan accent
/// - `ModernColors.accentWarm` (#FF6B35) - Warm/orange accent
/// - `ModernColors.accentGreen` (#00B369) - Success/positive
/// - `ModernColors.accentPurple` (#7C3AED) - Purple accent
///
/// ### Text Colors
/// - `ModernColors.textPrimary` (#0F172A) - Primary text (dark)
/// - `ModernColors.textSecondary` (#475569) - Secondary text (muted)
/// - `ModernColors.textTertiary` (#94A3B8) - Tertiary text (faint)
/// - `ModernColors.textLight` (#CBD5E1) - Light text (on dark)
/// - `ModernColors.textWhite` - Pure white text
///
/// ### Background Colors
/// - `ModernColors.background` (#F8FAFC) - Light bg
/// - `ModernColors.backgroundDark` (#0F172A) - Dark bg
/// - `ModernColors.backgroundCard` (#FFFFFF) - Card surface
/// - `ModernColors.backgroundCardDark` (#1E293B) - Dark card
/// - `ModernColors.backgroundHover` (#F1F5F9) - Hover state
///
/// ### Semantic Colors
/// - `ModernColors.success` (#10B981) - Success/positive
/// - `ModernColors.warning` (#F59E0B) - Warning/attention
/// - `ModernColors.error` (#EF4444) - Error/danger
/// - `ModernColors.info` (#0EA5E9) - Information
///
/// ## Typography System
///
/// Import: `import 'package:flutter_website/components/modern_typography.dart';`
///
/// ### Display Styles (Hero text - largest)
/// ```dart
/// Text('Hero Headline', style: ModernTypography.displayLarge)  // 56px
/// Text('Section Title', style: ModernTypography.displayMedium) // 45px
/// Text('Subtitle', style: ModernTypography.displaySmall)       // 36px
/// ```
///
/// ### Heading Styles (Major sections)
/// ```dart
/// Text('Main Heading', style: ModernTypography.headlineLarge)   // 32px
/// Text('Sub Heading', style: ModernTypography.headlineMedium)   // 28px
/// Text('Card Title', style: ModernTypography.headlineSmall)     // 24px
/// ```
///
/// ### Title Styles (Subsections)
/// ```dart
/// Text('Section Title', style: ModernTypography.titleLarge)   // 22px
/// Text('Card Header', style: ModernTypography.titleMedium)    // 18px
/// Text('List Item', style: ModernTypography.titleSmall)       // 16px
/// ```
///
/// ### Body Styles (Main content)
/// ```dart
/// Text('Body text content', style: ModernTypography.bodyLarge)  // 16px
/// Text('Secondary content', style: ModernTypography.bodyMedium) // 14px
/// Text('Fine print', style: ModernTypography.bodySmall)         // 12px
/// ```
///
/// ### Label Styles (Buttons, tags)
/// ```dart
/// Text('BUTTON LABEL', style: ModernTypography.labelLarge)  // 14px
/// Text('Tag label', style: ModernTypography.labelMedium)    // 12px
/// Text('MICRO LABEL', style: ModernTypography.labelSmall)   // 11px
/// ```
///
/// ## Spacing System
///
/// Import: `import 'package:flutter_website/components/modern_spacing.dart';`
///
/// ### Fixed Spacing Sizes
/// - `ModernSpacing.xs` (4px)    - Micro spacing
/// - `ModernSpacing.sm` (8px)    - Small spacing
/// - `ModernSpacing.md` (12px)   - Medium spacing
/// - `ModernSpacing.lg` (16px)   - Large spacing
/// - `ModernSpacing.xl` (24px)   - Extra large
/// - `ModernSpacing.xxl` (32px)  - Double extra large
/// - `ModernSpacing.xxxl` (48px) - Triple extra large
/// - `ModernSpacing.maxSpacing` (64px) - Maximum spacing
///
/// ### Responsive Padding
/// ```dart
/// Padding(
///   padding: ModernSpacing.responsivePadding(context),
///   child: child,
/// )
/// // Mobile: 16px horizontal, 24px vertical
/// // Tablet: 32px horizontal, 40px vertical
/// // Desktop: 48px horizontal, 60px vertical
/// ```
///
/// ### Section Spacing
/// ```dart
/// Padding(
///   padding: ModernSpacing.sectionSpacing(context),
///   child: child,
/// )
/// // Larger spacing for sections between content blocks
/// ```
///
/// ## Shadows & Elevation System
///
/// Import: `import 'package:flutter_website/components/modern_shadows.dart';`
///
/// ### Elevation Levels
/// - `ModernShadows.elevation0` - Flat, no shadow
/// - `ModernShadows.elevation1` - Subtle shadow (raised)
/// - `ModernShadows.elevation2` - Small shadow (cards)
/// - `ModernShadows.elevation3` - Medium shadow (hover)
/// - `ModernShadows.elevation4` - Large shadow (floating)
/// - `ModernShadows.elevation5` - Extra large (modals)
///
/// ### Special Effects
/// - `ModernShadows.glow` - Strong glow effect
/// - `ModernShadows.glowSoft` - Subtle glow
/// - `ModernShadows.inset` - Inset shadow for depth
/// - `ModernShadows.focusRing()` - Focus ring for accessibility
///
/// ### Border Radius System
/// - `ModernRadius.xs` (4px)
/// - `ModernRadius.sm` (8px)
/// - `ModernRadius.md` (12px)
/// - `ModernRadius.lg` (16px)
/// - `ModernRadius.xl` (20px)
/// - `ModernRadius.circle` (full circular)
///
/// ### Usage Example
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     color: ModernColors.backgroundCard,
///     borderRadius: BorderRadius.circular(ModernRadius.lg),
///     boxShadow: ModernShadows.elevation2,
///   ),
///   child: child,
/// )
/// ```
///
/// ## Component Styling
///
/// Import: `import 'package:flutter_website/components/modern_components.dart';`
///
/// ### Buttons
/// ```dart
/// // Primary Button
/// ElevatedButton(
///   onPressed: () {},
///   style: ModernComponents.primaryButtonStyle(),
///   child: const Text('Primary Button'),
/// )
///
/// // Secondary Button
/// OutlinedButton(
///   onPressed: () {},
///   style: ModernComponents.secondaryButtonStyle(),
///   child: const Text('Secondary Button'),
/// )
///
/// // Ghost Button
/// TextButton(
///   onPressed: () {},
///   style: ModernComponents.ghostButtonStyle(),
///   child: const Text('Ghost Button'),
/// )
/// ```
///
/// ### Cards
/// ```dart
/// Container(
///   decoration: ModernComponents.cardDecoration(),
///   padding: const EdgeInsets.all(ModernSpacing.lg),
///   child: child,
/// )
/// ```
///
/// ### Input Fields
/// ```dart
/// TextField(
///   decoration: ModernComponents.inputDecoration(
///     labelText: 'Email Address',
///   ),
/// )
/// ```
///
/// ## Animations
///
/// Import: `import 'package:flutter_website/components/modern_animations.dart';`
///
/// ### Duration Constants
/// - `ModernAnimations.fast` (150ms) - Quick feedback
/// - `ModernAnimations.normal` (300ms) - Standard transition
/// - `ModernAnimations.slow` (500ms) - Graceful entrance
/// - `ModernAnimations.verySlow` (800ms) - Emphasis animation
///
/// ### Animation Examples
/// ```dart
/// // Fade animation
/// AnimatedOpacity(
///   opacity: show ? 1 : 0,
///   duration: ModernAnimations.normal,
///   child: child,
/// )
///
/// // Scale animation
/// AnimatedScale(
///   scale: show ? 1.0 : 0.8,
///   duration: ModernAnimations.normal,
///   child: child,
/// )
///
/// // Slide animation
/// AnimatedSlide(
///   offset: show ? Offset.zero : const Offset(0, 0.5),
///   duration: ModernAnimations.normal,
///   child: child,
/// )
/// ```
///
/// ### Page Transitions
/// ```dart
/// // Fade transition
/// Navigator.push(context, ModernPageTransitions.fadePageTransition(
///   page: const NextPage(),
/// ))
///
/// // Slide from right
/// Navigator.push(context, ModernPageTransitions.slideInRightTransition(
///   page: const NextPage(),
/// ))
///
/// // Scale transition
/// Navigator.push(context, ModernPageTransitions.scaleTransition(
///   page: const NextPage(),
/// ))
/// ```
///
/// ## Theme Integration
///
/// Import: `import 'package:flutter_website/config/modern_theme_builder.dart';`
///
/// The themes are automatically applied in main.dart:
/// ```dart
/// MaterialApp(
///   theme: ModernThemeBuilder.buildLightTheme(),
///   darkTheme: ModernThemeBuilder.buildDarkTheme(),
///   themeMode: themeProvider.themeMode,
/// )
/// ```
///
/// ## Best Practices
///
/// 1. **Typography Hierarchy**: Always maintain proper hierarchy using the defined styles
/// 2. **Spacing Consistency**: Use the spacing system values, avoid arbitrary spacing
/// 3. **Color Semantics**: Use semantic colors (success, warning, error) appropriately
/// 4. **Shadows for Depth**: Use elevation shadows to convey depth and layering
/// 5. **Animations**: Use appropriate durations for different interaction types
/// 6. **Responsive Design**: Use responsive padding and spacing functions for all breakpoints
/// 7. **Contrast**: Maintain WCAG AAA contrast ratios for text
/// 8. **Micro-interactions**: Use animations for feedback, not just decoration
///
/// ## Dark Mode Support
///
/// All components automatically adapt to light/dark modes via the theme system.
/// Colors are already optimized for both modes in ModernColors.
///
/// ## Accessibility
///
/// - All colors maintain WCAG AAA contrast ratios
/// - Focus rings are clearly visible using ModernShadows.focusRing()
/// - Touch targets are minimum 44x44px (typically achieved with padding)
/// - Font sizes are legible at 16px minimum for body text
///
/// ---
/// **Version**: 1.0.0
/// **Last Updated**: 2026
/// **Design System**: Material Design 3 + Custom Modern Enhancements
