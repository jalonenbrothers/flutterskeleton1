import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterskeleton1/config/routes/route_names.dart';
import 'package:flutterskeleton1/core/constants/app_dimensions.dart';
import 'package:flutterskeleton1/config/di/service_locator.dart';

/// Home screen - main landing page after authentication
///
/// Displays navigation options to other features.
/// Full implementation with actual content will be added in Step 20.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          // Settings button placeholder
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings - Coming soon')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.spacingLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome message
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.spacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        size: 48,
                        color: theme.colorScheme.primary,
                      ),
                      SizedBox(height: AppDimensions.spacingMd),
                      Text(
                        'Welcome Home!',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacingSm),
                      Text(
                        'This is a placeholder home screen. Full implementation in Step 20.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => context.goNamed('widgets'),
                icon: const Icon(Icons.widgets),
                label: const Text('View Widget Showcase'),
              ),

              SizedBox(height: AppDimensions.spacingLg),

              // Navigation section
              Text(
                'Quick Actions',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Profile button
              _NavigationCard(
                icon: Icons.person_outline,
                title: 'Profile',
                subtitle: 'View and edit your profile',
                onTap: () {
                  logger.info('Navigating to profile');
                  context.push(RoutePaths.profile);
                },
              ),
              SizedBox(height: AppDimensions.spacingMd),

              // Theme demo button
              _NavigationCard(
                icon: Icons.palette_outlined,
                title: 'Theme Demo',
                subtitle: 'View theme showcase',
                onTap: () {
                  logger.info('Navigating to theme demo');
                  // Navigate to theme demo (temporary)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Theme demo accessible from Step 2'),
                    ),
                  );
                },
              ),
              
              // Extensions & Utilities Demo (Step 6)
              _NavigationCard(
                icon: Icons.extension_outlined,
                title: 'Extensions & Utils Demo',
                subtitle: 'View extensions and utilities showcase',
                onTap: () {
                  logger.info('Navigating to extensions demo');
                  context.push('/extensions-demo');
                },
              ),

              const Spacer(),

              // Logout button (placeholder)
              OutlinedButton.icon(
                onPressed: () {
                  logger.info('Logout triggered (placeholder)');
                  // Will implement proper logout in Step 18
                  context.go(RoutePaths.login);
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout (Placeholder)'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                  side: BorderSide(color: theme.colorScheme.error),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable navigation card widget
class _NavigationCard extends StatelessWidget {
  const _NavigationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.spacing),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppDimensions.spacingMd),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              SizedBox(width: AppDimensions.spacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: AppDimensions.spacingXs),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
