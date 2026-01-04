import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterskeleton1/config/di/injection_container.dart';
import 'package:flutterskeleton1/core/theme/app_theme.dart';
import 'package:flutterskeleton1/core/theme/theme_demo_screen.dart';
import 'package:flutterskeleton1/core/theme/theme_provider.dart';

/// Application entry point
///
/// Initializes dependency injection and starts the Flutter app.
/// Must ensure [WidgetsFlutterBinding] is initialized before any async operations.
void main() async {
  // Ensure Flutter binding is initialized for async operations
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize dependency injection container
    await setupServiceLocator();

    // Start the app
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  } catch (error, stackTrace) {
    // Handle initialization errors
    debugPrint('Failed to initialize app: $error');
    debugPrint('Stack trace: $stackTrace');

    // Show error screen
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Failed to initialize app',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Flutter Skeleton App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: themeMode.toMaterialThemeMode(),
      home: const ThemeDemoScreen(),
    );
  }
}