// lib/core/theme/theme_provider.dart
import 'package:flutter/material.dart' as material;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// Provider for managing theme mode state
/// 
/// Supports three modes: light, dark, and system
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeModeValue build() {
    // Default to system theme
    return ThemeModeValue.system;
  }

  /// Set theme to light mode
  void setLightMode() {
    state = ThemeModeValue.light;
  }

  /// Set theme to dark mode
  void setDarkMode() {
    state = ThemeModeValue.dark;
  }

  /// Set theme to follow system
  void setSystemMode() {
    state = ThemeModeValue.system;
  }

  /// Toggle between light and dark (ignores system)
  void toggleTheme() {
    if (state == ThemeModeValue.light) {
      state = ThemeModeValue.dark;
    } else {
      state = ThemeModeValue.light;
    }
  }
}

/// Theme mode enum wrapper for type safety
enum ThemeModeValue {
  light,
  dark,
  system;

  /// Convert to Material ThemeMode
  material.ThemeMode toMaterialThemeMode() {
    switch (this) {
      case ThemeModeValue.light:
        return material.ThemeMode.light;
      case ThemeModeValue.dark:
        return material.ThemeMode.dark;
      case ThemeModeValue.system:
        return material.ThemeMode.system;
    }
  }

  /// Get display name for UI
  String get displayName {
    switch (this) {
      case ThemeModeValue.light:
        return 'Light Mode';
      case ThemeModeValue.dark:
        return 'Dark Mode';
      case ThemeModeValue.system:
        return 'System Default';
    }
  }
}