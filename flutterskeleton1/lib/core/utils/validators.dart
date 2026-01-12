/// Form validation utilities for common input types
/// 
/// All validators return `String?`:
/// - `null` if validation passes
/// - Error message `String` if validation fails
/// 
/// This format is compatible with Flutter's `FormField` validator parameter.
class Validators {
  Validators._(); // Private constructor to prevent instantiation

  // Basic Validators
  
  /// Validates that a field is not empty
  /// 
  /// ```dart
  /// TextFormField(
  ///   validator: (value) => Validators.required(value, 'Email'),
  /// )
  /// ```
  static String? required(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  /// Validates email format
  /// 
  /// Uses the same regex as [StringExtensions.isValidEmail]
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates password strength
  /// 
  /// Requirements:
  /// - Minimum 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one digit
  /// - At least one special character
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// Validates that two passwords match
  /// 
  /// ```dart
  /// TextFormField(
  ///   validator: (value) => Validators.confirmPassword(
  ///     value,
  ///     passwordController.text,
  ///   ),
  /// )
  /// ```
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  /// Validates phone number format
  /// 
  /// Supports formats: (123) 456-7890, 123-456-7890, 1234567890
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(
      r'^\+?1?\s*\(?[0-9]{3}\)?[\s.-]?[0-9]{3}[\s.-]?[0-9]{4}$',
    );

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validates minimum length
  /// 
  /// ```dart
  /// validator: (value) => Validators.minLength(value, 6),
  /// ```
  static String? minLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (value.length < minLength) {
      return 'Must be at least $minLength characters';
    }

    return null;
  }

  /// Validates maximum length
  static String? maxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'Must be at most $maxLength characters';
    }

    return null;
  }

  /// Validates that value contains only alphanumeric characters
  static String? alphanumeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Only letters and numbers are allowed';
    }

    return null;
  }

  /// Validates that value is a valid URL
  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }

    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  /// Validates numeric input
  static String? numeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }

    return null;
  }

  /// Validates that number is within a range
  static String? numberInRange(String? value, num min, num max) {
    final numericError = numeric(value);
    if (numericError != null) return numericError;

    final number = double.parse(value!);
    if (number < min || number > max) {
      return 'Must be between $min and $max';
    }

    return null;
  }

  // Combinator
  
  /// Combines multiple validators into one
  /// 
  /// Returns the first error found, or null if all pass.
  /// 
  /// ```dart
  /// validator: Validators.combine([
  ///   (value) => Validators.required(value, 'Email'),
  ///   Validators.email,
  /// ]),
  /// ```
  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }
}