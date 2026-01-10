import 'package:flutter/material.dart';
import 'package:flutterskeleton1/core/widgets/widget_showcase_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterskeleton1/config/routes/route_names.dart';
import 'package:flutterskeleton1/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutterskeleton1/features/auth/presentation/screens/login_screen.dart';
import 'package:flutterskeleton1/features/auth/presentation/screens/register_screen.dart';
import 'package:flutterskeleton1/features/home/presentation/screens/home_screen.dart';
import 'package:flutterskeleton1/features/profile/presentation/screens/profile_screen.dart';

/// Application router configuration
///
/// Defines all routes using GoRouter for declarative navigation.
/// Supports deep linking, page transitions, and route guards.
///
/// Route guards and authentication-aware redirects will be added in Step 18.
class AppRouter {
  AppRouter._(); // Private constructor to prevent instantiation

  /// GoRouter instance configured with all application routes
  static final GoRouter router = GoRouter(
    // Initial route
    initialLocation: RoutePaths.splash,

    // Error handling - show error page for undefined routes
    errorBuilder: (context, state) => _ErrorScreen(error: state.error),

    // Redirect logic placeholder (will implement auth guards in Step 18)
    redirect: (context, state) {
      // TODO: Implement authentication-aware redirects in Step 18
      // Check if user is authenticated
      // Redirect to login if accessing protected route without auth
      // Redirect to home if accessing auth routes while authenticated
      return null; // No redirect for now
    },

    // Route configuration
    routes: [
      // Splash route
      GoRoute(
        path: RoutePaths.splash,
        name: Routes.splash,
        pageBuilder: (context, state) => _buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const SplashScreen(),
        ),
      ),

      // Home route
      GoRoute(
        path: RoutePaths.home,
        name: Routes.home,
        pageBuilder: (context, state) => _buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),

      // Login route
      GoRoute(
        path: RoutePaths.login,
        name: Routes.login,
        pageBuilder: (context, state) => _buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),

      // Register route
      GoRoute(
        path: RoutePaths.register,
        name: Routes.register,
        pageBuilder: (context, state) => _buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const RegisterScreen(),
        ),
      ),

      // Profile route
      GoRoute(
        path: RoutePaths.profile,
        name: Routes.profile,
        pageBuilder: (context, state) => _buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const ProfileScreen(),
        ),
      ),

      GoRoute(
        path: '/widgets',
        name: 'widgets',
        builder: (context, state) => const WidgetShowcaseScreen(),
      ), 

      // Additional routes will be added in future steps:
      // - Forgot Password (Step 17)
      // - Reset Password (Step 17)
      // - Edit Profile (Step 21)
      // - Settings (Step 22)
    ],
  );

  /// Build page with fade transition animation
  static Page<dynamic> _buildPageWithFadeTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }

  /// Build page with slide transition animation
  static Page<dynamic> _buildPageWithSlideTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

/// Error screen displayed for undefined routes
class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 80,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 24),
              Text(
                'Page Not Found',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                error?.toString() ?? 'The requested page could not be found.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  context.go(RoutePaths.home);
                },
                icon: const Icon(Icons.home),
                label: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
