/// Route configuration constants
///
/// Defines all route names and paths used throughout the application.
/// Use [Routes] for route names in navigation calls.
/// Use [RoutePaths] for actual URL paths in route configuration.
library;

/// Route names used for type-safe navigation
///
/// Example usage:
/// ```dart
/// context.pushNamed(Routes.login);
/// ```
class Routes {
  Routes._(); // Private constructor to prevent instantiation

  // Core routes
  static const String splash = 'splash';
  static const String home = 'home';

  // Auth routes
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotPassword';
  static const String resetPassword = 'resetPassword';

  // Profile routes
  static const String profile = 'profile';
  static const String editProfile = 'editProfile';

  // Settings routes
  static const String settings = 'settings';

  // Error routes
  static const String notFound = 'notFound';
}

/// Route paths used in GoRouter configuration
///
/// These define the actual URL paths for each route.
/// Supports nested routes and path parameters.
class RoutePaths {
  RoutePaths._(); // Private constructor to prevent instantiation

  // Core paths
  static const String splash = '/splash';
  static const String home = '/home';

  // Auth paths
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  // Profile paths
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';

  // Settings paths
  static const String settings = '/settings';

  // Error paths
  static const String notFound = '/not-found';
}

/// Route parameter names
///
/// Used for type-safe parameter passing in routes.
/// Example:
/// ```dart
/// '/user/:${RouteParams.userId}'
/// ```
class RouteParams {
  RouteParams._(); // Private constructor to prevent instantiation

  static const String userId = 'userId';
  static const String postId = 'postId';
  static const String token = 'token';
}
