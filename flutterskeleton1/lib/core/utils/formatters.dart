import 'package:flutter/services.dart';

/// Collection of text input formatters for common use cases
/// 
/// These formatters can be used with [TextFormField] or [TextField]:
/// ```dart
/// TextField(
///   inputFormatters: [Formatters.phoneNumber],
/// )
/// ```
class Formatters {
  Formatters._(); // Private constructor to prevent instantiation

  // Phone Number Formatter
  
  /// Formats phone numbers as (XXX) XXX-XXXX
  /// 
  /// Automatically adds parentheses, space, and hyphen as user types.
  static final phoneNumber = _PhoneNumberFormatter();

  // Credit Card Formatter
  
  /// Formats credit card numbers as XXXX XXXX XXXX XXXX
  /// 
  /// Adds spaces every 4 digits.
  static final creditCard = _CreditCardFormatter();

  // Numeric Formatters
  
  /// Allows only digits (0-9)
  static final digitsOnly = FilteringTextInputFormatter.digitsOnly;

  /// Allows only letters (a-z, A-Z)
  static final lettersOnly = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z]'),
  );

  /// Allows letters and spaces only
  static final lettersAndSpaces = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z\s]'),
  );

  /// Allows alphanumeric characters only
  static final alphanumeric = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z0-9]'),
  );

  // Currency Formatter
  
  /// Formats currency input with 2 decimal places
  /// 
  /// Example: 1234.56
  static final currency = _CurrencyFormatter();

  // Custom Formatters
  
  /// Creates a formatter that limits maximum length
  /// 
  /// ```dart
  /// Formatters.maxLength(10)
  /// ```
  static LengthLimitingTextInputFormatter maxLength(int maxLength) {
    return LengthLimitingTextInputFormatter(maxLength);
  }

  /// Creates a formatter that allows specific regex pattern
  /// 
  /// ```dart
  /// Formatters.allow(RegExp(r'[0-9a-f]')) // Hex digits only
  /// ```
  static FilteringTextInputFormatter allow(Pattern pattern) {
    return FilteringTextInputFormatter.allow(pattern);
  }

  /// Creates a formatter that denies specific regex pattern
  /// 
  /// ```dart
  /// Formatters.deny(RegExp(r'[^a-zA-Z0-9]')) // Deny special characters
  /// ```
  static FilteringTextInputFormatter deny(Pattern pattern) {
    return FilteringTextInputFormatter.deny(pattern);
  }

  // Uppercase/Lowercase Formatters
  
  /// Converts all input to uppercase
  static final uppercase = _UpperCaseFormatter();

  /// Converts all input to lowercase
  static final lowercase = _LowerCaseFormatter();

  /// Capitalizes the first letter of each word
  static final capitalize = _CapitalizeFormatter();
}

// Private Formatter Implementations

/// Phone number formatter: (XXX) XXX-XXXX
class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final buffer = StringBuffer();

    // Add area code with parentheses
    if (text.length >= 1) {
      buffer.write('(');
      buffer.write(text.substring(0, text.length.clamp(0, 3)));
      if (text.length >= 3) {
        buffer.write(') ');
      }
    }

    // Add first 3 digits
    if (text.length > 3) {
      buffer.write(text.substring(3, text.length.clamp(3, 6)));
      if (text.length >= 6) {
        buffer.write('-');
      }
    }

    // Add last 4 digits
    if (text.length > 6) {
      buffer.write(text.substring(6, text.length.clamp(6, 10)));
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Credit card formatter: XXXX XXXX XXXX XXXX
class _CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final buffer = StringBuffer();
    for (var i = 0; i < text.length && i < 16; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Currency formatter with 2 decimal places
class _CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allow only digits and single decimal point
    final text = newValue.text;
    
    if (text.isEmpty) {
      return newValue;
    }

    // Check if text contains more than one decimal point
    if (text.split('.').length > 2) {
      return oldValue;
    }

    // Limit decimal places to 2
    final parts = text.split('.');
    if (parts.length == 2 && parts[1].length > 2) {
      return oldValue;
    }

    return newValue;
  }
}

/// Uppercase formatter
class _UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/// Lowercase formatter
class _LowerCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

/// Capitalize first letter of each word
class _CapitalizeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final words = newValue.text.split(' ');
    final capitalized = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');

    return TextEditingValue(
      text: capitalized,
      selection: newValue.selection,
    );
  }
}
