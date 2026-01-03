// lib/core/constants/app_colors.dart
import 'package:flutter/material.dart';

/// App color constants following Material 3 color system
/// 
/// Colors are organized into:
/// - Primary/Secondary/Tertiary schemes for brand colors
/// - Semantic colors for success/warning/error/info states
/// - Neutral colors for backgrounds and surfaces
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ============================================================================
  // LIGHT MODE COLORS
  // ============================================================================

  /// Primary color scheme - Main brand color
  static const Color primaryLight = Color(0xFF1976D2); // Blue 700
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color primaryContainerLight = Color(0xFFBBDEFB); // Blue 100
  static const Color onPrimaryContainerLight = Color(0xFF0D47A1);

  /// Secondary color scheme - Complementary color
  static const Color secondaryLight = Color(0xFF0288D1); // Light Blue 700
  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color secondaryContainerLight = Color(0xFFB3E5FC);
  static const Color onSecondaryContainerLight = Color(0xFF01579B);

  /// Tertiary color scheme - Accent color
  static const Color tertiaryLight = Color(0xFF00796B); // Teal 700
  static const Color onTertiaryLight = Color(0xFFFFFFFF);
  static const Color tertiaryContainerLight = Color(0xFFB2DFDB);
  static const Color onTertiaryContainerLight = Color(0xFF004D40);

  /// Error color scheme
  static const Color errorLight = Color(0xFFD32F2F); // Red 700
  static const Color onErrorLight = Color(0xFFFFFFFF);
  static const Color errorContainerLight = Color(0xFFFFCDD2);
  static const Color onErrorContainerLight = Color(0xFFB71C1C);

  /// Background and surface colors
  static const Color backgroundLight = Color(0xFFFAFAFA); // Grey 50
  static const Color onBackgroundLight = Color(0xFF212121);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color onSurfaceLight = Color(0xFF212121);
  static const Color surfaceVariantLight = Color(0xFFF5F5F5);
  static const Color onSurfaceVariantLight = Color(0xFF424242);

  /// Outline colors for borders
  static const Color outlineLight = Color(0xFFBDBDBD); // Grey 400
  static const Color outlineVariantLight = Color(0xFFE0E0E0);

  // ============================================================================
  // DARK MODE COLORS
  // ============================================================================

  /// Primary color scheme - Main brand color (dark mode)
  static const Color primaryDark = Color(0xFF64B5F6); // Blue 300
  static const Color onPrimaryDark = Color(0xFF0D47A1);
  static const Color primaryContainerDark = Color(0xFF1565C0);
  static const Color onPrimaryContainerDark = Color(0xFFE3F2FD);

  /// Secondary color scheme - Complementary color (dark mode)
  static const Color secondaryDark = Color(0xFF4FC3F7); // Light Blue 300
  static const Color onSecondaryDark = Color(0xFF01579B);
  static const Color secondaryContainerDark = Color(0xFF0277BD);
  static const Color onSecondaryContainerDark = Color(0xFFE1F5FE);

  /// Tertiary color scheme - Accent color (dark mode)
  static const Color tertiaryDark = Color(0xFF4DB6AC); // Teal 300
  static const Color onTertiaryDark = Color(0xFF004D40);
  static const Color tertiaryContainerDark = Color(0xFF00695C);
  static const Color onTertiaryContainerDark = Color(0xFFE0F2F1);

  /// Error color scheme (dark mode)
  static const Color errorDark = Color(0xFFEF5350); // Red 400
  static const Color onErrorDark = Color(0xFF000000);
  static const Color errorContainerDark = Color(0xFFC62828);
  static const Color onErrorContainerDark = Color(0xFFFFEBEE);

  /// Background and surface colors (dark mode)
  static const Color backgroundDark = Color(0xFF121212);
  static const Color onBackgroundDark = Color(0xFFE0E0E0);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color onSurfaceDark = Color(0xFFE0E0E0);
  static const Color surfaceVariantDark = Color(0xFF2C2C2C);
  static const Color onSurfaceVariantDark = Color(0xFFBDBDBD);

  /// Outline colors for borders (dark mode)
  static const Color outlineDark = Color(0xFF616161);
  static const Color outlineVariantDark = Color(0xFF424242);

  // ============================================================================
  // SEMANTIC COLORS (Used in both light and dark modes with opacity adjustments)
  // ============================================================================

  /// Success color - Green
  static const Color success = Color(0xFF388E3C); // Green 700
  static const Color successLight = Color(0xFF4CAF50); // Green 500
  static const Color successDark = Color(0xFF1B5E20); // Green 900
  static const Color onSuccess = Color(0xFFFFFFFF);

  /// Warning color - Orange
  static const Color warning = Color(0xFFF57C00); // Orange 700
  static const Color warningLight = Color(0xFFFF9800); // Orange 500
  static const Color warningDark = Color(0xFFE65100); // Orange 900
  static const Color onWarning = Color(0xFF000000);

  /// Info color - Light Blue
  static const Color info = Color(0xFF0288D1); // Light Blue 700
  static const Color infoLight = Color(0xFF03A9F4); // Light Blue 500
  static const Color infoDark = Color(0xFF01579B); // Light Blue 900
  static const Color onInfo = Color(0xFFFFFFFF);

  // ============================================================================
  // NEUTRAL COLORS (Shades of grey for various UI elements)
  // ============================================================================

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // ============================================================================
  // SPECIAL COLORS
  // ============================================================================

  /// Pure black and white
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Overlay colors for modals and dialogs
  static const Color overlayLight = Color(0x66000000); // 40% black
  static const Color overlayDark = Color(0x99000000); // 60% black

  /// Shimmer colors for loading states
  static const Color shimmerBaseLight = Color(0xFFE0E0E0);
  static const Color shimmerHighlightLight = Color(0xFFF5F5F5);
  static const Color shimmerBaseDark = Color(0xFF2C2C2C);
  static const Color shimmerHighlightDark = Color(0xFF3A3A3A);
}