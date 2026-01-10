import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterskeleton1/config/routes/route_names.dart';
import 'package:flutterskeleton1/core/constants/app_dimensions.dart';

/// Splash screen displayed when the app launches
///
/// Shows app branding and initializes necessary services.
/// Automatically navigates to the appropriate screen after initialization.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }
 
  /// Navigate to next screen after delay
  ///
  /// Currently navigates to home after 2 seconds.
  /// In Step 18, this will check authentication state and redirect accordingly.
  Future<void> _navigateToNextScreen() async {
    // Simulate initialization delay
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Navigate to home screen (will be auth-aware in Step 18)
    context.go(RoutePaths.home);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App icon/logo placeholder
            Icon(
              Icons.flutter_dash,
              size: 120,
              color: theme.colorScheme.onPrimary,
            ),
            SizedBox(height: AppDimensions.spacingLg),
            
            // App name
            Text(
              'Flutter Skeleton',
              style: theme.textTheme.headlineLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppDimensions.spacingSm),
            
            // Tagline
            Text(
              'Production-Ready Starter Template',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(0.8),
              ),
            ),
            SizedBox(height: AppDimensions.spacing2xl),
            
            // Loading indicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
