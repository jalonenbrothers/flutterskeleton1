import 'package:flutter/material.dart';

/// Custom button widget following Material 3 design with loading states
///
/// Supports three variants: primary (filled), secondary (outlined), and text.
/// Includes built-in loading state and disabled state handling.
///
/// Example:
/// ```dart
/// CustomButton(
///   text: 'Submit',
///   onPressed: () => handleSubmit(),
///   isLoading: isSubmitting,
/// )
/// ```
class CustomButton extends StatelessWidget {
  /// Text displayed on the button
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether button is in loading state
  final bool isLoading;

  /// Button style variant
  final ButtonVariant variant;

  /// Button width behavior
  final ButtonWidth width;

  /// Optional icon to display before text
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.variant = ButtonVariant.primary,
    this.width = ButtonWidth.flexible,
    this.icon,
  });

  /// Creates a primary (filled) button
  const CustomButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width = ButtonWidth.flexible,
    this.icon,
  }) : variant = ButtonVariant.primary;

  /// Creates a secondary (outlined) button
  const CustomButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width = ButtonWidth.flexible,
    this.icon,
  }) : variant = ButtonVariant.secondary;

  /// Creates a text button
  const CustomButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width = ButtonWidth.flexible,
    this.icon,
  }) : variant = ButtonVariant.text;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    // Button content with optional loading indicator
    final Widget content = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: 8),
              ],
              Text(text),
            ],
          );

    // Wrap in full width if needed
    final Widget button = _buildButton(context, content, isDisabled);

    return width == ButtonWidth.fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  Widget _buildButton(BuildContext context, Widget content, bool isDisabled) {
    final VoidCallback? callback = isDisabled ? null : onPressed;

    switch (variant) {
      case ButtonVariant.primary:
        return FilledButton(
          onPressed: callback,
          child: content,
        );
      case ButtonVariant.secondary:
        return OutlinedButton(
          onPressed: callback,
          child: content,
        );
      case ButtonVariant.text:
        return TextButton(
          onPressed: callback,
          child: content,
        );
    }
  }
}

/// Button style variants
enum ButtonVariant {
  /// Filled button (primary action)
  primary,

  /// Outlined button (secondary action)
  secondary,

  /// Text button (tertiary action)
  text,
}

/// Button width behavior
enum ButtonWidth {
  /// Flexible width based on content
  flexible,

  /// Full width of parent
  fullWidth,
}