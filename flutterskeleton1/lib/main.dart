import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterskeleton1/core/theme/app_theme.dart';
import 'package:flutterskeleton1/core/theme/theme_demo_screen.dart';
import 'package:flutterskeleton1/core/theme/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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