import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Collection of helper functions for common operations
/// 
/// These utilities provide conveniences for tasks like:
/// - Focus management
/// - Device feedback (haptics)
/// - Async delays
/// - Safe navigation
class Helpers {
  Helpers._(); // Private constructor to prevent instantiation

  // Focus Management
  
  /// Unfocuses the current focus node (dismisses keyboard)
  /// 
  /// ```dart
  /// onTap: () {
  ///   Helpers.unfocus(context);
  ///   // ... other actions
  /// }
  /// ```
  static void unfocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }

  /// Moves focus to the next field in the form
  static void nextFocus(BuildContext context) {
    FocusScope.of(context).nextFocus();
  }

  /// Moves focus to the previous field in the form
  static void previousFocus(BuildContext context) {
    FocusScope.of(context).previousFocus();
  }

  // Haptic Feedback
  
  /// Provides light haptic feedback
  /// 
  /// Use for selection changes, toggles, or subtle interactions
  static Future<void> lightHaptic() async {
    await HapticFeedback.lightImpact();
  }

  /// Provides medium haptic feedback
  /// 
  /// Use for button presses or medium-weight interactions
  static Future<void> mediumHaptic() async {
    await HapticFeedback.mediumImpact();
  }

  /// Provides heavy haptic feedback
  /// 
  /// Use for important actions or confirmations
  static Future<void> heavyHaptic() async {
    await HapticFeedback.heavyImpact();
  }

  /// Provides selection click haptic feedback
  /// 
  /// Use for picker wheel scrolling or selection changes
  static Future<void> selectionHaptic() async {
    await HapticFeedback.selectionClick();
  }

  /// Provides vibration feedback
  /// 
  /// Use for notifications or alerts
  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }

  // Async Utilities
  
  /// Delays execution for the specified duration
  /// 
  /// ```dart
  /// await Helpers.delay(Duration(milliseconds: 300));
  /// ```
  static Future<void> delay(Duration duration) {
    return Future.delayed(duration);
  }

  /// Delays execution for the specified milliseconds
  /// 
  /// Convenience method for common delay pattern
  /// ```dart
  /// await Helpers.delayMilliseconds(300);
  /// ```
  static Future<void> delayMilliseconds(int milliseconds) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  }

  /// Delays execution for the specified seconds
  static Future<void> delaySeconds(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  // Safe Operations
  
  /// Safely executes a function with error handling
  /// 
  /// Returns the result on success, or null on error.
  /// Optionally logs the error with [onError] callback.
  /// 
  /// ```dart
  /// final result = await Helpers.tryCatch(
  ///   () async => await api.getData(),
  ///   onError: (e) => logger.error('API call failed', e),
  /// );
  /// ```
  static Future<T?> tryCatch<T>(
    Future<T> Function() function, {
    void Function(dynamic error)? onError,
  }) async {
    try {
      return await function();
    } catch (e) {
      onError?.call(e);
      return null;
    }
  }

  /// Safely executes a synchronous function with error handling
  static T? tryCatchSync<T>(
    T Function() function, {
    void Function(dynamic error)? onError,
  }) {
    try {
      return function();
    } catch (e) {
      onError?.call(e);
      return null;
    }
  }

  // Dialog Helpers
  
  /// Shows a confirmation dialog and returns user's choice
  /// 
  /// ```dart
  /// final confirmed = await Helpers.showConfirmDialog(
  ///   context,
  ///   title: 'Delete Account',
  ///   message: 'Are you sure you want to delete your account?',
  ///   confirmText: 'Delete',
  ///   isDangerous: true,
  /// );
  /// 
  /// if (confirmed) {
  ///   // Proceed with deletion
  /// }
  /// ```
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool isDangerous = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: isDangerous
                ? TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  )
                : null,
            child: Text(confirmText),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  // Clipboard Operations
  
  /// Copies text to clipboard
  /// 
  /// ```dart
  /// await Helpers.copyToClipboard('Hello World');
  /// ```
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Pastes text from clipboard
  /// 
  /// Returns null if clipboard is empty or contains non-text data
  static Future<String?> pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  // Null Safety Helpers
  
  /// Returns the value if not null, otherwise returns the default value
  /// 
  /// ```dart
  /// final name = Helpers.orDefault(user.name, 'Guest');
  /// ```
  static T orDefault<T>(T? value, T defaultValue) {
    return value ?? defaultValue;
  }

  /// Returns true if all values are not null
  static bool allNotNull(List<dynamic> values) {
    return values.every((value) => value != null);
  }

  /// Returns true if any value is not null
  static bool anyNotNull(List<dynamic> values) {
    return values.any((value) => value != null);
  }
}
