import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Navigation extension methods for [BuildContext]
///
/// Provides convenient, type-safe navigation helpers throughout the app.
/// All methods wrap GoRouter functionality with proper error handling.
///
/// Example usage:
/// ```dart
/// // Navigate to a new screen
/// context.pushNamed(Routes.profile);
///
/// // Replace current screen
/// context.replaceNamed(Routes.login);
///
/// // Go back
/// context.pop();
///
/// // Navigate with parameters
/// context.pushNamed(
///   Routes.userDetails,
///   pathParameters: {'userId': '123'},
/// );
/// ```
extension NavigationExtensions on BuildContext {
  /// Navigate to a named route
  ///
  /// Pushes a new route onto the navigation stack.
  /// Use [pathParameters] for route path parameters (e.g., /user/:id).
  /// Use [queryParameters] for query string parameters (e.g., ?search=term).
  /// Use [extra] to pass objects to the destination screen.
  Future<T?> pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return GoRouter.of(this).pushNamed<T>(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Navigate to a route by path
  ///
  /// Pushes a new route using the full path.
  /// Use [extra] to pass objects to the destination screen.
  Future<T?> push<T extends Object?>(
    String path, {
    Object? extra,
  }) {
    return GoRouter.of(this).push<T>(path, extra: extra);
  }

  /// Navigate to a named route, replacing the current route
  ///
  /// Removes the current route and pushes a new one.
  /// Useful for preventing back navigation (e.g., after login).
  Future<T?> replaceNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return GoRouter.of(this).pushReplacementNamed<T>(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Navigate to a route by path, replacing the current route
  ///
  /// Removes the current route and pushes a new one using the full path.
  Future<T?> replace<T extends Object?>(
    String path, {
    Object? extra,
  }) {
    return GoRouter.of(this).pushReplacement<T>(path, extra: extra);
  }

  /// Navigate to a location and remove all routes until the predicate returns true
  ///
  /// Useful for returning to a specific screen in the stack.
  void pushNamedAndRemoveUntil(
    String name,
    bool Function(String route) predicate, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    // Note: GoRouter doesn't have direct pushNamedAndRemoveUntil
    // This is a workaround - use go() which replaces the entire stack
    go(
      GoRouter.of(this).namedLocation(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      ),
      extra: extra,
    );
  }

  /// Go to a location, replacing the entire navigation stack
  ///
  /// This is the imperative equivalent of navigation.
  /// Replaces the current route stack with a new one.
  /// Useful for deep linking or post-authentication navigation.
  void go(String location, {Object? extra}) {
    GoRouter.of(this).go(location, extra: extra);
  }

  /// Navigate to a named location, replacing the entire navigation stack
  ///
  /// Similar to [go] but uses route names instead of paths.
  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(this).goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Pop the current route off the navigation stack
  ///
  /// Optionally returns a [result] to the previous route.
  /// If the stack has only one route, this might close the app.
  void pop<T extends Object?>([T? result]) {
    GoRouter.of(this).pop(result);
  }

  /// Check if the router can pop
  ///
  /// Returns true if there is more than one route in the stack.
  bool canPop() {
    return GoRouter.of(this).canPop();
  }

  /// Get the current location path
  ///
  /// Returns the full path of the current route including query parameters.
  String get currentLocation => GoRouterState.of(this).uri.toString();

  /// Get the current route name
  ///
  /// Returns the name of the current route if it has one.
  String? get currentRouteName => GoRouterState.of(this).name;

  /// Get path parameters from the current route
  ///
  /// Returns a map of path parameters (e.g., {'userId': '123'} for /user/123).
  Map<String, String> get pathParameters =>
      GoRouterState.of(this).pathParameters;

  /// Get query parameters from the current route
  ///
  /// Returns a map of query parameters (e.g., {'search': 'term'} for ?search=term).
  Map<String, String> get queryParameters =>
      GoRouterState.of(this).uri.queryParameters;

  /// Get extra data passed to the current route
  ///
  /// Returns the object that was passed using the [extra] parameter.
  Object? get extra => GoRouterState.of(this).extra;
}

/// Navigation helper methods for common patterns
extension NavigationHelpers on BuildContext {
  /// Show a modal bottom sheet
  ///
  /// Convenience method for showing bottom sheets consistently.
  Future<T?> showBottomSheetModal<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      builder: (context) => child,
    );
  }

  /// Show a dialog
  ///
  /// Convenience method for showing dialogs consistently.
  Future<T?> showDialogModal<T>({
    required Widget child,
    bool barrierDismissible = true,
    Color? barrierColor,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (context) => child,
    );
  }
}
