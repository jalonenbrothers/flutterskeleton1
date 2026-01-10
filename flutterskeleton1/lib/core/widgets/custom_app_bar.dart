import 'package:flutter/material.dart';

/// Custom app bar with consistent styling and optional actions
///
/// Provides a Material 3 app bar with automatic back button,
/// title, and optional action buttons.
///
/// Example:
/// ```dart
/// CustomAppBar(
///   title: 'Profile',
///   actions: [
///     IconButton(icon: Icon(Icons.edit), onPressed: () => edit()),
///   ],
/// )
/// ```
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// App bar title
  final String title;

  /// Optional action widgets
  final List<Widget>? actions;

  /// Whether to show back button
  final bool showBackButton;

  /// Custom back button callback
  final VoidCallback? onBack;

  /// Whether to center the title
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBack,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton && onBack != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}