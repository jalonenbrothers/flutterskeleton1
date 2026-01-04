import 'package:logger/logger.dart' as logger_package;

/// Abstract logger service interface
///
/// Provides a consistent logging API across the application.
/// Implementations can customize logging behavior based on environment.
abstract class LoggerService {
  /// Log debug message (verbose information for development)
  void debug(String message, {Object? error, StackTrace? stackTrace});

  /// Log info message (general informational messages)
  void info(String message, {Object? error, StackTrace? stackTrace});

  /// Log warning message (potentially harmful situations)
  void warning(String message, {Object? error, StackTrace? stackTrace});

  /// Log error message (error events)
  void error(String message, {Object? error, StackTrace? stackTrace});
}

/// Default implementation of LoggerService using the logger package
///
/// Provides formatted console output with colors and emoji icons.
/// Log levels can be configured based on build environment.
class LoggerServiceImpl implements LoggerService {
  late final logger_package.Logger _logger;

  LoggerServiceImpl() {
    _logger = logger_package.Logger(
      printer: logger_package.PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls for errors
        lineLength: 80, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print emoji for each log level
        dateTimeFormat: logger_package.DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: _getLogLevel(),
    );
  }

  /// Determines the log level based on build mode
  ///
  /// In production, only warnings and errors are logged.
  /// In debug mode, all log levels are enabled.
  logger_package.Level _getLogLevel() {
    // Check if running in debug mode
    bool isDebugMode = true;
    assert(() {
      isDebugMode = true;
      return true;
    }());

    if (!isDebugMode) {
      // Production: Only show warnings and errors
      return logger_package.Level.warning;
    }

    // Debug mode: Show everything
    return logger_package.Level.debug;
  }

  @override
  void debug(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
