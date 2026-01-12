/// Extension on [String] providing validation, formatting, and parsing utilities
extension StringExtensions on String {
  // Validation Helpers
  
  /// Returns true if the string is a valid email format
  /// 
  /// Uses a comprehensive regex pattern for email validation.
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Returns true if the string meets password requirements
  /// 
  /// Requirements:
  /// - Minimum 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one digit
  /// - At least one special character
  bool get isValidPassword {
    if (length < 8) return false;
    
    final hasUppercase = contains(RegExp(r'[A-Z]'));
    final hasLowercase = contains(RegExp(r'[a-z]'));
    final hasDigit = contains(RegExp(r'\d'));
    final hasSpecialChar = contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    
    return hasUppercase && hasLowercase && hasDigit && hasSpecialChar;
  }

  /// Returns true if the string is a valid phone number format
  /// 
  /// Supports basic formats: (123) 456-7890, 123-456-7890, 1234567890
  bool get isValidPhone {
    final phoneRegex = RegExp(
      r'^\+?1?\s*\(?[0-9]{3}\)?[\s.-]?[0-9]{3}[\s.-]?[0-9]{4}$',
    );
    return phoneRegex.hasMatch(this);
  }

  // Formatting Helpers
  
  /// Returns the string with the first letter capitalized
  /// 
  /// Example: "hello" → "Hello"
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Returns the string with the first letter of each word capitalized
  /// 
  /// Example: "hello world" → "Hello World"
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isEmpty ? word : word.capitalize)
        .join(' ');
  }

  /// Returns the string with all whitespace removed
  /// 
  /// Example: "hello  world" → "helloworld"
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Truncates the string to the specified [maxLength] and adds ellipsis
  /// 
  /// Example: "Hello World".truncate(5) → "Hello..."
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  // Parsing Helpers
  
  /// Safely parses the string to an [int]
  /// 
  /// Returns null if parsing fails instead of throwing an exception.
  int? toInt() {
    return int.tryParse(this);
  }

  /// Safely parses the string to a [double]
  /// 
  /// Returns null if parsing fails instead of throwing an exception.
  double? toDouble() {
    return double.tryParse(this);
  }

  /// Parses the string to a [bool]
  /// 
  /// Recognizes: 'true', '1', 'yes' as true (case-insensitive)
  /// Everything else returns false.
  bool toBool() {
    final normalized = toLowerCase().trim();
    return normalized == 'true' || normalized == '1' || normalized == 'yes';
  }

  // Null/Empty Checks
  
  /// Returns true if the string is null or empty
  bool get isNullOrEmpty => trim().isEmpty;

  /// Returns true if the string is not null and not empty
  bool get isNotNullOrEmpty => trim().isNotEmpty;
}

/// Extension on nullable [String] for null-safe operations
extension NullableStringExtensions on String? {
  /// Returns true if the string is null or empty
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  /// Returns true if the string is not null and not empty
  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}