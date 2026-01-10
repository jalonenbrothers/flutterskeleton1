import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Custom text field with validation support and consistent styling
///
/// Provides Material 3 design with optional prefix/suffix icons,
/// password visibility toggle, and validation error display.
///
/// Example:
/// ```dart
/// CustomTextField(
///   label: 'Email',
///   controller: emailController,
///   validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
///   keyboardType: TextInputType.emailAddress,
/// )
/// ```
class CustomTextField extends StatefulWidget {
  /// Text field label
  final String label;

  /// Optional hint text
  final String? hint;

  /// Text editing controller
  final TextEditingController? controller;

  /// Initial value if controller not provided
  final String? initialValue;

  /// Validation function
  final String? Function(String?)? validator;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Whether field is for password entry
  final bool obscureText;

  /// Whether field is enabled
  final bool enabled;

  /// Maximum number of lines
  final int? maxLines;

  /// Maximum length of input
  final int? maxLength;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final IconData? suffixIcon;

  /// Suffix icon callback
  final VoidCallback? onSuffixIconPressed;

  /// Called when field value changes
  final void Function(String)? onChanged;

  /// Called when field is submitted
  final void Function(String)? onSubmitted;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Autofill hints
  final Iterable<String>? autofillHints;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.initialValue,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.autofillHints,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        border: const OutlineInputBorder(),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon)
            : null,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    // Password visibility toggle
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    }

    // Custom suffix icon
    if (widget.suffixIcon != null) {
      return IconButton(
        icon: Icon(widget.suffixIcon),
        onPressed: widget.onSuffixIconPressed,
      );
    }

    return null;
  }
}