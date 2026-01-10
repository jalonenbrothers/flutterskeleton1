import 'package:flutter/material.dart';

/// Error view widget for displaying error states with retry option
///
/// Shows an error icon, message, and optional retry button.
/// Used for displaying error states in screens or widgets.
///
/// Example:
/// ```dart
/// ErrorView(
///   message: 'Failed to load data',
///   onRetry: () => loadData(),
/// )
/// ```
class ErrorView extends StatelessWidget {
  /// Error message to display
  final String message;

  /// Optional detailed error description
  final String? details;

  /// Callback for retry action
  final VoidCallback? onRetry;

  /// Whether to center the view
  final bool center;

  /// Custom error icon
  final IconData icon;

  const ErrorView({
    super.key,
    required this.message,
    this.details,
    this.onRetry,
    this.center = true,
    this.icon = Icons.error_outline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 64,
          color: theme.colorScheme.error,
        ),
        const SizedBox(height: 16),
        Text(
          message,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.error,
          ),
          textAlign: TextAlign.center,
        ),
        if (details != null) ...[
          const SizedBox(height: 8),
          Text(
            details!,
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
        if (onRetry != null) ...[
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ],
    );

    return center
        ? Center(child: Padding(
            padding: const EdgeInsets.all(24),
            child: content,
          ))
        : Padding(
            padding: const EdgeInsets.all(24),
            child: content,
          );
  }
}