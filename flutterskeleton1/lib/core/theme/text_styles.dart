// lib/core/theme/text_styles.dart
import 'package:flutter/material.dart';

/// Typography system for the app
/// 
/// Defines text styles hierarchy following Material 3 design
/// All styles are optimized for readability and accessibility
class AppTextStyles {
  AppTextStyles._(); // Private constructor

  /// Base font family
  static const String _fontFamily = 'Roboto';

  // ============================================================================
  // DISPLAY STYLES (Large, impactful text)
  // ============================================================================

  /// Display Large - 57sp
  /// Use for: Hero text, large headlines
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  /// Display Medium - 45sp
  /// Use for: Section headlines
  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.16,
  );

  /// Display Small - 36sp
  /// Use for: Smaller headlines
  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.22,
  );

  // ============================================================================
  // HEADLINE STYLES (Medium-emphasis text)
  // ============================================================================

  /// Headline Large - 32sp
  /// Use for: Screen titles, dialog headers
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.25,
  );

  /// Headline Medium - 28sp
  /// Use for: Section headers
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.29,
  );

  /// Headline Small - 24sp
  /// Use for: Subsection headers
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.33,
  );

  // ============================================================================
  // TITLE STYLES
  // ============================================================================

  /// Title Large - 22sp
  /// Use for: Card titles, list headers
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    height: 1.27,
  );

  /// Title Medium - 16sp
  /// Use for: Subtitles, prominent labels
  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
  );

  /// Title Small - 14sp
  /// Use for: List item titles, small headers
  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // ============================================================================
  // BODY STYLES (Default text)
  // ============================================================================

  /// Body Large - 16sp
  /// Use for: Long-form content, readable text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  );

  /// Body Medium - 14sp
  /// Use for: Default body text (meets accessibility minimum)
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  /// Body Small - 12sp
  /// Use for: Captions, supporting text
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // ============================================================================
  // LABEL STYLES (Button and form labels)
  // ============================================================================

  /// Label Large - 14sp
  /// Use for: Button text, prominent labels
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  /// Label Medium - 12sp
  /// Use for: Tab labels, small buttons
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );

  /// Label Small - 11sp
  /// Use for: Overlines, timestamps
  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  // ============================================================================
  // CUSTOM UTILITY STYLES
  // ============================================================================

  /// Button text style
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    height: 1.0,
  );

  /// Overline style (e.g., "NEW", "FEATURED")
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.6,
  );

  /// Caption style
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Apply color to any text style
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Apply weight to any text style
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Make text bold
  static TextStyle bold(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.bold);
  }

  /// Make text italic
  static TextStyle italic(TextStyle style) {
    return style.copyWith(fontStyle: FontStyle.italic);
  }
}