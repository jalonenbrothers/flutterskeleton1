# Flutter Skeleton App 🚀

A production-ready Flutter starter template with clean architecture, authentication, and essential features pre-configured. Built following Flutter best practices for rapid application development.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.24+-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 🎯 Purpose

This skeleton app serves as a solid foundation for building scalable Flutter applications. It's **not a kitchen sink** but rather a thoughtfully designed starter that includes commonly needed features while remaining clean and extendable.

**Perfect for:**
- Starting new Flutter projects quickly
- Learning Flutter best practices
- Building MVPs
- Enterprise application foundations
- Team project standardization

## ✨ What's Included

### Core Features
- ✅ **Clean Architecture** - Feature-first organization with clear separation of concerns
- ✅ **Authentication Flow** - Complete user registration, login, logout, and password reset
- ✅ **API Integration** - Pre-configured Dio client with interceptors and error handling
- ✅ **State Management** - Riverpod 2.x with code generation
- ✅ **Routing** - Declarative navigation using GoRouter with deep linking support
- ✅ **Secure Storage** - Token management with flutter_secure_storage
- ✅ **Environment Configuration** - Multiple environments (dev, staging, production)
- ✅ **Localization** - Multi-language support ready
- ✅ **Theme System** - Light and dark theme with Material 3
- ✅ **Error Handling** - Global error handling with user-friendly messages
- ✅ **Form Validation** - Reusable validators and form handling patterns

### Developer Experience
- 📦 **Dependency Injection** - GetIt service locator pre-configured
- 🧪 **Testing Setup** - Unit, widget, and integration test examples
- 📱 **Responsive Design** - Adaptive layouts for different screen sizes
- 🔍 **Code Generation** - Freezed, JSON serialization, and Riverpod generators
- 📊 **Analytics Ready** - Analytics service structure in place
- 🐛 **Crash Reporting Ready** - Crashlytics service structure prepared
- 🎨 **Consistent Styling** - Reusable widgets and design system
- 📝 **Linting** - Strict analysis options configured

### What's NOT Included (By Design)
- ❌ Database implementation (choose your own: Hive, Drift, SQLite, etc.)
- ❌ Specific backend service (Firebase, Supabase, custom API - bring your own)
- ❌ UI component library (use Material, Cupertino, or your own)
- ❌ Payment integration (add as needed)
- ❌ Push notifications (configure based on your service)
- ❌ Social authentication (implement when needed)

## 🏗️ Architecture

### Feature-First Clean Architecture

```
lib/
├── core/                  # Shared utilities and widgets
│   ├── constants/        
│   ├── theme/            
│   ├── utils/            
│   ├── extensions/       
│   ├── exceptions/       
│   └── widgets/          
├── config/               # App configuration
│   ├── env/             # Environment settings
│   ├── routes/          # Route definitions
│   └── di/              # Dependency injection
├── features/             # Feature modules
│   ├── auth/            # Authentication
│   │   ├── data/        # Models, repositories, data sources
│   │   ├── domain/      # Entities, use cases, abstractions
│   │   └── presentation/ # Screens, widgets, providers
│   ├── home/            
│   └── profile/         
├── services/             # External services
│   ├── api/             # API client configuration
│   ├── storage/         # Local & secure storage
│   ├── analytics/       # Analytics wrapper
│   └── crashlytics/     # Crash reporting wrapper
└── l10n/                # Localization files
```

Each feature is self-contained with its own data, domain, and presentation layers, making it easy to:
- Understand feature scope at a glance
- Work on features independently
- Remove or replace features easily
- Scale the application

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.24 or higher
- Dart 3.5 or higher
- iOS development: Xcode 15+ (for iOS deployment)
- Android development: Android Studio with SDK 34+

### Installation

1. **Clone this repository**
   ```bash
   git clone https://github.com/jalonenbrothers/flutter-skeleton-app.git
   cd flutter-skeleton-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure environments**
   
   Copy the example environment file:
   ```bash
   cp config/env/.env.example config/env/.env.dev
   ```
   
   Edit the `.env.dev` file with your configuration:
   ```env
   API_BASE_URL=https://api.yourapp.dev
   API_KEY=your_api_key_here
   ENABLE_LOGGING=true
   ```

5. **Run the app**
   ```bash
   # Development
   flutter run --flavor dev -t lib/main_dev.dart
   
   # Staging
   flutter run --flavor staging -t lib/main_staging.dart
   
   # Production
   flutter run --flavor prod -t lib/main_prod.dart
   ```

## 📱 Environments

### Development
- Hot reload enabled
- Detailed logging
- Debug UI helpers
- Development API endpoints

```bash
flutter run --flavor dev -t lib/main_dev.dart
```

### Staging
- Production-like environment
- Testing with staging APIs
- Performance profiling
- Beta testing

```bash
flutter run --flavor staging -t lib/main_staging.dart
```

### Production
- Optimized builds
- Minimal logging
- Production API endpoints
- Release configurations

```bash
flutter run --flavor prod -t lib/main_prod.dart
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/auth/login_test.dart

# Run integration tests
flutter test integration_test/
```

Test structure mirrors the lib structure:
```
test/
├── unit/              # Business logic tests
├── widget/            # Widget tests
└── integration/       # End-to-end tests
```

## 📦 Key Dependencies

### State Management & Architecture
- `flutter_riverpod` - Reactive state management
- `riverpod_annotation` - Code generation for providers
- `freezed` - Immutable classes and unions
- `go_router` - Declarative routing

### Networking & Data
- `dio` - HTTP client
- `retrofit` - Type-safe REST API client (optional)
- `json_serializable` - JSON serialization
- `flutter_secure_storage` - Secure token storage

### UI & UX
- `cached_network_image` - Image caching
- `shimmer` - Loading skeletons
- `flutter_svg` - SVG support

### Utilities
- `intl` - Internationalization and formatting
- `equatable` - Value equality
- `get_it` - Service locator

### Development
- `flutter_lints` - Linting rules
- `mockito` - Mocking for tests
- `build_runner` - Code generation

See [pubspec.yaml](pubspec.yaml) for complete list and versions.

## 🎨 Customization Guide

### 1. Branding
Update app colors and typography in:
- `lib/core/theme/app_theme.dart`
- `lib/core/constants/app_colors.dart`

### 2. API Configuration
Configure your API endpoints in:
- `lib/services/api/api_endpoints.dart`
- `config/env/.env.*` files

### 3. Authentication
Adapt the authentication flow in:
- `lib/features/auth/` directory
- Update `AuthRepository` for your backend
- Modify `AuthProvider` for state management

### 4. Add New Features
```bash
# Create feature structure
mkdir -p lib/features/new_feature/{data,domain,presentation}/{models,repositories,screens,widgets,providers}
```

Follow the existing pattern in `lib/features/auth/` as reference.

### 5. Localization
Add new language support:
1. Add to `l10n.yaml`
2. Create `app_[locale].arb` in `lib/l10n/`
3. Run `flutter gen-l10n`

## 📂 Project Structure Explained

### Core Directory
Contains app-wide utilities, constants, and reusable components that don't belong to any specific feature.

### Config Directory
Application configuration including routing, dependency injection, and environment-specific settings.

### Features Directory
Each feature is a self-contained module with its own:
- **Data Layer**: API models, repositories, data sources
- **Domain Layer**: Business entities, use cases, interfaces
- **Presentation Layer**: UI screens, widgets, state providers

### Services Directory
Wrappers for external services (API, storage, analytics) making them easy to swap or mock.

## 🔒 Security Best Practices

This skeleton implements:
- ✅ Secure token storage using flutter_secure_storage
- ✅ Environment variables for sensitive configuration
- ✅ HTTPS enforcement in API client
- ✅ Input validation on forms
- ✅ Proper error handling without exposing internals
- ✅ No secrets committed to version control

**Additional recommendations:**
- Implement certificate pinning for production
- Add biometric authentication for sensitive operations
- Use ProGuard/R8 for Android obfuscation
- Enable app attestation where supported

## 🤝 Contributing

Contributions are welcome! This is meant to be a community-driven starter template.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Follow the code style guidelines in `copilot-instructions.md`
4. Write tests for new features
5. Commit your changes (`git commit -m 'feat: add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

Please ensure:
- Code passes `flutter analyze`
- All tests pass
- New features include tests
- Documentation is updated

## 📋 Helpful Commands

```bash
# Code generation (after adding/modifying models or providers)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode during development
flutter pub run build_runner watch

# Clean and regenerate
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

# Format code
dart format .

# Analyze code
flutter analyze

# Check for outdated packages
flutter pub outdated

# Update dependencies
flutter pub upgrade

# Generate app icons (requires flutter_launcher_icons configured)
flutter pub run flutter_launcher_icons

# Generate splash screen (requires flutter_native_splash configured)
flutter pub run flutter_native_splash:create
```

## 🐛 Troubleshooting

### Build errors after cloning
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### iOS build issues
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter clean
flutter run
```

### Android build issues
- Ensure Android SDK is up to date
- Check `android/gradle.properties` for correct SDK versions
- Invalidate caches in Android Studio

### Code generation not working
```bash
# Delete generated files
find . -name "*.g.dart" -type f -delete
find . -name "*.freezed.dart" -type f -delete

# Regenerate
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📖 Documentation

- [Copilot Instructions](copilot-instructions.md) - Detailed development guidelines
- [Architecture Decision Records](docs/adr/) - Key architectural decisions
- [API Documentation](docs/api.md) - API integration guide
- [Testing Guide](docs/testing.md) - Comprehensive testing strategy

## 🗺️ Roadmap

- [ ] Add example database integration (Hive/Drift)
- [ ] Implement offline-first pattern example
- [ ] Add push notifications template
- [ ] Include social authentication examples
- [ ] CI/CD pipeline templates (GitHub Actions, GitLab CI)
- [ ] Performance monitoring setup
- [ ] A/B testing framework integration
- [ ] Advanced animations and micro-interactions

## 🙏 Acknowledgments

Built with inspiration from:
- Flutter official documentation and best practices
- Clean Architecture principles by Robert C. Martin
- Community feedback and contributions
- Production battle-tested patterns

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 💬 Support & Community

- 🐛 [Report a Bug](https://github.com/yourusername/flutter-skeleton-app/issues)
- 💡 [Request a Feature](https://github.com/yourusername/flutter-skeleton-app/issues)
- 💬 [Discussions](https://github.com/yourusername/flutter-skeleton-app/discussions)

---

**Made with ❤️ for the Flutter community**

If this skeleton helped you, please ⭐ star the repository and share it with others!
