import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterskeleton1/config/di/service_locator.dart';
import 'package:flutterskeleton1/core/constants/app_colors.dart';
import 'package:flutterskeleton1/core/constants/app_dimensions.dart';
import 'package:flutterskeleton1/core/constants/app_strings.dart';
import 'package:flutterskeleton1/core/theme/theme_provider.dart';

/// Demo screen showcasing theme system
/// 
/// Displays all colors, text styles, and components
/// Allows testing theme toggle functionality
/// Demonstrates dependency injection usage with logger
class ThemeDemoScreen extends ConsumerWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.themeDemo),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              themeMode == ThemeModeValue.light
                  ? Icons.light_mode
                  : themeMode == ThemeModeValue.dark
                      ? Icons.dark_mode
                      : Icons.brightness_auto,
            ),
            onPressed: () {
              // Cycle through themes with logging
              if (themeMode == ThemeModeValue.light) {
                logger.info('Switching theme to Dark mode');
                themeNotifier.setDarkMode();
              } else if (themeMode == ThemeModeValue.dark) {
                logger.info('Switching theme to System mode');
                themeNotifier.setSystemMode();
              } else {
                logger.info('Switching theme to Light mode');
                themeNotifier.setLightMode();
              }
            },
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        children: [
          // Dependency Injection Status Card
          Card(
            color: colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: AppDimensions.spacingSm),
                      Text(
                        'Dependency Injection Active',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Text(
                    'Logger service retrieved via GetIt',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingXs),
                  Text(
                    'Check console for theme change logs',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimaryContainer.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing),
          
          // Current Theme Display
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Theme',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Text(
                    themeMode.displayName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacing),
                  Wrap(
                    spacing: AppDimensions.spacingSm,
                    children: [
                      FilterChip(
                        label: const Text('Light'),
                        selected: themeMode == ThemeModeValue.light,
                        onSelected: (_) {
                          logger.info('Light theme selected via chip');
                          themeNotifier.setLightMode();
                        },
                      ),
                      FilterChip(
                        label: const Text('Dark'),
                        selected: themeMode == ThemeModeValue.dark,
                        onSelected: (_) {
                          logger.info('Dark theme selected via chip');
                          themeNotifier.setDarkMode();
                        },
                      ),
                      FilterChip(
                        label: const Text('System'),
                        selected: themeMode == ThemeModeValue.system,
                        onSelected: (_) {
                          logger.info('System theme selected via chip');
                          themeNotifier.setSystemMode();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppDimensions.spacing),

          // Color Palette Section
          _buildSectionTitle(context, 'Color Palette'),
          _buildColorGrid(context),

          const SizedBox(height: AppDimensions.spacing),

          // Typography Section
          _buildSectionTitle(context, 'Typography'),
          _buildTypographyExamples(context),

          const SizedBox(height: AppDimensions.spacing),

          // Button Section
          _buildSectionTitle(context, 'Buttons'),
          _buildButtonExamples(context),

          const SizedBox(height: AppDimensions.spacing),

          // Form Fields Section
          _buildSectionTitle(context, 'Form Fields'),
          _buildFormFieldExamples(context),

          const SizedBox(height: AppDimensions.spacing),

          // Components Section
          _buildSectionTitle(context, 'Components'),
          _buildComponentExamples(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.spacingSm),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildColorGrid(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    final colors = [
      ('Primary', colorScheme.primary),
      ('Secondary', colorScheme.secondary),
      ('Tertiary', colorScheme.tertiary),
      ('Error', colorScheme.error),
      ('Success', AppColors.success),
      ('Warning', AppColors.warning),
      ('Info', AppColors.info),
      ('Surface', colorScheme.surface),
      ('Background', colorScheme.background),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        child: Wrap(
          spacing: AppDimensions.spacingSm,
          runSpacing: AppDimensions.spacingSm,
          children: colors.map((colorInfo) {
            return SizedBox(
              width: 100,
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: colorInfo.$2,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingXs),
                  Text(
                    colorInfo.$1,
                    style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTypographyExamples(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Display Large', style: textTheme.displayLarge),
            const SizedBox(height: AppDimensions.spacingSm),
            Text('Headline Large', style: textTheme.headlineLarge),
            const SizedBox(height: AppDimensions.spacingSm),
            Text('Title Large', style: textTheme.titleLarge),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Body Large - The quick brown fox jumps over the lazy dog',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Body Medium - The quick brown fox jumps over the lazy dog',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Body Small - The quick brown fox jumps over the lazy dog',
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text('Label Large', style: textTheme.labelLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonExamples(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled Button'),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFieldExamples(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Text Field',
                hintText: 'Enter text here',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Error State',
                errorText: 'This field is required',
                prefixIcon: Icon(Icons.error),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Disabled Field',
                hintText: 'Cannot edit',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentExamples(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.inbox),
              title: const Text('List Tile'),
              subtitle: const Text('With subtitle'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text('Checkbox'),
              value: true,
              onChanged: (_) {},
            ),
            SwitchListTile(
              title: const Text('Switch'),
              value: false,
              onChanged: (_) {},
            ),
            RadioListTile<int>(
              title: const Text('Radio Button'),
              value: 1,
              groupValue: 1,
              onChanged: (_) {},
            ),
            const SizedBox(height: AppDimensions.spacing),
            const LinearProgressIndicator(),
            const SizedBox(height: AppDimensions.spacing),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
