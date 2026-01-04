# Dependency Injection with GetIt

This directory contains the dependency injection configuration for the Flutter Skeleton App, using GetIt as the service locator.

## Overview

GetIt is a simple service locator for Dart and Flutter projects. It allows you to decouple your code by providing a centralized place to register and retrieve service instances.

## Files

- **`injection_container.dart`**: Main DI configuration with service registrations
- **`service_locator.dart`**: Type-safe helper getters for accessing services
- **`README.md`**: This documentation file

## Registration Types

GetIt supports three types of service registration:

### 1. Lazy Singleton (`registerLazySingleton`)

**When to use**: For services that should only have one instance but don't need to be initialized immediately.

**Characteristics**:
- Instance created on first access
- Same instance returned on subsequent calls
- Ideal for most services (API clients, repositories, storage)

**Example**:
```dart
getIt.registerLazySingleton<LoggerService>(
  () => LoggerServiceImpl(),
);
```

### 2. Singleton (`registerSingleton`)

**When to use**: For services that must be initialized immediately at app startup.

**Characteristics**:
- Instance created during registration
- Same instance returned on all calls
- Use for services required during app initialization

**Example**:
```dart
final config = AppConfig();
getIt.registerSingleton<AppConfig>(config);
```

### 3. Factory (`registerFactory`)

**When to use**: For objects that need a new instance each time they're requested.

**Characteristics**:
- New instance created on each access
- No instance reuse
- Useful for stateful objects or use cases

**Example**:
```dart
getIt.registerFactory<LoginUseCase>(
  () => LoginUseCase(
    authRepository: getIt<AuthRepository>(),
  ),
);
```

## Usage Patterns

### Accessing Services

**Recommended approach** (using service_locator.dart helpers):
```dart
import 'package:flutterskeleton1/config/di/service_locator.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Type-safe, easy to refactor
    logger.info('Building widget');
    return Container();
  }
}
```

**Direct approach** (less recommended):
```dart
import 'package:flutterskeleton1/config/di/injection_container.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // More verbose, harder to refactor
    final logger = getIt<LoggerService>();
    logger.info('Building widget');
    return Container();
  }
}
```

### Constructor Injection (Preferred)

For better testability, prefer constructor injection over service locator pattern:

```dart
class AuthRepository {
  final ApiService apiService;
  final SecureStorageService storage;

  AuthRepository({
    required this.apiService,
    required this.storage,
  });
}

// Registration
getIt.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(
    apiService: getIt<ApiService>(),
    storage: getIt<SecureStorageService>(),
  ),
);
```

## Service Lifecycle

### Initialization Order

Services are registered in `setupServiceLocator()` in dependency order:

1. **Core Utilities** (logger, config) - No dependencies
2. **Storage Services** - Depend on core utilities
3. **API & Network** - Depend on storage for tokens
4. **Analytics** - Depend on API for remote logging
5. **Repositories** - Depend on API and storage
6. **Use Cases** - Depend on repositories

### Hot Restart Behavior

GetIt automatically resets on hot restart in debug mode, ensuring clean state. All services are re-registered and re-initialized.

## Testing

### Mocking Services

For testing, you can replace real services with mocks:

```dart
void main() {
  setUpAll(() async {
    // Reset GetIt
    await getIt.reset();
    
    // Register mock services
    getIt.registerLazySingleton<LoggerService>(
      () => MockLoggerService(),
    );
    
    await setupServiceLocator();
  });
  
  test('my test', () {
    // Test code using mocked services
  });
}
```

### Integration Testing

For integration tests, use real services but configure them for test environment:

```dart
await setupServiceLocator();
// Services are configured based on environment (dev/test/prod)
```

## Best Practices

### ✅ Do

- **Register interfaces, not implementations**
  ```dart
  getIt.registerLazySingleton<LoggerService>(() => LoggerServiceImpl());
  ```
  
- **Use lazy initialization for most services**
  - Faster app startup
  - Services initialized only when needed

- **Group registrations logically**
  - Core utilities
  - Storage
  - API
  - Repositories
  - Use cases

- **Document each registration**
  - Why this service exists
  - Its dependencies
  - Registration type choice

- **Use constructor injection in business logic**
  - Better testability
  - Clearer dependencies
  - Easier to mock

### ❌ Don't

- **Don't access services during registration**
  ```dart
  // ❌ BAD
  getIt.registerLazySingleton<AuthRepository>(
    () {
      final api = getIt<ApiService>();
      api.configure(); // Service accessed too early!
      return AuthRepositoryImpl(api);
    },
  );
  ```

- **Don't create circular dependencies**
  ```dart
  // ❌ BAD - A depends on B, B depends on A
  getIt.registerLazySingleton<ServiceA>(() => ServiceA(getIt<ServiceB>()));
  getIt.registerLazySingleton<ServiceB>(() => ServiceB(getIt<ServiceA>()));
  ```

- **Don't register before GetIt is ready**
  ```dart
  // ❌ BAD
  void main() {
    setupServiceLocator(); // Not awaited!
    runApp(MyApp());
  }
  
  // ✅ GOOD
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupServiceLocator();
    runApp(MyApp());
  }
  ```

- **Don't use service locator in UI widgets unnecessarily**
  - Prefer passing dependencies through constructors
  - Use service locator only at high-level entry points

## Common Patterns

### Repository Pattern with DI

```dart
// 1. Define interface
abstract class AuthRepository {
  Future<User> login(String email, String password);
}

// 2. Implement
class AuthRepositoryImpl implements AuthRepository {
  final ApiService api;
  final SecureStorageService storage;
  
  AuthRepositoryImpl({required this.api, required this.storage});
  
  @override
  Future<User> login(String email, String password) async {
    final response = await api.login(email, password);
    await storage.saveToken(response.token);
    return response.user;
  }
}

// 3. Register
getIt.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(
    api: getIt<ApiService>(),
    storage: getIt<SecureStorageService>(),
  ),
);

// 4. Use
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access via helper
    final authRepo = getIt<AuthRepository>();
    // Use repository...
  }
}
```

### Use Case Pattern with DI

```dart
// 1. Define use case
class LoginUseCase {
  final AuthRepository repository;
  
  LoginUseCase({required this.repository});
  
  Future<Either<Failure, User>> call(String email, String password) async {
    try {
      final user = await repository.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(LoginFailure(e.toString()));
    }
  }
}

// 2. Register as factory (new instance per use)
getIt.registerFactory<LoginUseCase>(
  () => LoginUseCase(repository: getIt<AuthRepository>()),
);

// 3. Use in provider/controller
@riverpod
class LoginController extends _$LoginController {
  Future<void> login(String email, String password) async {
    final useCase = getIt<LoginUseCase>();
    final result = await useCase(email, password);
    // Handle result...
  }
}
```

## Error Handling

### Registration Errors

```dart
try {
  await setupServiceLocator();
} catch (e) {
  // Log error
  print('Failed to setup DI: $e');
  
  // Show error UI
  runApp(ErrorApp(error: e));
}
```

### Service Not Found

```dart
try {
  final service = getIt<MyService>();
} catch (e) {
  // Service not registered
  print('Service not found: $e');
  // Provide fallback or throw custom error
}
```

## Migration Guide

When adding new services:

1. **Create service interface and implementation**
   ```dart
   // lib/services/analytics/analytics_service.dart
   abstract class AnalyticsService {
     void logEvent(String name);
   }
   
   class AnalyticsServiceImpl implements AnalyticsService {
     @override
     void logEvent(String name) {
       // Implementation
     }
   }
   ```

2. **Register in injection_container.dart**
   ```dart
   getIt.registerLazySingleton<AnalyticsService>(
     () => AnalyticsServiceImpl(),
   );
   ```

3. **Add helper getter in service_locator.dart**
   ```dart
   AnalyticsService get analytics => getIt<AnalyticsService>();
   ```

4. **Use in app**
   ```dart
   import 'package:flutterskeleton1/config/di/service_locator.dart';
   
   analytics.logEvent('screen_view');
   ```

## References

- [GetIt Documentation](https://pub.dev/packages/get_it)
- [Dependency Injection in Flutter](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options#getit)
- [Clean Architecture with DI](https://resocoder.com/2019/09/30/flutter-bloc-architecture-clean-architecture/)

## Support

For questions or issues with dependency injection:
1. Check this documentation
2. Review existing service registrations
3. Consult the team lead
4. Refer to GetIt package documentation
