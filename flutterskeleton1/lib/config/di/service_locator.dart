import 'package:go_router/go_router.dart';

import '../../core/utils/logger.dart';
import 'injection_container.dart';

/// Type-safe service locator helpers
///
/// Provides convenient getters for accessing services from the DI container.
/// Use these helpers instead of directly calling [getIt<T>()] for better
/// type safety and easier refactoring.
///
/// Example:
/// ```dart
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     logger.info('Building MyWidget');
///     return Container();
///   }
/// }
/// ```

// ============================================================================
// CORE UTILITIES
// ============================================================================

/// Global logger instance
///
/// Use this throughout the app for consistent logging.
/// Automatically handles log levels based on build mode.
LoggerService get logger => getIt<LoggerService>();

// ============================================================================
// ROUTING
// ============================================================================

/// Global router instance
///
/// Access the GoRouter instance for programmatic navigation.
/// Prefer using context extensions for navigation in widgets.
GoRouter get router => getIt<GoRouter>();

// ============================================================================
// STORAGE SERVICES (To be added in Step 9)
// ============================================================================

// SecureStorageService get secureStorage => getIt<SecureStorageService>();
// LocalStorageService get localStorage => getIt<LocalStorageService>();

// ============================================================================
// API & NETWORK (To be added in Step 10)
// ============================================================================

// ApiService get apiService => getIt<ApiService>();
// Dio get dio => getIt<Dio>();

// ============================================================================
// ANALYTICS & MONITORING (To be added in Step 12)
// ============================================================================

// AnalyticsService get analytics => getIt<AnalyticsService>();
// CrashlyticsService get crashlytics => getIt<CrashlyticsService>();

// ============================================================================
// REPOSITORIES (To be added in Steps 14+)
// ============================================================================

// AuthRepository get authRepository => getIt<AuthRepository>();
