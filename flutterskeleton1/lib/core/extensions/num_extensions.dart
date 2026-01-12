import 'dart:math' as math;
import 'package:intl/intl.dart';

/// Extension on [num] providing formatting and utility methods
/// 
/// Works for both [int] and [double] types.
extension NumExtensions on num {
  // Formatting Helpers
  
  /// Formats the number as currency with the specified symbol
  /// 
  /// Examples:
  /// ```dart
  /// 1234.56.toCurrency() // '\$1,234.56'
  /// 1234.56.toCurrency('€') // '€1,234.56'
  /// ```
  String toCurrency([String symbol = '\$']) {
    final formatter = NumberFormat.currency(symbol: symbol, decimalDigits: 2);
    return formatter.format(this);
  }

  /// Formats large numbers in compact form (K, M, B, T)
  /// 
  /// Examples:
  /// ```dart
  /// 1500.toCompact() // '1.5K'
  /// 1500000.toCompact() // '1.5M'
  /// 1500000000.toCompact() // '1.5B'
  /// ```
  String toCompact() {
    if (abs() < 1000) {
      return toString();
    }
    
    final suffixes = ['', 'K', 'M', 'B', 'T'];
    var index = 0;
    var value = toDouble();
    
    while (value.abs() >= 1000 && index < suffixes.length - 1) {
      value /= 1000;
      index++;
    }
    
    // Format with up to 1 decimal place, removing trailing zeros
    final formatted = value.toStringAsFixed(1);
    final cleaned = formatted.endsWith('.0') 
        ? formatted.substring(0, formatted.length - 2)
        : formatted;
    
    return '$cleaned${suffixes[index]}';
  }

  /// Formats the number with thousands separators
  /// 
  /// Example: 1234567.withCommas() // '1,234,567'
  String withCommas() {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }

  /// Formats as percentage with specified decimal places
  /// 
  /// Examples:
  /// ```dart
  /// 0.1234.toPercentage() // '12.3%'
  /// 0.1234.toPercentage(decimals: 1) // '12.3%'
  /// ```
  String toPercentage({int decimals = 1}) {
    final percentage = this * 100;
    return '${percentage.toStringAsFixed(decimals)}%';
  }

  // Mathematical Conversions
  
  /// Converts degrees to radians
  /// 
  /// Example: 180.toRadians() // 3.14159...
  double toRadians() {
    return this * (math.pi / 180);
  }

  /// Converts radians to degrees
  /// 
  /// Example: 3.14159.toDegrees() // 180
  double toDegrees() {
    return this * (180 / math.pi);
  }

  // Utility Helpers
  
  /// Clamps the value between min and max
  /// 
  /// Example: 15.clamp(0, 10) // 10
  num clamp(num min, num max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Returns true if the number is between min and max (inclusive)
  /// 
  /// Example: 5.isBetween(1, 10) // true
  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }

  /// Returns the absolute value as the same type
  num abs() {
    return this < 0 ? -this : this;
  }
}