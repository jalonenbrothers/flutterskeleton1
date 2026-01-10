import 'package:flutter/material.dart';

/// Custom loading indicator with optional message
///
/// Displays a circular progress indicator with optional loading message.
/// Can be used inline or as a full-screen overlay.
///
/// Example:
/// ```dart
/// LoadingIndicator(message: 'Loading data...')
/// ```
class LoadingIndicator extends StatelessWidget {
  /// Optional message to display below indicator
  final String? message;

  /// Size of the indicator
  final double size;

  /// Whether to center the indicator
  final bool center;

  const LoadingIndicator({
    super.key,
    this.message,
    this.size = 40,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    final indicator = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(),
        ),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    return center ? Center(child: indicator) : indicator;
  }

  /// Creates a full-screen loading overlay
  static Widget overlay({String? message}) {
    return Container(
      color: Colors.black54,
      child: LoadingIndicator(message: message),
    );
  }
}