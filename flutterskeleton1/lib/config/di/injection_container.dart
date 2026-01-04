import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/logger.dart';
import '../routes/app_router.dart';

/// Global service locator instance
///
/// Used to register and retrieve service instances throughout the app.
/// Supports three registration types:
/// - [registerLazySingleton]: Creates singleton on first access
/// - [registerSingleton]: Creates singleton immediately
/// - [registerFactory]: Creates new instance each time
final GetIt getIt = GetIt.instance;

/// Initializes and configures the dependency injection container
///
/// Must be called before [runApp()] in main.dart to ensure all services
/// are properly registered and available throughout the app lifecycle.
///
/// Registration order matters for services with dependencies.
/// Register services with no dependencies first.
///
/// Example:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await setupServiceLocator();
///   runApp(MyApp());
/// }
/// ```
Future<void> setupServiceLocator() async {
  // ============================================================================
  // CORE UTILITIES
  // ============================================================================
  
  /// Logger Service
  /// Provides centralized logging for debugging and monitoring
  /// Lazy singleton: Created on first access
  getIt.registerLazySingleton<LoggerService>(
    () => LoggerServiceImpl(),
  );

  // ============================================================================
  // ROUTING
  // ============================================================================
  
  /// GoRouter instance
  /// Provides declarative routing and navigation throughout the app
  /// Singleton: Created immediately to ensure consistent routing
  getIt.registerSingleton<GoRouter>(
    AppRouter.router,
  );

  // ============================================================================
  // STORAGE SERVICES
  // ============================================================================
  
  // TODO: Register secure storage service (Step 9)
  // getIt.registerLazySingleton<SecureStorageService>(
  //   () => SecureStorageServiceImpl(),
  // );
  
  // TODO: Register local storage service (Step 9)
  // getIt.registerLazySingleton<LocalStorageService>(
  //   () => LocalStorageServiceImpl(),
  // );

  // ============================================================================
  // API & NETWORK
  // ============================================================================
  
  // TODO: Register Dio HTTP client (Step 10)
  // getIt.registerLazySingleton<Dio>(
  //   () => createDioInstance(),
  // );
  
  // TODO: Register API service (Step 10)
  // getIt.registerLazySingleton<ApiService>(
  //   () => ApiServiceImpl(getIt<Dio>()),
  // );

  // ============================================================================
  // ANALYTICS & MONITORING
  // ============================================================================
  
  // TODO: Register analytics service (Step 12)
  // getIt.registerLazySingleton<AnalyticsService>(
  //   () => AnalyticsServiceImpl(),
  // );
  
  // TODO: Register crashlytics service (Step 12)
  // getIt.registerLazySingleton<CrashlyticsService>(
  //   () => CrashlyticsServiceImpl(),
  // );

  // ============================================================================
  // REPOSITORIES
  // ============================================================================
  
  // TODO: Register auth repository (Step 14)
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     apiService: getIt<ApiService>(),
  //     secureStorage: getIt<SecureStorageService>(),
  //   ),
  // );

  // ============================================================================
  // USE CASES
  // ============================================================================
  
  // TODO: Register use cases as needed (Steps 15+)
  // Use registerFactory for use cases if they maintain state
  // Use registerLazySingleton for stateless use cases
}
