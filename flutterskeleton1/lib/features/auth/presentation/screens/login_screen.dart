import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterskeleton1/config/routes/route_names.dart';
import 'package:flutterskeleton1/core/constants/app_dimensions.dart';

/// Login screen placeholder
///
/// This is a basic placeholder that will be fully implemented in Step 16
/// with forms, validation, and authentication logic.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.spacingLg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Login icon
              Icon(
                Icons.login_rounded,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              SizedBox(height: AppDimensions.spacingLg),

              // Title
              Text(
                'Login Screen',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Subtitle
              Text(
                'Full implementation in Step 16',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spacing2xl),

              // Navigate to Register button
              ElevatedButton(
                onPressed: () {
                  context.push(RoutePaths.register);
                },
                child: const Text('Go to Register'),
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Bypass to Home button (temporary for testing)
              OutlinedButton(
                onPressed: () {
                  context.go(RoutePaths.home);
                },
                child: const Text('Bypass to Home (Testing)'),
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Navigate to Forgot Password button
              TextButton(
                onPressed: () {
                  // Will implement in Step 17
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Forgot Password - Coming in Step 17'),
                    ),
                  );
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
