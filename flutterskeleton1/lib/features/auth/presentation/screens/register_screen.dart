import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterskeleton1/config/routes/route_names.dart';
import 'package:flutterskeleton1/core/constants/app_dimensions.dart';

/// Register screen placeholder
///
/// This is a basic placeholder that will be fully implemented in Step 17
/// with forms, validation, and registration logic.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.spacingLg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Register icon
              Icon(
                Icons.person_add_rounded,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              SizedBox(height: AppDimensions.spacingLg),

              // Title
              Text(
                'Register Screen',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Subtitle
              Text(
                'Full implementation in Step 17',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spacing2xl),

              // Create Account button (disabled placeholder)
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registration - Coming in Step 17'),
                    ),
                  );
                },
                child: const Text('Create Account (Coming Soon)'),
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Back to Login button
              OutlinedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Back to Login'),
              ),
              SizedBox(height: AppDimensions.spacingLg),

              // Already have account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(RoutePaths.login);
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
