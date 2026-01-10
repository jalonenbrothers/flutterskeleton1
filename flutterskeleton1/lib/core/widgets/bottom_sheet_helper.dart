import 'package:flutter/material.dart';

/// Helper methods for showing bottom sheets with consistent styling
///
/// Provides methods to show modal and persistent bottom sheets
/// with Material 3 design.
///
/// Example:
/// ```dart
/// BottomSheetHelper.show(
///   context,
///   child: MyBottomSheetContent(),
/// )
/// ```
class BottomSheetHelper {
  BottomSheetHelper._();

  /// Shows a modal bottom sheet
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    double? height,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: height != null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => height != null
          ? SizedBox(height: height, child: child)
          : child,
    );
  }

  /// Shows a bottom sheet with a title and content
  static Future<T?> showWithTitle<T>(
    BuildContext context, {
    required String title,
    required Widget child,
    List<Widget>? actions,
    bool isDismissible = true,
  }) {
    return show<T>(
      context,
      isDismissible: isDismissible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          // Handle bar
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          // Content
          Flexible(child: child),
          // Actions
          if (actions != null) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Shows a list bottom sheet for selection
  static Future<T?> showList<T>(
    BuildContext context, {
    required String title,
    required List<BottomSheetItem<T>> items,
  }) {
    return showWithTitle<T>(
      context,
      title: title,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: item.icon != null ? Icon(item.icon) : null,
            title: Text(item.label),
            subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
            onTap: () => Navigator.pop(context, item.value),
          );
        },
      ),
    );
  }
}

/// Item for bottom sheet list
class BottomSheetItem<T> {
  final String label;
  final String? subtitle;
  final IconData? icon;
  final T value;

  const BottomSheetItem({
    required this.label,
    this.subtitle,
    this.icon,
    required this.value,
  });
}