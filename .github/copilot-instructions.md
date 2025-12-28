# Flutter Skeleton App - Copilot Instructions

## Project Overview
This is a production-ready Flutter starter template designed for rapid application development. It provides a clean, scalable architecture with authentication, API connectivity, and essential features pre-configured following Flutter best practices.

## Architecture Pattern
**Feature-First Clean Architecture with MVVM**
- Organize code by features, not by file types
- Each feature contains its own presentation, domain, and data layers
- Clear separation of concerns throughout the application

## Project Structure

```
lib/
├── core/
│   ├── constants/          # App-wide constants (colors, strings, dimensions)
│   ├── theme/             # Light/dark theme definitions, text styles
│   ├── utils/             # Helper functions and utilities
│   ├── extensions/        # Dart extensions for common types
│   ├── exceptions/        # Custom exception classes
│   └── widgets/           # Reusable UI components across features
├── config/
│   ├── env/               # Environment configurations (dev, staging, prod)
│   ├── routes/            # Centralized route definitions using GoRouter
│   └── di/                # Dependency injection setup (GetIt)
├── features/
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Models, repositories, data sources
│   │   ├── domain/        # Business logic, entities, use cases
│   │   └── presentation/  # UI screens, widgets, controllers
│   ├── home/              # Home/dashboard feature
│   └── profile/           # User profile feature
├── services/
│   ├── api/               # API client, interceptors, endpoints
│   ├── storage/           # Local storage (secure storage, cache)
│   ├── analytics/         # Analytics tracking
│   └── crashlytics/       # Crash reporting
└── l10n/                  # Internationalization files

assets/
├── images/
├── icons/
└── fonts/

test/
├── unit/
├── widget/
└── integration/
```

## Core Principles

### 1. State Management
- **Use Riverpod 2.x** for state management throughout the app
- Prefer code generation with `@riverpod` annotations
- Keep state immutable where possible
- Separate UI state from business logic

### 2. Routing & Navigation
- **Use go_router** for declarative routing
- Define all routes in `config/routes/app_router.dart`
- Implement route guards for protected routes
- Support deep linking from day one

### 3. API Communication
- **Use Dio** for HTTP requests
- Implement interceptors for:
  - Authentication token injection
  - Request/response logging (dev only)
  - Error handling and retry logic
  - Network connectivity checks
- Define API endpoints as constants
- Create typed response models with JSON serialization

### 4. Error Handling
- Create custom exception classes in `core/exceptions/`
- Implement global error handling
- Never expose raw errors to users
- Log errors appropriately with context

### 5. Authentication Flow
- JWT token-based authentication
- Store tokens securely using `flutter_secure_storage`
- Implement token refresh mechanism
- Handle authentication state globally
- Provide clear login, registration, and password reset flows

### 6. Data Layer
- Use repository pattern for data access
- Abstract data sources (remote API, local database, cache)
- Implement proper error handling at data layer
- Use freezed for immutable data classes
- Generate JSON serialization with `json_serializable`

## Code Style Guidelines

### Naming Conventions
- **Files**: `snake_case.dart`
- **Classes**: `UpperCamelCase`
- **Variables/functions**: `lowerCamelCase`
- **Constants**: `lowerCamelCase` or `UPPER_SNAKE_CASE` for compile-time constants
- **Private members**: Prefix with underscore `_privateMember`

### Widget Organization
- Keep widgets small and focused
- Extract complex widgets to separate files
- Use const constructors wherever possible
- Prefer composition over inheritance

### File Structure Within Features
```
feature_name/
├── data/
│   ├── models/           # JSON serializable models
│   ├── repositories/     # Repository implementations
│   └── datasources/      # Remote & local data sources
├── domain/
│   ├── entities/         # Business entities (plain Dart classes)
│   ├── repositories/     # Repository interfaces
│   └── usecases/         # Business logic use cases
└── presentation/
    ├── screens/          # Full screen widgets
    ├── widgets/          # Feature-specific reusable widgets
    └── providers/        # Riverpod providers for state management
```

## Essential Packages
**Already Included:**
- `riverpod` / `flutter_riverpod` - State management
- `go_router` - Navigation and routing
- `dio` - HTTP client
- `flutter_secure_storage` - Secure token storage
- `freezed` - Immutable classes and union types
- `json_serializable` - JSON serialization
- `flutter_localizations` - Internationalization
- `intl` - Date/number formatting

**Do NOT add without discussion:**
- Alternative state management solutions
- Navigation packages other than go_router
- HTTP clients other than Dio

## Testing Requirements

### Unit Tests
- Test all business logic (use cases, repositories)
- Test data transformations and serialization
- Mock external dependencies
- Use `mockito` or `mocktail` for mocking

### Widget Tests
- Test widget rendering and interactions
- Test state changes
- Use `WidgetTester` for simulating user interactions

### Integration Tests
- Test critical user flows (login, registration)
- Test API integration
- Use real or mocked backend

## Environment Configuration

### Build Flavors
Support three environments:
- **dev**: Development environment
- **staging**: Pre-production environment
- **prod**: Production environment

### Environment Variables
- Never commit `.env` files
- Use `.env.example` as template
- Store API URLs, keys, and feature flags in environment
- Access via environment configuration class

### Running Different Environments
```bash
flutter run --flavor dev -t lib/main_dev.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor prod -t lib/main_prod.dart
```

## Security Best Practices

### API Keys & Secrets
- Store in environment variables
- Never hardcode in source
- Use flutter_secure_storage for runtime secrets
- Implement certificate pinning for sensitive apps

### Authentication
- Use secure storage for tokens
- Implement token refresh before expiry
- Clear tokens on logout
- Handle session timeout gracefully

### Input Validation
- Validate all user inputs
- Sanitize data before API calls
- Use form validators consistently

## Performance Guidelines

### Image Handling
- Use `cached_network_image` for remote images
- Optimize asset images appropriately
- Use resolution-aware images
- Lazy load images in lists

### List Performance
- Use `ListView.builder` for dynamic lists
- Implement pagination for large datasets
- Use `const` constructors in list items

### Build Optimization
- Minimize widget rebuilds
- Use `const` wherever possible
- Profile before optimizing
- Use DevTools for performance analysis

## Localization

### Adding New Languages
1. Add language to `l10n.yaml`
2. Create `app_[language_code].arb` file
3. Run code generation: `flutter gen-l10n`
4. Use generated `AppLocalizations` class

### Using Translations
```dart
Text(AppLocalizations.of(context)!.welcomeMessage)
```

## Analytics & Monitoring

### Analytics Events
- Track screen views automatically
- Log user actions consistently
- Include relevant metadata
- Never log sensitive data

### Crash Reporting
- Initialize in main.dart
- Include user context (non-PII)
- Log custom exceptions
- Monitor performance metrics

## Git Workflow

### Branch Naming
- `feature/feature-name` - New features
- `bugfix/bug-description` - Bug fixes
- `hotfix/critical-fix` - Production hotfixes
- `refactor/component-name` - Code refactoring

### Commit Messages
Follow conventional commits:
- `feat: add user registration flow`
- `fix: resolve token refresh issue`
- `refactor: improve API error handling`
- `docs: update README with setup instructions`

### Pre-commit Checks
- Run `flutter analyze`
- Run `flutter test`
- Format code with `dart format .`

## Common Patterns

### API Call Pattern
```dart
// In repository
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final response = await apiClient.get('/users/$id');
    return Right(User.fromJson(response.data));
  } on DioException catch (e) {
    return Left(NetworkFailure(e.message));
  }
}
```

### Loading State Pattern
```dart
// In provider
@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<User> build() async {
    return await ref.watch(userRepositoryProvider).getCurrentUser();
  }
}
```

### Form Validation Pattern
```dart
final emailValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Invalid email format';
  }
  return null;
};
```

## Don'ts

### Never Do This
- ❌ Store sensitive data in SharedPreferences
- ❌ Use setState for complex state management
- ❌ Hardcode API endpoints or secrets
- ❌ Ignore error handling
- ❌ Build widgets in business logic
- ❌ Access context outside build method
- ❌ Use global mutable state
- ❌ Commit environment files
- ❌ Skip testing critical flows
- ❌ Use deprecated packages

### Always Do This
- ✅ Use dependency injection
- ✅ Write tests for business logic
- ✅ Handle loading and error states
- ✅ Validate user inputs
- ✅ Log errors with context
- ✅ Use const constructors
- ✅ Follow the established architecture
- ✅ Keep widgets focused and small
- ✅ Document complex logic
- ✅ Review code before committing

## CI/CD Integration

### Automated Checks
- Linting with `flutter analyze`
- Unit and widget tests
- Code coverage reporting
- Build verification for all flavors

### Deployment
- Use Fastlane for iOS/Android
- Automate version bumping
- Generate release notes
- Tag releases in Git

## Documentation

### Code Documentation
- Document public APIs with DartDoc comments
- Explain complex algorithms
- Add TODO comments for planned improvements
- Link to relevant design documents

### Project Documentation
- Keep README up to date
- Document setup procedures
- Maintain changelog
- Document API integration points

## When Starting New Features

1. **Plan the architecture** - Identify data, domain, and presentation needs
2. **Create folder structure** - Follow the feature-first pattern
3. **Define models** - Create data classes with proper serialization
4. **Implement repository** - Abstract data access
5. **Create providers** - Set up state management
6. **Build UI** - Create screens and widgets
7. **Write tests** - Cover critical paths
8. **Update documentation** - Document new features

## Questions & Support

When unsure about:
- Architecture decisions → Consult this document and team lead
- Package selection → Discuss in team review
- Breaking changes → Create RFC document
- Performance issues → Profile before optimizing

## Helpful Commands

```bash
# Generate code (freezed, json_serializable, riverpod)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode for development
flutter pub run build_runner watch --delete-conflicting-outputs

# Analyze code
flutter analyze

# Run tests
flutter test

# Format code
dart format .

# Check for outdated packages
flutter pub outdated

# Clean build
flutter clean && flutter pub get
```

## Remember
This skeleton is designed to be **extended**, not rewritten. Add features by following the established patterns. When in doubt, maintain consistency with existing code.
