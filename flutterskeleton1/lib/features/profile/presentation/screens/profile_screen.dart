import 'package:flutter/material.dart';
import 'package:flutterskeleton1/core/constants/app_dimensions.dart';

/// Profile screen placeholder
///
/// Displays user profile information.
/// Full implementation with actual data will be added in Step 21.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          // Edit profile button
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Edit Profile - Coming in Step 21'),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.spacingLg),
          child: Column(
            children: [
              // Profile avatar
              CircleAvatar(
                radius: 60,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              SizedBox(height: AppDimensions.spacing),

              // User name
              Text(
                'John Doe',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.spacingSm),

              // User email
              Text(
                'john.doe@example.com',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              SizedBox(height: AppDimensions.spacingXl),

              // Profile info card
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.spacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Information',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacing),
                      _ProfileInfoRow(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: 'john.doe@example.com',
                      ),
                      _ProfileInfoRow(
                        icon: Icons.phone_outlined,
                        label: 'Phone',
                        value: '+1 234 567 8900',
                      ),
                      _ProfileInfoRow(
                        icon: Icons.location_on_outlined,
                        label: 'Location',
                        value: 'New York, USA',
                      ),
                      _ProfileInfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Member Since',
                        value: 'January 2026',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.spacing),

              // Placeholder message
              Card(
                color: theme.colorScheme.secondaryContainer,
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.spacing),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                      SizedBox(width: AppDimensions.spacingMd),
                      Expanded(
                        child: Text(
                          'This is a placeholder screen. Full profile implementation in Step 21.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Profile information row widget
class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.spacingMd),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          SizedBox(width: AppDimensions.spacingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: AppDimensions.spacingXs),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
