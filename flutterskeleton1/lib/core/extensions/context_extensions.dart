import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Extension on [BuildContext] providing convenient access to common Flutter APIs
/// and helper methods for navigation, theming, and UI feedback.
extension ContextExtensions on BuildContext {
  // Theme Accessors
  
  /// Returns the current [ThemeData] from the context
  ThemeData get theme => Theme.of(this);

  /// Returns the current [TextTheme] from the context
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current [ColorScheme] from the context
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // MediaQuery Accessors
  
  /// Returns the size of the current screen
  Size get screenSize => MediaQuery.of(this).size;

  /// Returns the width of the current screen
  double get screenWidth => screenSize.width;

  /// Returns the height of the current screen
  double get screenHeight => screenSize.height;

  /// Returns the padding around the screen (e.g., for notches, system UI)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Returns true if the keyboard is currently visible
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  // Responsive Helpers
  
  /// Returns true if the current device is a mobile device (width < 600)
  bool get isMobile => screenWidth < 600;

  /// Returns true if the current device is a tablet (600 <= width < 900)
  bool get isTablet => screenWidth >= 600 && screenWidth < 900;

  /// Returns true if the current device is a desktop (width >= 900)
  bool get isDesktop => screenWidth >= 900;

  // Navigation Shortcuts
  
  /// Pops the current route off the navigation stack
  void pop<T>([T? result]) => GoRouter.of(this).pop(result);

  /// Navigates to the specified route by name
  void pushNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).pushNamed(routeName, extra: extra);
  }

  /// Replaces the current route with the specified route by name
  void pushReplacementNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).pushReplacementNamed(routeName, extra: extra);
  }

  /// Navigates to the specified path
  void go(String path, {Object? extra}) {
    GoRouter.of(this).go(path, extra: extra);
  }

  // SnackBar Helpers
  
  /// Shows a simple [SnackBar] with the given message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Shows an error [SnackBar] with red background
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.error,
      ),
    );
  }

  /// Shows a success [SnackBar] with green/primary background
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Localization Shortcut (Prepared for Step 23)
  
  /// Returns the localization delegate (placeholder for Step 23)
  /// 
  /// Usage after implementing localization in Step 23:
  /// ```dart
  /// Text(context.l10n.welcomeMessage)
  /// ```
  // AppLocalizations get l10n => AppLocalizations.of(this)!;
}