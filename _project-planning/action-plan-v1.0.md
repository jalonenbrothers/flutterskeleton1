# Flutter Skeleton App - Master Action Plan v1.0

## Document Control
- **Version**: 1.0
- **Previous Version**: 0.1
- **Last Updated**: [Current Date]
- **Status**: Active Development Plan

## Overview
This document provides a comprehensive, step-by-step plan for building the Flutter Skeleton App from scratch. Each step is designed to be independently testable in the simulator, ensuring a working application at every stage of development.

## Core Principles
- ✅ Every step produces a runnable, testable application
- ✅ Progress is documented after completing each step
- ✅ Follow clean architecture and Flutter best practices
- ✅ Incremental development - no big bang integration
- ✅ No step should break existing functionality
- ✅ Feature-first organization maintained throughout
- ✅ Test early, test often

## Architecture Foundation
This plan implements:
- **Feature-First Clean Architecture** with clear layer separation
- **Riverpod 2.x** with code generation for state management
- **GoRouter** for declarative routing with deep linking
- **Dio** for HTTP communication with interceptors
- **GetIt** for dependency injection
- **Freezed** for immutable data classes
- **JSON Serialization** with code generation

## Project Phases

### Phase 1: Foundation & Core Setup (Steps 1-4)
**Goal**: Establish project foundation with working navigation and theme

**Key Deliverables**:
- Runnable Flutter project with proper structure
- Material 3 theme system (light/dark)
- Dependency injection configured
- Basic routing with GoRouter

### Phase 2: Infrastructure & Utilities (Steps 5-9)
**Goal**: Build reusable components and configure environments

**Key Deliverables**:
- Core widget library
- Extensions and validators
- Exception handling framework
- Environment configuration system
- Storage services

### Phase 3: API & Service Layer (Steps 10-13)
**Goal**: Implement API client and external service interfaces

**Key Deliverables**:
- Configured Dio client with interceptors
- API response models with serialization
- Analytics and crashlytics service structure
- Complete service layer ready for features

### Phase 4: Authentication Feature (Steps 14-19)
**Goal**: Complete authentication with clean architecture layers

**Key Deliverables**:
- Auth data layer (models, datasources, repositories)
- Auth domain layer (entities, use cases)
- Auth state management (Riverpod providers)
- Login and registration screens
- Password reset flow
- Route guards and auth flow integration

### Phase 5: Core Features (Steps 20-22)
**Goal**: Implement home and profile features

**Key Deliverables**:
- Home screen with navigation
- Profile screen with user information
- Profile editing capability
- Bottom navigation structure

### Phase 6: Finalization (Steps 23-26)
**Goal**: Production readiness with i18n, testing, and optimization

**Key Deliverables**:
- Internationalization (i18n) implementation
- Comprehensive test suite
- Environment-specific builds (dev, staging, prod)
- Production polish and optimizations

---

## Detailed Step-by-Step Plan

### **Step 1: Project Initialization & Folder Structure**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 30-45 minutes  
**Deliverable**: A runnable Flutter app with organized folder structure

#### Objectives
1. Create new Flutter project with proper configuration
2. Set up essential dependencies in pubspec.yaml
3. Create complete folder structure following feature-first architecture
4. Configure analysis options for code quality
5. Verify project runs successfully

#### Tasks

**1.1 Create Flutter Project**
- Initialize new Flutter project using Flutter CLI
- Verify Flutter SDK version (3.24+) and Dart version (3.5+)
- Remove default counter app code

**1.2 Configure pubspec.yaml**
Add dependencies in organized groups:

**State Management & Architecture**:
- flutter_riverpod: ^2.5.1
- riverpod_annotation: ^2.3.5
- hooks_riverpod: ^2.5.1

**Navigation**:
- go_router: ^14.0.0

**Networking & Data**:
- dio: ^5.4.0
- retrofit: ^4.1.0 (optional, mark as such)
- json_annotation: ^4.8.1
- freezed_annotation: ^2.4.1

**Storage**:
- flutter_secure_storage: ^9.0.0
- shared_preferences: ^2.2.2

**UI & UX**:
- cached_network_image: ^3.3.1
- shimmer: ^3.0.0
- flutter_svg: ^2.0.9

**Utilities**:
- intl: ^0.19.0
- equatable: ^2.0.5
- get_it: ^7.6.7
- logger: ^2.0.2

**Dev Dependencies**:
- build_runner: ^2.4.8
- freezed: ^2.4.7
- json_serializable: ^6.7.1
- riverpod_generator: ^2.3.11
- riverpod_lint: ^2.3.10
- flutter_lints: ^3.0.1
- mockito: ^5.4.4
- mocktail: ^1.0.3

**1.3 Create Folder Structure**
Create all directories as specified in architecture:
```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   ├── extensions/
│   ├── exceptions/
│   └── widgets/
├── config/
│   ├── env/
│   ├── routes/
│   └── di/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── datasources/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── widgets/
│   │       └── providers/
│   ├── home/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   ├── widgets/
│   │   │   └── providers/
│   └── profile/
│       ├── data/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── screens/
│           ├── widgets/
│           └── providers/
├── services/
│   ├── api/
│   │   ├── interceptors/
│   │   └── models/
│   ├── storage/
│   ├── analytics/
│   └── crashlytics/
└── l10n/

test/
├── unit/
│   ├── auth/
│   ├── profile/
│   └── utils/
├── widget/
│   ├── auth/
│   └── common/
└── integration/

assets/
├── images/
├── icons/
└── fonts/

config/
└── env/
```

**1.4 Create analysis_options.yaml**
Configure with:
- flutter_lints
- Strict analysis rules
- Custom lint rules for the project
- Line length limit (80-100 characters)
- Warnings as errors for CI/CD

**1.5 Create Minimal main.dart**
- Create simple MaterialApp
- Display "Flutter Skeleton App" text on home screen
- No functionality yet, just structure verification
- Wrap with ProviderScope for Riverpod

**1.6 Create README placeholders**
Add .gitkeep files in empty directories to preserve structure in git

#### Testing Checklist
- [ ] Project compiles without errors
- [ ] App runs on iOS simulator
- [ ] App runs on Android emulator
- [ ] Hot reload works correctly
- [ ] No analyzer warnings or errors
- [ ] All folders visible in project structure
- [ ] Dependencies download successfully

#### Common Issues & Solutions
- **Issue**: flutter_secure_storage build errors
  - **Solution**: Follow platform-specific setup in package documentation
- **Issue**: Dependency conflicts
  - **Solution**: Run `flutter pub upgrade --major-versions`
- **Issue**: Analysis options too strict
  - **Solution**: Start with flutter_lints defaults, customize incrementally

#### Success Criteria
✅ App displays "Flutter Skeleton App" text  
✅ No compilation errors  
✅ Folder structure matches plan  
✅ All dependencies resolved  
✅ Hot reload functional  

#### Next Step Preparation
Step 2 will use the constants folders to create theme system

#### Documentation Output
Create: `_project-planning/01-project-initialization-complete.md`

---

### **Step 2: Theme System Implementation**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Complete Material 3 theme with light/dark mode

#### Objectives
1. Define app color palette and design tokens
2. Implement Material 3 theme configuration
3. Create typography system with text styles
4. Set up theme mode switching capability
5. Create demo screen to visualize theme

#### Tasks

**2.1 Create Color Constants**
File: `lib/core/constants/app_colors.dart`
- Define primary, secondary, tertiary color schemes
- Define semantic colors (success, warning, error, info)
- Define neutral colors (backgrounds, surfaces)
- Separate light and dark mode variants
- Use Material 3 color system principles
- Include color documentation comments

**2.2 Create Dimension Constants**
File: `lib/core/constants/app_dimensions.dart`
- Define spacing scale (4px base: 4, 8, 12, 16, 24, 32, 48, 64)
- Define border radius values
- Define icon sizes
- Define button heights
- Define form field dimensions
- Define breakpoints for responsive design

**2.3 Create String Constants (Temporary)**
File: `lib/core/constants/app_strings.dart`
- Add temporary hardcoded strings
- Mark with TODO for i18n replacement
- Include common labels, buttons, errors
- Document this is temporary until Step 23

**2.4 Create Typography System**
File: `lib/core/theme/text_styles.dart`
- Define text styles hierarchy (heading1-6, body1-2, caption, button)
- Use consistent font family
- Define letter spacing and line heights
- Consider accessibility (minimum 14sp for body)
- Create const text style instances

**2.5 Create Theme Configuration**
File: `lib/core/theme/app_theme.dart`
- Create AppTheme class with static methods
- Implement `lightTheme()` returning ThemeData
- Implement `darkTheme()` returning ThemeData
- Configure Material 3 with `useMaterial3: true`
- Set color schemes from app_colors
- Configure component themes:
  - AppBarTheme
  - ButtonTheme
  - InputDecorationTheme
  - CardTheme
  - DialogTheme
  - BottomNavigationBarTheme
- Apply text styles from text_styles.dart

**2.6 Create Theme Provider**
File: `lib/core/theme/theme_provider.dart`
- Create Riverpod StateNotifier for theme mode
- Support ThemeMode.light, ThemeMode.dark, ThemeMode.system
- Implement toggle method
- Add persistence (preparation for shared_preferences in Step 9)

**2.7 Update main.dart**
- Integrate theme provider
- Set theme and darkTheme from AppTheme
- Set themeMode from provider
- Ensure ProviderScope wraps MaterialApp

**2.8 Create Theme Demo Screen**
File: `lib/core/theme/theme_demo_screen.dart`
- Display all color swatches
- Show text style examples
- Include theme mode toggle button
- Display spacing examples
- Show component examples (buttons, cards, etc.)
- Make this temporary for development only

**2.9 Update main.dart Home**
- Navigate to theme demo screen
- This validates theme is working

#### Testing Checklist
- [ ] App displays with custom theme colors
- [ ] Light theme applies correctly
- [ ] Dark theme applies correctly
- [ ] Can toggle between light and dark modes
- [ ] System theme mode works
- [ ] All text styles render properly
- [ ] Colors meet accessibility contrast requirements
- [ ] Theme persists across hot reload
- [ ] No theme-related errors in console

#### Design Considerations
- Use Material 3 color roles correctly
- Ensure 4.5:1 contrast ratio minimum (WCAG AA)
- Test theme on various screen sizes
- Consider color blindness accessibility
- Use semantic color naming (not literal colors)

#### Success Criteria
✅ Material 3 theme fully configured  
✅ Light and dark modes both functional  
✅ Theme toggle works smoothly  
✅ All color constants documented  
✅ Typography system complete  
✅ Demo screen shows all theme elements  

#### Next Step Preparation
Step 3 will use these themes in dependency injection setup

#### Documentation Output
Create: `_project-planning/02-theme-system-complete.md`

---

### **Step 3: Dependency Injection Setup**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 30-45 minutes  
**Deliverable**: GetIt service locator configured with example services

#### Objectives
1. Configure GetIt dependency injection container
2. Create service registration pattern
3. Implement lazy and singleton registrations
4. Create example service to validate DI
5. Document DI usage patterns

#### Tasks

**3.1 Create Injection Container**
File: `lib/config/di/injection_container.dart`
- Create GetIt singleton instance (`final getIt = GetIt.instance`)
- Create `Future<void> setupServiceLocator()` async function
- Document registration types:
  - `registerLazySingleton` for services
  - `registerSingleton` for immediate initialization
  - `registerFactory` for new instances each time
- Add clear section comments for service categories

**3.2 Create Logger Service (Example)**
File: `lib/core/utils/logger.dart`
- Create LoggerService abstract class (interface)
- Create LoggerServiceImpl implementation
- Use logger package for actual logging
- Implement methods: debug, info, warning, error
- Add log level configuration based on environment
- Register in DI container as example

**3.3 Register Core Services**
In injection_container.dart, register:
- LoggerService (lazy singleton)
- Add placeholder comments for future services:
  - API Client (Step 10)
  - Storage Services (Step 9)
  - Analytics Service (Step 12)
  - Auth Repository (Step 14)

**3.4 Initialize DI in main.dart**
- Call `await setupServiceLocator()` before `runApp()`
- Add loading indicator during initialization
- Handle initialization errors gracefully
- Wrap in try-catch with error display

**3.5 Create Service Locator Helper**
File: `lib/config/di/service_locator.dart`
- Create helper getters for common pattern
- Example: `LoggerService get logger => getIt<LoggerService>()`
- Document usage pattern
- Add type-safe accessors

**3.6 Update Theme Demo Screen**
- Retrieve LoggerService from GetIt
- Log theme changes
- Display service status on screen
- Demonstrate DI usage pattern

**3.7 Create DI Documentation**
File: `lib/config/di/README.md`
- Document registration patterns
- Explain when to use each type
- Provide usage examples
- Document service lifecycle

#### Testing Checklist
- [ ] App initializes successfully
- [ ] Logger service can be retrieved
- [ ] Logging outputs to console correctly
- [ ] Multiple retrievals return same instance (singleton)
- [ ] No DI errors or warnings
- [ ] Theme demo screen uses injected service
- [ ] Hot restart reinitializes DI properly
- [ ] Error handling works if service not registered

#### DI Best Practices
- Register interfaces, not implementations
- Use lazy initialization for heavy services
- Avoid circular dependencies
- Register in logical order
- Document all registrations
- Use factories for stateful objects

#### Common Pitfalls to Avoid
- ❌ Registering before GetIt is ready
- ❌ Accessing services during registration
- ❌ Forgetting async initialization
- ❌ Not handling registration errors
- ❌ Tight coupling to GetIt in business logic

#### Success Criteria
✅ GetIt configured and initialized  
✅ Logger service working and injectable  
✅ Clear registration pattern established  
✅ Documentation complete  
✅ Example usage demonstrated  
✅ No DI-related errors  

#### Next Step Preparation
Step 4 will register router in DI and use it for navigation

#### Documentation Output
Create: `_project-planning/03-dependency-injection-complete.md`

---

### **Step 4: Routing with GoRouter**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 60-90 minutes  
**Deliverable**: Complete navigation system with multiple routes

#### Objectives
1. Configure GoRouter for declarative navigation
2. Define route names and paths as constants
3. Create initial feature screens (splash, home, login)
4. Implement type-safe navigation
5. Set up navigation transitions
6. Integrate with dependency injection

#### Tasks

**4.1 Create Route Names**
File: `lib/config/routes/route_names.dart`
- Define class `Routes` with static const route names
- Define class `RoutePaths` with static const route paths
- Example structure:
  ```
  Routes.splash → RoutePaths.splash ('/splash')
  Routes.home → RoutePaths.home ('/home')
  Routes.login → RoutePaths.login ('/login')
  Routes.register → RoutePaths.register ('/register')
  Routes.profile → RoutePaths.profile ('/profile')
  Routes.editProfile → RoutePaths.editProfile ('/profile/edit')
  ```
- Document route hierarchy and relationships
- Include route parameter names as constants

**4.2 Create Splash Screen**
File: `lib/features/splash/presentation/screens/splash_screen.dart`
- Create simple splash screen with app logo/name
- Add loading indicator
- No business logic yet (will add in Step 18)
- Use theme colors and text styles from Step 2
- Display for 2 seconds then navigate

**4.3 Create Home Screen Placeholder**
File: `lib/features/home/presentation/screens/home_screen.dart`
- Create basic home screen with app bar
- Display "Home Screen" text
- Add buttons to navigate to other screens
- Add logout placeholder button
- Use custom widgets from core (will create in Step 5)

**4.4 Create Login Screen Placeholder**
File: `lib/features/auth/presentation/screens/login_screen.dart`
- Create basic login screen layout
- Add "Login Screen" text
- Add button to navigate to register
- Add button to navigate to home (bypass auth for now)
- Note: Full implementation in Step 16

**4.5 Create Register Screen Placeholder**
File: `lib/features/auth/presentation/screens/register_screen.dart`
- Create basic register screen layout
- Add "Register Screen" text
- Add button to navigate back to login
- Note: Full implementation in Step 17

**4.6 Configure GoRouter**
File: `lib/config/routes/app_router.dart`
- Create AppRouter class
- Create static GoRouter instance
- Configure routes:
  - Initial route: splash
  - Define all route configurations
  - Set route names from route_names.dart
- Configure page transitions (slide, fade, etc.)
- Add error page/route for undefined routes
- Add redirect logic placeholder (for Step 18 auth guards)

**4.7 Create Navigation Extension**
File: `lib/core/extensions/navigation_extensions.dart`
- Create BuildContext extension for type-safe navigation
- Add helper methods:
  - `pushNamed(String routeName)`
  - `pushReplacementNamed(String routeName)`
  - `pop()`
  - `go(String path)`
- Use GoRouter.of(context) internally
- Handle navigation errors

**4.8 Register Router in DI**
In `lib/config/di/injection_container.dart`:
- Register GoRouter as singleton
- Make accessible throughout app

**4.9 Update main.dart**
- Replace MaterialApp with MaterialApp.router
- Set routerConfig to AppRouter instance
- Remove home parameter
- Ensure theme configuration remains

**4.10 Update All Placeholder Screens**
- Add navigation buttons using extensions
- Test navigation between all screens
- Verify back button behavior
- Test deep link capability (document how)

#### Testing Checklist
- [ ] App starts on splash screen
- [ ] Splash automatically navigates to home
- [ ] Can navigate from home to login
- [ ] Can navigate from login to register
- [ ] Can navigate back from register to login
- [ ] Can navigate from home to profile (add route)
- [ ] Back button works correctly
- [ ] Page transitions animate smoothly
- [ ] Error route displays for unknown paths
- [ ] Hot reload preserves navigation state
- [ ] No navigation-related console errors
- [ ] Deep linking works (test with URL)

#### Route Configuration Best Practices
- Use named routes for type safety
- Configure page transitions consistently
- Handle navigation errors gracefully
- Support deep linking from start
- Use redirect for auth logic (Step 18)
- Keep route configuration centralized

#### Success Criteria
✅ GoRouter fully configured  
✅ All placeholder screens navigable  
✅ Type-safe navigation working  
✅ Transitions smooth and consistent  
✅ Error handling in place  
✅ Deep linking supported  
✅ Navigation extensions functional  

#### Next Step Preparation
Step 5 will create reusable widgets used in these screens

#### Documentation Output
Create: `_project-planning/04-routing-complete.md`

---

### **Step 5: Core Widgets Library**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 90-120 minutes  
**Deliverable**: Complete library of reusable UI components

#### Objectives
1. Create consistent, reusable widget components
2. Implement Material 3 design patterns
3. Build form input components with validation
4. Create loading and error state widgets
5. Establish widget usage patterns

#### Tasks

**5.1 Create Custom Button Widget**
File: `lib/core/widgets/custom_button.dart`
- Create enum ButtonType (primary, secondary, text, outlined)
- Create CustomButton stateless widget
- Accept parameters:
  - onPressed callback
  - text label
  - buttonType enum
  - loading state boolean
  - disabled state boolean
  - icon optional
  - full width option
- Implement each button type with theme colors
- Show loading indicator when loading
- Disable interaction when disabled or loading
- Add haptic feedback on press
- Use theme text styles

**5.2 Create Custom Text Field Widget**
File: `lib/core/widgets/custom_text_field.dart`
- Create CustomTextField stateless widget
- Accept parameters:
  - controller
  - label text
  - hint text
  - validator function
  - keyboard type
  - obscure text boolean
  - prefix icon
  - suffix icon
  - max length
  - enabled state
  - error text
  - helper text
  - onChanged callback
- Implement with InputDecoration from theme
- Support validation display
- Add clear button option
- Handle focus states properly

**5.3 Create Loading Indicator Widget**
File: `lib/core/widgets/loading_indicator.dart`
- Create LoadingIndicator stateless widget
- Accept parameters:
  - size (small, medium, large)
  - message optional text
  - color optional
- Implement with CircularProgressIndicator
- Add message text below if provided
- Center in available space
- Use theme colors

**5.4 Create Error View Widget**
File: `lib/core/widgets/error_view.dart`
- Create ErrorView stateless widget
- Accept parameters:
  - error message
  - retry callback optional
  - icon optional
- Display error icon (default to theme error color)
- Display error message with proper typography
- Show retry button if callback provided
- Center content vertically
- Make scrollable for long messages

**5.5 Create Empty State Widget**
File: `lib/core/widgets/empty_state.dart`
- Create EmptyState stateless widget
- Accept parameters:
  - title text
  - message text
  - icon optional
  - action button optional
- Display large icon
- Display title and message
- Show action button if provided
- Center content
- Use theme colors and text styles

**5.6 Create Custom App Bar Widget**
File: `lib/core/widgets/custom_app_bar.dart`
- Create CustomAppBar returning PreferredSizeWidget
- Accept parameters:
  - title text
  - actions list optional
  - show back button boolean
  - background color optional
- Implement with Material 3 AppBar
- Handle back button automatically
- Apply theme colors
- Support custom actions

**5.7 Create Avatar Widget**
File: `lib/core/widgets/avatar.dart`
- Create Avatar stateless widget
- Accept parameters:
  - image URL optional
  - initials text
  - size enum (small, medium, large)
  - background color optional
- Display network image if URL provided
- Display initials if no image
- Use circular shape
- Add loading state for network images
- Handle image load errors

**5.8 Create Bottom Sheet Helper**
File: `lib/core/widgets/bottom_sheet_helper.dart`
- Create static methods for showing bottom sheets
- showCustomBottomSheet method
- Accept child widget
- Configure default styling
- Add drag handle
- Set rounded top corners

**5.9 Create Dialog Helper**
File: `lib/core/widgets/dialog_helper.dart`
- Create static methods for common dialogs
- showConfirmDialog method
- showAlertDialog method
- showLoadingDialog method
- Accept title, message, actions
- Use theme styling
- Return Future<bool> for confirmation

**5.10 Create Widget Showcase Screen**
File: `lib/core/widgets/widget_showcase_screen.dart`
- Create screen displaying all widgets
- Show each widget in Card
- Add interactive examples
- Include code snippets (as commented text)
- Make it scrollable
- Add to router (temporary route)

**5.11 Update Router**
Add route for widget showcase (for development only)

**5.12 Update Placeholder Screens**
Update home, login, register screens to use custom widgets

#### Testing Checklist
- [ ] All custom widgets render correctly
- [ ] CustomButton responds to taps
- [ ] CustomButton shows loading state
- [ ] CustomTextField accepts input
- [ ] CustomTextField shows validation errors
- [ ] LoadingIndicator animates
- [ ] ErrorView displays messages correctly
- [ ] ErrorView retry callback works
- [ ] EmptyState centers properly
- [ ] CustomAppBar back button works
- [ ] Avatar displays images and initials
- [ ] Bottom sheet appears and dismisses
- [ ] Dialogs show and return values
- [ ] Showcase screen displays all widgets
- [ ] Widgets use theme colors consistently
- [ ] Widgets are accessible (TalkBack/VoiceOver)

#### Widget Design Principles
- Keep widgets composable
- Accept required parameters only
- Provide sensible defaults
- Use theme values, don't hardcode
- Support accessibility features
- Handle edge cases (null, empty, error)
- Make widgets testable

#### Success Criteria
✅ Complete widget library created  
✅ All widgets follow Material 3  
✅ Widgets use theme system  
✅ Showcase screen demonstrates usage  
✅ Widgets are reusable and composable  
✅ Accessibility supported  
✅ No hardcoded values  

#### Next Step Preparation
Step 6 will use these widgets in extensions and utilities

#### Documentation Output
Create: `_project-planning/05-core-widgets-complete.md`

---

### **Step 6: Extensions & Utilities**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Helper extensions and utility functions

#### Objectives
1. Create Dart extensions for common operations
2. Implement form validators
3. Build context-aware helpers
4. Create date and string utilities
5. Establish utility usage patterns

#### Tasks

**6.1 Create Context Extensions**
File: `lib/core/extensions/context_extensions.dart`
- Create BuildContext extension
- Add theme accessors:
  - `theme` → Theme.of(context)
  - `textTheme` → Theme.of(context).textTheme
  - `colorScheme` → Theme.of(context).colorScheme
- Add MediaQuery accessors:
  - `screenSize` → MediaQuery.of(context).size
  - `screenWidth` → screenSize.width
  - `screenHeight` → screenSize.height
  - `padding` → MediaQuery.of(context).padding
  - `isKeyboardOpen` → MediaQuery.of(context).viewInsets.bottom > 0
- Add responsive helpers:
  - `isMobile` → screenWidth < 600
  - `isTablet` → screenWidth >= 600 && < 900
  - `isDesktop` → screenWidth >= 900
- Add navigation shortcuts:
  - `pop<T>([T? result])`
  - `pushNamed(String routeName)`
  - `pushReplacementNamed(String routeName)`
- Add SnackBar helpers:
  - `showSnackBar(String message)`
  - `showErrorSnackBar(String message)`
  - `showSuccessSnackBar(String message)`
- Add localization shortcut:
  - `l10n` → AppLocalizations.of(context)! (prepare for Step 23)

**6.2 Create String Extensions**
File: `lib/core/extensions/string_extensions.dart`
- Create String extension
- Add validation helpers:
  - `isValidEmail` → bool (regex check)
  - `isValidPassword` → bool (min length, complexity)
  - `isValidPhone` → bool (basic format check)
- Add formatting helpers:
  - `capitalize` → First letter uppercase
  - `capitalizeWords` → All words capitalized
  - `toTitleCase` → Title case conversion
  - `truncate(int maxLength)` → Truncate with ellipsis
  - `removeWhitespace` → Remove all whitespace
- Add parsing helpers:
  - `toInt()` → int? (safe parsing)
  - `toDouble()` → double? (safe parsing)
  - `toBool()` → bool (handle 'true', '1', 'yes')
- Add null/empty checks:
  - `isNullOrEmpty` → bool
  - `isNotNullOrEmpty` → bool

**6.3 Create Date Extensions**
File: `lib/core/extensions/date_extensions.dart`
- Create DateTime extension
- Add formatting helpers:
  - `toFormattedDate()` → 'Jan 1, 2024'
  - `toFormattedTime()` → '12:30 PM'
  - `toFormattedDateTime()` → 'Jan 1, 2024 at 12:30 PM'
  - `toRelativeTime()` → '2 hours ago', 'Just now', etc.
  - `toIso8601String()` → ISO format for API
- Add comparison helpers:
  - `isToday` → bool
  - `isYesterday` → bool
  - `isTomorrow` → bool
  - `isThisWeek` → bool
  - `isThisMonth` → bool
  - `isThisYear` → bool
- Add calculation helpers:
  - `add Duration` → DateTime
  - `subtract Duration` → DateTime
  - `difference(DateTime other)` → Duration

**6.4 Create Num Extensions**
File: `lib/core/extensions/num_extensions.dart`
- Create num extension (works for int and double)
- Add formatting helpers:
  - `toCurrency([String symbol])` → '\$10.00'
  - `toPercentage([int decimals])` → '10.5%'
  - `toCompact()` → '1.5K', '2.3M' for large numbers
- Add utility helpers:
  - `toRadians()` → num * (pi / 180)
  - `toDegrees()` → num * (180 / pi)

**6.5 Create Validators**
File: `lib/core/utils/validators.dart`
- Create Validators static class
- Implement validation functions returning String? (for form validation):
  - `required(String? value, [String fieldName])` → error or null
  - `email(String? value)` → validate email format
  - `password(String? value)` → min 8 chars, uppercase, number, special
  - `confirmPassword(String? value, String? password)` → match check
  - `phone(String? value)` → basic phone format
  - `minLength(String? value, int min)` → minimum length check
  - `maxLength(String? value, int max)` → maximum length check
  - `numeric(String? value)` → only numbers
  - `alphanumeric(String? value)` → letters and numbers only
- Make validators composable:
  - `combine(List<String? Function(String?)> validators)` → run all
- Add customizable error messages

**6.6 Enhance Logger Service**
File: `lib/core/utils/logger.dart` (update from Step 3)
- Add log levels (verbose, debug, info, warning, error, fatal)
- Add pretty printing for objects
- Add stack trace logging for errors
- Add log filtering based on environment
- Add log file writing capability (optional)
- Integrate with crashlytics service (Step 12)

**6.7 Create Formatters Utility**
File: `lib/core/utils/formatters.dart`
- Create Formatters static class
- Add text input formatters:
  - `phoneFormatter` → TextInputFormatter for phones
  - `creditCardFormatter` → TextInputFormatter for cards
  - `dateFormatter` → TextInputFormatter for dates
  - `currencyFormatter` → TextInputFormatter for money
- Add string formatters:
  - `formatCurrency(double amount, [String symbol])`
  - `formatFileSize(int bytes)` → '1.5 MB'
  - `formatDuration(Duration duration)` → '2h 30m'

**6.8 Create Device Info Utility**
File: `lib/core/utils/device_info.dart`
- Create DeviceInfo static class
- Add platform checks:
  - `isIOS` → Platform.isIOS
  - `isAndroid` → Platform.isAndroid
  - `isWeb` → kIsWeb
- Add device type helpers:
  - `deviceType(BuildContext context)` → mobile, tablet, desktop
- Add capability checks:
  - `hasCamera` → bool (use device_info_plus if needed)
  - `hasBiometrics` → bool (prepare for future)

**6.9 Create Extensions Demo Screen**
File: `lib/core/extensions/extensions_demo_screen.dart`
- Create screen demonstrating all extensions
- Show context extensions in action
- Display string extension examples
- Show date formatting examples
- Test validators interactively
- Display device info
- Add to router for testing

**6.10 Update Widget Showcase**
Update widget showcase screen to use new extensions

#### Testing Checklist
- [ ] Context extensions work in widgets
- [ ] Theme accessors return correct values
- [ ] MediaQuery shortcuts work
- [ ] Navigation extensions function correctly
- [ ] SnackBar helpers display properly
- [ ] String extensions validate correctly
- [ ] Email validation regex accurate
- [ ] Password validation enforces rules
- [ ] Date extensions format properly
- [ ] Relative time displays correctly
- [ ] Validators return proper error messages
- [ ] Logger logs at different levels
- [ ] Formatters format correctly
- [ ] Device info returns accurate data
- [ ] Extensions demo screen works
- [ ] No extension-related errors

#### Extension Best Practices
- Keep extensions focused and cohesive
- Avoid side effects in extensions
- Document extension usage
- Handle null cases gracefully
- Don't extend third-party classes excessively
- Test extensions thoroughly

#### Success Criteria
✅ All extensions created and working  
✅ Validators functional and tested  
✅ Utilities provide useful helpers  
✅ Demo screen demonstrates usage  
✅ Extensions improve code readability  
✅ No namespace conflicts  

#### Next Step Preparation
Step 7 will use these validators in exception handling

#### Documentation Output
Create: `_project-planning/06-extensions-utilities-complete.md`

---

### **Step 7: Exception Handling System**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Custom exception hierarchy and error handling framework

#### Objectives
1. Create custom exception classes
2. Implement error mapping strategies
3. Build user-friendly error messages
4. Create error logging system
5. Establish error handling patterns

#### Tasks

**7.1 Create Base App Exception**
File: `lib/core/exceptions/app_exception.dart`
- Create abstract class AppException implements Exception
- Add properties:
  - message (String)
  - code (String optional)
  - details (dynamic optional)
  - stackTrace (StackTrace optional)
- Override toString() for logging
- Create toUserMessage() for display
- Add fromException factory for wrapping

**7.2 Create Network Exception**
File: `lib/core/exceptions/network_exception.dart`
- Extend AppException
- Add specific network error types:
  - NoInternetException
  - TimeoutException
  - ServerException (5xx errors)
  - ClientException (4xx errors)
  - UnauthorizedException (401)
  - ForbiddenException (403)
  - NotFoundException (404)
- Add statusCode property
- Map DioException to network exceptions
- Provide user-friendly messages

**7.3 Create Auth Exception**
File: `lib/core/exceptions/auth_exception.dart`
- Extend AppException
- Add auth-specific errors:
  - InvalidCredentialsException
  - UserNotFoundException
  - EmailAlreadyExistsException
  - WeakPasswordException
  - SessionExpiredException
  - TokenExpiredException
- Add authErrorCode property
- Map API auth errors
- Provide actionable user messages

**7.4 Create Validation Exception**
File: `lib/core/exceptions/validation_exception.dart`
- Extend AppException
- Add field-level validation errors:
  - InvalidEmailException
  - InvalidPhoneException
  - InvalidInputException
  - RequiredFieldException
- Add fieldName property
- Add errors Map<String, String> for multiple fields
- Provide field-specific error messages

**7.5 Create Storage Exception**
File: `lib/core/exceptions/storage_exception.dart`
- Extend AppException
- Add storage-specific errors:
  - ReadException
  - WriteException
  - DeleteException
  - EncryptionException
  - StorageFullException
- Map platform storage errors
- Provide recovery suggestions

**7.6 Create Cache Exception**
File: `lib/core/exceptions/cache_exception.dart`
- Extend AppException
- Add cache-specific errors:
  - CacheNotFoundException
  - CacheExpiredException
  - CacheCorruptedException
- Used for local data caching

**7.7 Create Failure Class**
File: `lib/core/utils/failure.dart`
- Create abstract class Failure (for domain layer)
- Create concrete failure classes:
  - ServerFailure
  - NetworkFailure
  - CacheFailure
  - ValidationFailure
  - AuthFailure
- Map exceptions to failures
- Provide user messages
- Note: Alternative to Either<Failure, T> pattern

**7.8 Create Error Handler Utility**
File: `lib/core/utils/error_handler.dart`
- Create ErrorHandler static class
- Implement handleError method:
  - Accept Exception and context
  - Map to appropriate AppException
  - Log error with logger
  - Report to crashlytics (Step 12)
  - Show user message via SnackBar
- Implement handleFailure method (for domain failures)
- Create getErrorMessage(dynamic error) → String
- Add error code mapping
- Support error callbacks

**7.9 Create Global Error Widget**
File: `lib/core/widgets/error_boundary.dart`
- Create ErrorBoundary widget (for uncaught errors)
- Wrap app in error boundary
- Display friendly error screen
- Provide restart/recovery options
- Log error details
- Show different UI for dev vs prod

**7.10 Integrate Error Handling**
Update main.dart:
- Add error widget builder
- Wrap app with ErrorBoundary
- Configure error handling
- Add uncaught error handlers:
  - FlutterError.onError
  - PlatformDispatcher.instance.onError

**7.11 Create Exception Demo Screen**
File: `lib/core/exceptions/exception_demo_screen.dart`
- Create screen to test error handling
- Add buttons to throw different exceptions
- Demonstrate error handling in action
- Show error messages and recovery
- Add to router for testing

**7.12 Update Logger Integration**
Update logger to handle exceptions:
- Log exception details
- Include stack traces
- Log to appropriate level
- Prepare for crashlytics

#### Testing Checklist
- [ ] Can throw and catch AppException
- [ ] Network exceptions map from Dio errors
- [ ] Auth exceptions have correct messages
- [ ] Validation exceptions work with forms
- [ ] Storage exceptions handle file errors
- [ ] Error handler logs appropriately
- [ ] User messages are friendly
- [ ] Error widget displays on crash
- [ ] Exception demo triggers errors
- [ ] Stack traces captured correctly
- [ ] Error recovery works
- [ ] No unhandled exceptions

#### Error Handling Best Practices
- Never expose internal errors to users
- Always log full error details
- Provide actionable error messages
- Handle errors at appropriate layer
- Map technical errors to user errors
- Test error scenarios thoroughly
- Document error codes
- Support error recovery

#### Success Criteria
✅ Complete exception hierarchy  
✅ Error mapping functional  
✅ User-friendly messages  
✅ Global error handling working  
✅ Error logging integrated  
✅ Demo screen functional  
✅ No unhandled exceptions  

#### Next Step Preparation
Step 8 will use these exceptions in environment configuration

#### Documentation Output
Create: `_project-planning/07-exception-handling-complete.md`

---

### **Step 8: Environment Configuration**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Multi-environment setup with configuration files

#### Objectives
1. Create environment configuration system
2. Set up dev, staging, and production environments
3. Configure environment variables
4. Create environment-specific entry points
5. Add environment indicators for debugging

#### Tasks

**8.1 Create Environment Enum**
File: `lib/config/env/environment.dart`
- Create enum Environment { dev, staging, prod }
- Add extension with getters:
  - name → String
  - isDevelopment → bool
  - isStaging → bool
  - isProduction → bool

**8.2 Create Environment Config Class**
File: `lib/config/env/environment_config.dart`
- Create class EnvironmentConfig
- Add properties:
  - environment (Environment)
  - apiBaseUrl (String)
  - apiKey (String optional)
  - enableLogging (bool)
  - enableCrashlytics (bool)
  - enableAnalytics (bool)
  - apiTimeout (Duration)
  - socketUrl (String optional for websockets)
  - assetsBaseUrl (String optional for CDN)
- Add getters for feature flags
- Make properties immutable (final)
- Add copyWith method

**8.3 Create Environment Manager**
File: `lib/config/env/environment_manager.dart`
- Create singleton EnvironmentManager
- Store current EnvironmentConfig
- Add initialization method:
  - `initialize(EnvironmentConfig config)`
- Add static getter for current config:
  - `static EnvironmentConfig get config`
- Add validation for required fields
- Throw exception if not initialized

**8.4 Create .env Example File**
File: `config/env/.env.example`
```
API_BASE_URL=https://api.example.com
API_KEY=your_api_key_here
ENABLE_LOGGING=true
ENABLE_CRASHLYTICS=false
ENABLE_ANALYTICS=false
API_TIMEOUT_SECONDS=30
```
- Document all environment variables
- Add comments for clarity
- Note: This is template only

**8.5 Create Dev Configuration**
File: `config/env/.env.dev` (gitignored)
```
API_BASE_URL=https://api-dev.example.com
API_KEY=dev_key
ENABLE_LOGGING=true
ENABLE_CRASHLYTICS=false
ENABLE_ANALYTICS=false
API_TIMEOUT_SECONDS=60
```
- Development API endpoints
- Extended timeouts for debugging
- Logging enabled
- Crashlytics disabled

**8.6 Create Staging Configuration**
File: `config/env/.env.staging` (gitignored)
```
API_BASE_URL=https://api-staging.example.com
API_KEY=staging_key
ENABLE_LOGGING=true
ENABLE_CRASHLYTICS=true
ENABLE_ANALYTICS=true
API_TIMEOUT_SECONDS=30
```
- Staging API endpoints
- All monitoring enabled
- Production-like settings

**8.7 Create Production Configuration**
File: `config/env/.env.prod` (gitignored)
```
API_BASE_URL=https://api.example.com
API_KEY=prod_key
ENABLE_LOGGING=false
ENABLE_CRASHLYTICS=true
ENABLE_ANALYTICS=true
API_TIMEOUT_SECONDS=30
```
- Production API endpoints
- Minimal logging
- All monitoring enabled
- Optimized settings

**8.8 Create Dev Entry Point**
File: `lib/main_dev.dart`
- Import main.dart
- Create main() function
- Initialize EnvironmentManager with dev config
- Set Environment.dev
- Call sharedMain() from main.dart

**8.9 Create Staging Entry Point**
File: `lib/main_staging.dart`
- Same as dev but with staging configuration
- Set Environment.staging

**8.10 Create Production Entry Point**
File: `lib/main_prod.dart`
- Same as dev but with production configuration
- Set Environment.prod

**8.11 Update Main Entry Point**
File: `lib/main.dart`
- Rename main() to sharedMain()
- Accept optional EnvironmentConfig
- Use EnvironmentConfig throughout app
- Add environment validation
- Configure logger based on environment
- Don't make this a direct entry point

**8.12 Create Environment Indicator Widget**
File: `lib/config/env/environment_indicator.dart`
- Create banner widget showing current environment
- Display in development and staging only
- Show environment name and API base URL
- Position in top corner
- Make dismissible
- Add color coding (dev=blue, staging=orange)

**8.13 Wrap App with Environment Indicator**
In main.dart:
- Wrap MaterialApp with environment indicator
- Only show in non-production
- Make it obvious which environment is running

**8.14 Update .gitignore**
Add to .gitignore:
```
config/env/.env.dev
config/env/.env.staging
config/env/.env.prod
```
Keep .env.example in repo

**8.15 Configure Android Flavors**
File: `android/app/build.gradle`
- Add product flavors:
  - dev (applicationIdSuffix ".dev")
  - staging (applicationIdSuffix ".staging")
  - prod (no suffix)
- Set different app names per flavor
- Configure signing configs
- Document in separate guide

**8.16 Document iOS Scheme Setup**
Create: `docs/ios-scheme-setup.md`
- Document how to create schemes in Xcode
- Create Dev scheme → runs main_dev.dart
- Create Staging scheme → runs main_staging.dart
- Create Prod scheme → runs main_prod.dart
- Include screenshots
- Note: iOS configuration done in Xcode

**8.17 Update README with Environment Commands**
Update README.md with:
```bash
# Development
flutter run -t lib/main_dev.dart

# Staging
flutter run -t lib/main_staging.dart

# Production
flutter run -t lib/main_prod.dart
```

**8.18 Create Environment Demo Screen**
Update existing demo screen to:
- Display current environment
- Show all configuration values (mask sensitive data)
- Show environment indicator
- Test environment switching (restart required)

#### Testing Checklist
- [ ] Can run dev environment
- [ ] Can run staging environment
- [ ] Can run prod environment
- [ ] Environment indicator shows in dev/staging
- [ ] Environment indicator hidden in production
- [ ] Correct API URLs used per environment
- [ ] Logging enabled/disabled correctly
- [ ] Different app names per environment (Android)
- [ ] Can install all environments simultaneously
- [ ] Environment persists across restarts
- [ ] Configuration values accessible throughout app
- [ ] No environment variables committed to git

#### Environment Best Practices
- Never commit environment files with secrets
- Use different app IDs per environment
- Test each environment regularly
- Document environment setup clearly
- Validate configuration on startup
- Use environment-specific resources
- Monitor different environments separately

#### Success Criteria
✅ Three environments configured  
✅ Environment-specific entry points  
✅ Configuration accessible app-wide  
✅ Environment indicator functional  
✅ Android flavors configured  
✅ iOS setup documented  
✅ No secrets in version control  
✅ Can run all environments  

#### Next Step Preparation
Step 9 will use environment config in storage services

#### Documentation Output
Create: `_project-planning/08-environment-config-complete.md`

---

### **Step 9: Storage Service Implementation**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Local and secure storage services

#### Objectives
1. Implement secure storage for sensitive data
2. Create local storage for app preferences
3. Abstract storage behind interfaces
4. Integrate with dependency injection
5. Handle storage errors gracefully

#### Tasks

**9.1 Create Storage Service Interface**
File: `lib/services/storage/storage_service.dart`
- Create abstract class StorageService
- Define methods:
  - `Future<void> write(String key, String value)`
  - `Future<String?> read(String key)`
  - `Future<void> delete(String key)`
  - `Future<void> deleteAll()`
  - `Future<bool> containsKey(String key)`
  - `Future<Map<String, String>> readAll()`
- Document expected behavior
- Note: Interface for both secure and local storage

**9.2 Create Secure Storage Service**
File: `lib/services/storage/secure_storage_service.dart`
- Implement StorageService interface
- Use flutter_secure_storage package
- Create SecureStorageService class
- Add specific methods for common use cases:
  - `saveToken(String token)` → write('auth_token', token)
  - `getToken()` → read('auth_token')
  - `deleteToken()` → delete('auth_token')
  - `saveRefreshToken(String token)`
  - `getRefreshToken()`
  - `saveUserData(Map<String, dynamic> userData)` (JSON encoded)
  - `getUserData()` → Map<String, dynamic>?
- Handle encryption/decryption internally
- Handle platform-specific storage (Keychain/Keystore)
- Wrap operations in try-catch, throw StorageException
- Log storage operations (without exposing values)

**9.3 Create Local Storage Service**
File: `lib/services/storage/local_storage_service.dart`
- Implement StorageService interface
- Use shared_preferences package
- Create LocalStorageService class
- Add typed read methods:
  - `Future<String?> readString(String key)`
  - `Future<int?> readInt(String key)`
  - `Future<bool?> readBool(String key)`
  - `Future<double?> readDouble(String key)`
  - `Future<List<String>?> readStringList(String key)`
- Add typed write methods:
  - `Future<void> writeString(String key, String value)`
  - `Future<void> writeInt(String key, int value)`
  - `Future<void> writeBool(String key, bool value)`
  - `Future<void> writeDouble(String key, double value)`
  - `Future<void> writeStringList(String key, List<String> value)`
- Add specific methods for settings:
  - `saveThemeMode(ThemeMode mode)`
  - `getThemeMode()` → ThemeMode
  - `saveLanguage(String languageCode)`
  - `getLanguage()` → String?
  - `saveOnboardingCompleted(bool completed)`
  - `isOnboardingCompleted()` → bool
- Handle SharedPreferences initialization
- Wrap operations in try-catch, throw StorageException

**9.4 Create Storage Keys Constants**
File: `lib/services/storage/storage_keys.dart`
- Create class StorageKeys
- Define all storage keys as static const:
  ```
  static const authToken = 'auth_token';
  static const refreshToken = 'refresh_token';
  static const userData = 'user_data';
  static const themeMode = 'theme_mode';
  static const languageCode = 'language_code';
  static const onboardingCompleted = 'onboarding_completed';
  ```
- Use these throughout app instead of hardcoded strings
- Add documentation for each key

**9.5 Create Cache Service**
File: `lib/services/storage/cache_service.dart`
- Create CacheService class
- Use in-memory cache (Map) with TTL support
- Add methods:
  - `void put(String key, dynamic value, [Duration ttl])`
  - `T? get<T>(String key)`
  - `void remove(String key)`
  - `void clear()`
  - `bool containsKey(String key)`
  - `bool isExpired(String key)`
- Store cache entry with timestamp
- Check expiry on get
- Auto-remove expired entries
- Used for temporary API response caching

**9.6 Update Theme Provider**
File: `lib/core/theme/theme_provider.dart`
- Inject LocalStorageService
- Save theme mode to storage
- Load theme mode from storage on init
- Persist theme selection

**9.7 Register Storage Services in DI**
File: `lib/config/di/injection_container.dart`
- Register SecureStorageService as singleton
- Register LocalStorageService as singleton
- Register CacheService as singleton
- Add to "Storage Services" section
- Initialize storage services on app start

**9.8 Create Storage Demo Screen**
File: `lib/services/storage/storage_demo_screen.dart`
- Create screen to test storage operations
- Add text fields for key-value input
- Add buttons to:
  - Write to secure storage
  - Read from secure storage
  - Delete from secure storage
  - Write to local storage
  - Read from local storage
  - Clear all storage
- Display storage contents (secure storage masked)
- Show cache operations
- Test token storage
- Test user data storage
- Add to router for testing

**9.9 Create Storage Migration Utility**
File: `lib/services/storage/storage_migration.dart`
- Create StorageMigration class
- Handle storage version upgrades
- Migrate data between storage keys
- Clear old/deprecated keys
- Log migration steps
- Call during app initialization

**9.10 Update Error Handler**
Integrate storage exceptions into error handler:
- Handle StorageException specifically
- Provide user-friendly messages
- Log storage errors appropriately

**9.11 Add Storage Tests**
Create: `test/unit/storage/storage_service_test.dart`
- Mock secure storage
- Mock shared preferences
- Test read/write operations
- Test error handling
- Test cache expiry
- Verify data persistence

#### Testing Checklist
- [ ] Can write to secure storage
- [ ] Can read from secure storage
- [ ] Secure storage persists across restarts
- [ ] Can delete from secure storage
- [ ] Can write to local storage
- [ ] Can read from local storage
- [ ] Local storage persists across restarts
- [ ] Can clear all storage
- [ ] Theme mode saves to storage
- [ ] Theme mode loads on app start
- [ ] Cache stores and retrieves data
- [ ] Cache entries expire correctly
- [ ] Token storage works
- [ ] User data serialization works
- [ ] Storage errors handled gracefully
- [ ] Storage demo screen functional
- [ ] No sensitive data logged

#### Storage Best Practices
- Use secure storage for tokens and secrets
- Use local storage for preferences
- Use in-memory cache for temporary data
- Never log sensitive values
- Handle storage errors gracefully
- Validate data after reading
- Encrypt sensitive data
- Clear storage on logout
- Test storage limits
- Handle migration carefully

#### Platform Considerations
**iOS**:
- Secure storage uses Keychain
- Data persists across app reinstalls
- May require app group configuration

**Android**:
- Secure storage uses Keystore
- Data cleared on app uninstall
- May require additional permissions

#### Success Criteria
✅ Secure storage functional  
✅ Local storage functional  
✅ Cache service working  
✅ Storage persists correctly  
✅ Theme persistence working  
✅ Token storage secure  
✅ Demo screen demonstrates all features  
✅ Error handling robust  

#### Next Step Preparation
Step 10 will use storage services in API client for token management

#### Documentation Output
Create: `_project-planning/09-storage-service-complete.md`

---

### **Step 10: API Client Setup**
**Phase**: API & Service Layer  
**Estimated Time**: 90-120 minutes  
**Deliverable**: Configured Dio HTTP client with interceptors

#### Objectives
1. Configure Dio for API communication
2. Implement request/response interceptors
3. Create auth token injection mechanism
4. Set up error handling and retry logic
5. Configure API endpoints

#### Tasks

**10.1 Create API Endpoints Constants**
File: `lib/services/api/api_endpoints.dart`
- Create class ApiEndpoints
- Define base paths:
  ```
  static const auth = '/auth';
  static const users = '/users';
  static const profile = '/profile';
  ```
- Define specific endpoints:
  ```
  static const login = '$auth/login';
  static const register = '$auth/register';
  static const logout = '$auth/logout';
  static const refreshToken = '$auth/refresh';
  static const resetPassword = '$auth/reset-password';
  static const me = '$users/me';
  static const updateProfile = '$profile/update';
  ```
- Add query parameter constants
- Document endpoint usage
- Group by feature

**10.2 Create API Client**
File: `lib/services/api/api_client.dart`
- Create ApiClient class
- Initialize Dio instance
- Configure base options:
  - baseUrl from EnvironmentConfig
  - connectTimeout from config
  - receiveTimeout from config
  - sendTimeout from config
  - responseType: ResponseType.json
  - contentType: application/json
- Add headers:
  - Accept: application/json
  - Content-Type: application/json
- Create methods wrapping Dio:
  - `Future<Response> get(String path, {params, options})`
  - `Future<Response> post(String path, {data, params, options})`
  - `Future<Response> put(String path, {data, params, options})`
  - `Future<Response> patch(String path, {data, params, options})`
  - `Future<Response> delete(String path, {data, params, options})`
- Add generic request method
- Handle DioException in all methods
- Map to NetworkException (from Step 7)

**10.3 Create Auth Interceptor**
File: `lib/services/api/interceptors/auth_interceptor.dart`
- Create class AuthInterceptor extends Interceptor
- Inject SecureStorageService
- Override onRequest:
  - Read token from secure storage
  - Add Authorization header: Bearer {token}
  - Skip for login/register endpoints
- Override onError:
  - Detect 401 Unauthorized
  - Attempt token refresh
  - Retry original request with new token
  - If refresh fails, logout user
- Add refresh token logic:
  - Call refresh endpoint
  - Save new tokens
  - Return new tokens
- Prevent infinite refresh loops
- Handle refresh token expiry

**10.4 Create Logging Interceptor**
File: `lib/services/api/interceptors/logging_interceptor.dart`
- Create class LoggingInterceptor extends Interceptor
- Only active in development environment
- Override onRequest:
  - Log request method and URL
  - Log request headers (mask sensitive)
  - Log request body (pretty print JSON)
  - Log timestamp
- Override onResponse:
  - Log response status code
  - Log response headers
  - Log response body (pretty print)
  - Log duration
- Override onError:
  - Log error details
  - Log error response if available
- Use logger from Step 6
- Make output developer-friendly

**10.5 Create Error Interceptor**
File: `lib/services/api/interceptors/error_interceptor.dart`
- Create class ErrorInterceptor extends Interceptor
- Override onError:
  - Map DioException to AppException:
    - DioExceptionType.connectionTimeout → TimeoutException
    - DioExceptionType.sendTimeout → TimeoutException
    - DioExceptionType.receiveTimeout → TimeoutException
    - DioExceptionType.badResponse → map by status code
    - DioExceptionType.connectionError → NoInternetException
    - DioExceptionType.cancel → RequestCancelledException
  - Check network connectivity
  - Parse error response body
  - Extract error message from API
  - Map to appropriate exception type
- Add retry logic for network errors:
  - Retry up to 3 times
  - Exponential backoff
  - Only retry for GET requests
- Log errors appropriately

**10.6 Create Network Info Utility**
File: `lib/core/utils/network_info.dart`
- Create NetworkInfo class
- Use connectivity_plus package (add to pubspec)
- Add methods:
  - `Future<bool> get isConnected`
  - `Stream<ConnectivityResult> get onConnectivityChanged`
- Check actual internet access (not just WiFi/mobile)
- Ping reliable endpoint (e.g., Google DNS)

**10.7 Configure API Client with Interceptors**
In api_client.dart:
- Add interceptors in order:
  1. AuthInterceptor
  2. LoggingInterceptor (dev only)
  3. ErrorInterceptor
- Set maxRedirects
- Configure validateStatus
- Add request cancellation support

**10.8 Create API Response Wrapper**
File: `lib/services/api/models/api_response.dart`
- Create generic ApiResponse<T> class with Freezed
- Add states:
  - success(T data)
  - error(String message, String? code)
  - loading()
- Add fromJson factory
- Add when/map methods (Freezed)
- Used for standardizing API responses

**10.9 Set Up Mock API**
- Create account on mockapi.io or similar
- Set up mock endpoints:
  - POST /auth/login → returns token
  - POST /auth/register → returns user
  - POST /auth/refresh → returns new token
  - GET /users/me → returns user data
- Document mock API URLs
- Update .env.dev with mock URL
- Create sample request/response in docs

**10.10 Register API Client in DI**
File: `lib/config/di/injection_container.dart`
- Register Dio instance
- Register ApiClient as singleton
- Register interceptors
- Register NetworkInfo
- Initialize before other services

**10.11 Create API Demo Screen**
File: `lib/services/api/api_demo_screen.dart`
- Create screen to test API calls
- Add buttons for each HTTP method
- Test authentication flow:
  - Login with test credentials
  - Store token
  - Make authenticated request
  - Test token refresh
- Display request/response
- Show loading states
- Show error handling
- Add to router

**10.12 Test API Integration**// filepath: _project-planning/action-plan-v1.0.md
# Flutter Skeleton App - Master Action Plan v1.0

## Document Control
- **Version**: 1.0
- **Previous Version**: 0.1
- **Last Updated**: [Current Date]
- **Status**: Active Development Plan

## Overview
This document provides a comprehensive, step-by-step plan for building the Flutter Skeleton App from scratch. Each step is designed to be independently testable in the simulator, ensuring a working application at every stage of development.

## Core Principles
- ✅ Every step produces a runnable, testable application
- ✅ Progress is documented after completing each step
- ✅ Follow clean architecture and Flutter best practices
- ✅ Incremental development - no big bang integration
- ✅ No step should break existing functionality
- ✅ Feature-first organization maintained throughout
- ✅ Test early, test often

## Architecture Foundation
This plan implements:
- **Feature-First Clean Architecture** with clear layer separation
- **Riverpod 2.x** with code generation for state management
- **GoRouter** for declarative routing with deep linking
- **Dio** for HTTP communication with interceptors
- **GetIt** for dependency injection
- **Freezed** for immutable data classes
- **JSON Serialization** with code generation

## Project Phases

### Phase 1: Foundation & Core Setup (Steps 1-4)
**Goal**: Establish project foundation with working navigation and theme

**Key Deliverables**:
- Runnable Flutter project with proper structure
- Material 3 theme system (light/dark)
- Dependency injection configured
- Basic routing with GoRouter

### Phase 2: Infrastructure & Utilities (Steps 5-9)
**Goal**: Build reusable components and configure environments

**Key Deliverables**:
- Core widget library
- Extensions and validators
- Exception handling framework
- Environment configuration system
- Storage services

### Phase 3: API & Service Layer (Steps 10-13)
**Goal**: Implement API client and external service interfaces

**Key Deliverables**:
- Configured Dio client with interceptors
- API response models with serialization
- Analytics and crashlytics service structure
- Complete service layer ready for features

### Phase 4: Authentication Feature (Steps 14-19)
**Goal**: Complete authentication with clean architecture layers

**Key Deliverables**:
- Auth data layer (models, datasources, repositories)
- Auth domain layer (entities, use cases)
- Auth state management (Riverpod providers)
- Login and registration screens
- Password reset flow
- Route guards and auth flow integration

### Phase 5: Core Features (Steps 20-22)
**Goal**: Implement home and profile features

**Key Deliverables**:
- Home screen with navigation
- Profile screen with user information
- Profile editing capability
- Bottom navigation structure

### Phase 6: Finalization (Steps 23-26)
**Goal**: Production readiness with i18n, testing, and optimization

**Key Deliverables**:
- Internationalization (i18n) implementation
- Comprehensive test suite
- Environment-specific builds (dev, staging, prod)
- Production polish and optimizations

---

## Detailed Step-by-Step Plan

### **Step 1: Project Initialization & Folder Structure**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 30-45 minutes  
**Deliverable**: A runnable Flutter app with organized folder structure

#### Objectives
1. Create new Flutter project with proper configuration
2. Set up essential dependencies in pubspec.yaml
3. Create complete folder structure following feature-first architecture
4. Configure analysis options for code quality
5. Verify project runs successfully

#### Tasks

**1.1 Create Flutter Project**
- Initialize new Flutter project using Flutter CLI
- Verify Flutter SDK version (3.24+) and Dart version (3.5+)
- Remove default counter app code

**1.2 Configure pubspec.yaml**
Add dependencies in organized groups:

**State Management & Architecture**:
- flutter_riverpod: ^2.5.1
- riverpod_annotation: ^2.3.5
- hooks_riverpod: ^2.5.1

**Navigation**:
- go_router: ^14.0.0

**Networking & Data**:
- dio: ^5.4.0
- retrofit: ^4.1.0 (optional, mark as such)
- json_annotation: ^4.8.1
- freezed_annotation: ^2.4.1

**Storage**:
- flutter_secure_storage: ^9.0.0
- shared_preferences: ^2.2.2

**UI & UX**:
- cached_network_image: ^3.3.1
- shimmer: ^3.0.0
- flutter_svg: ^2.0.9

**Utilities**:
- intl: ^0.19.0
- equatable: ^2.0.5
- get_it: ^7.6.7
- logger: ^2.0.2

**Dev Dependencies**:
- build_runner: ^2.4.8
- freezed: ^2.4.7
- json_serializable: ^6.7.1
- riverpod_generator: ^2.3.11
- riverpod_lint: ^2.3.10
- flutter_lints: ^3.0.1
- mockito: ^5.4.4
- mocktail: ^1.0.3

**1.3 Create Folder Structure**
Create all directories as specified in architecture:
```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   ├── extensions/
│   ├── exceptions/
│   └── widgets/
├── config/
│   ├── env/
│   ├── routes/
│   └── di/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── datasources/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── widgets/
│   │       └── providers/
│   ├── home/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   ├── widgets/
│   │   │   └── providers/
│   └── profile/
│       ├── data/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── screens/
│           ├── widgets/
│           └── providers/
├── services/
│   ├── api/
│   │   ├── interceptors/
│   │   └── models/
│   ├── storage/
│   ├── analytics/
│   └── crashlytics/
└── l10n/

test/
├── unit/
│   ├── auth/
│   ├── profile/
│   └── utils/
├── widget/
│   ├── auth/
│   └── common/
└── integration/

assets/
├── images/
├── icons/
└── fonts/

config/
└── env/
```

**1.4 Create analysis_options.yaml**
Configure with:
- flutter_lints
- Strict analysis rules
- Custom lint rules for the project
- Line length limit (80-100 characters)
- Warnings as errors for CI/CD

**1.5 Create Minimal main.dart**
- Create simple MaterialApp
- Display "Flutter Skeleton App" text on home screen
- No functionality yet, just structure verification
- Wrap with ProviderScope for Riverpod

**1.6 Create README placeholders**
Add .gitkeep files in empty directories to preserve structure in git

#### Testing Checklist
- [ ] Project compiles without errors
- [ ] App runs on iOS simulator
- [ ] App runs on Android emulator
- [ ] Hot reload works correctly
- [ ] No analyzer warnings or errors
- [ ] All folders visible in project structure
- [ ] Dependencies download successfully

#### Common Issues & Solutions
- **Issue**: flutter_secure_storage build errors
  - **Solution**: Follow platform-specific setup in package documentation
- **Issue**: Dependency conflicts
  - **Solution**: Run `flutter pub upgrade --major-versions`
- **Issue**: Analysis options too strict
  - **Solution**: Start with flutter_lints defaults, customize incrementally

#### Success Criteria
✅ App displays "Flutter Skeleton App" text  
✅ No compilation errors  
✅ Folder structure matches plan  
✅ All dependencies resolved  
✅ Hot reload functional  

#### Next Step Preparation
Step 2 will use the constants folders to create theme system

#### Documentation Output
Create: `_project-planning/01-project-initialization-complete.md`

---

### **Step 2: Theme System Implementation**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Complete Material 3 theme with light/dark mode

#### Objectives
1. Define app color palette and design tokens
2. Implement Material 3 theme configuration
3. Create typography system with text styles
4. Set up theme mode switching capability
5. Create demo screen to visualize theme

#### Tasks

**2.1 Create Color Constants**
File: `lib/core/constants/app_colors.dart`
- Define primary, secondary, tertiary color schemes
- Define semantic colors (success, warning, error, info)
- Define neutral colors (backgrounds, surfaces)
- Separate light and dark mode variants
- Use Material 3 color system principles
- Include color documentation comments

**2.2 Create Dimension Constants**
File: `lib/core/constants/app_dimensions.dart`
- Define spacing scale (4px base: 4, 8, 12, 16, 24, 32, 48, 64)
- Define border radius values
- Define icon sizes
- Define button heights
- Define form field dimensions
- Define breakpoints for responsive design

**2.3 Create String Constants (Temporary)**
File: `lib/core/constants/app_strings.dart`
- Add temporary hardcoded strings
- Mark with TODO for i18n replacement
- Include common labels, buttons, errors
- Document this is temporary until Step 23

**2.4 Create Typography System**
File: `lib/core/theme/text_styles.dart`
- Define text styles hierarchy (heading1-6, body1-2, caption, button)
- Use consistent font family
- Define letter spacing and line heights
- Consider accessibility (minimum 14sp for body)
- Create const text style instances

**2.5 Create Theme Configuration**
File: `lib/core/theme/app_theme.dart`
- Create AppTheme class with static methods
- Implement `lightTheme()` returning ThemeData
- Implement `darkTheme()` returning ThemeData
- Configure Material 3 with `useMaterial3: true`
- Set color schemes from app_colors
- Configure component themes:
  - AppBarTheme
  - ButtonTheme
  - InputDecorationTheme
  - CardTheme
  - DialogTheme
  - BottomNavigationBarTheme
- Apply text styles from text_styles.dart

**2.6 Create Theme Provider**
File: `lib/core/theme/theme_provider.dart`
- Create Riverpod StateNotifier for theme mode
- Support ThemeMode.light, ThemeMode.dark, ThemeMode.system
- Implement toggle method
- Add persistence (preparation for shared_preferences in Step 9)

**2.7 Update main.dart**
- Integrate theme provider
- Set theme and darkTheme from AppTheme
- Set themeMode from provider
- Ensure ProviderScope wraps MaterialApp

**2.8 Create Theme Demo Screen**
File: `lib/core/theme/theme_demo_screen.dart`
- Display all color swatches
- Show text style examples
- Include theme mode toggle button
- Display spacing examples
- Show component examples (buttons, cards, etc.)
- Make this temporary for development only

**2.9 Update main.dart Home**
- Navigate to theme demo screen
- This validates theme is working

#### Testing Checklist
- [ ] App displays with custom theme colors
- [ ] Light theme applies correctly
- [ ] Dark theme applies correctly
- [ ] Can toggle between light and dark modes
- [ ] System theme mode works
- [ ] All text styles render properly
- [ ] Colors meet accessibility contrast requirements
- [ ] Theme persists across hot reload
- [ ] No theme-related errors in console

#### Design Considerations
- Use Material 3 color roles correctly
- Ensure 4.5:1 contrast ratio minimum (WCAG AA)
- Test theme on various screen sizes
- Consider color blindness accessibility
- Use semantic color naming (not literal colors)

#### Success Criteria
✅ Material 3 theme fully configured  
✅ Light and dark modes both functional  
✅ Theme toggle works smoothly  
✅ All color constants documented  
✅ Typography system complete  
✅ Demo screen shows all theme elements  

#### Next Step Preparation
Step 3 will use these themes in dependency injection setup

#### Documentation Output
Create: `_project-planning/02-theme-system-complete.md`

---

### **Step 3: Dependency Injection Setup**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 30-45 minutes  
**Deliverable**: GetIt service locator configured with example services

#### Objectives
1. Configure GetIt dependency injection container
2. Create service registration pattern
3. Implement lazy and singleton registrations
4. Create example service to validate DI
5. Document DI usage patterns

#### Tasks

**3.1 Create Injection Container**
File: `lib/config/di/injection_container.dart`
- Create GetIt singleton instance (`final getIt = GetIt.instance`)
- Create `Future<void> setupServiceLocator()` async function
- Document registration types:
  - `registerLazySingleton` for services
  - `registerSingleton` for immediate initialization
  - `registerFactory` for new instances each time
- Add clear section comments for service categories

**3.2 Create Logger Service (Example)**
File: `lib/core/utils/logger.dart`
- Create LoggerService abstract class (interface)
- Create LoggerServiceImpl implementation
- Use logger package for actual logging
- Implement methods: debug, info, warning, error
- Add log level configuration based on environment
- Register in DI container as example

**3.3 Register Core Services**
In injection_container.dart, register:
- LoggerService (lazy singleton)
- Add placeholder comments for future services:
  - API Client (Step 10)
  - Storage Services (Step 9)
  - Analytics Service (Step 12)
  - Auth Repository (Step 14)

**3.4 Initialize DI in main.dart**
- Call `await setupServiceLocator()` before `runApp()`
- Add loading indicator during initialization
- Handle initialization errors gracefully
- Wrap in try-catch with error display

**3.5 Create Service Locator Helper**
File: `lib/config/di/service_locator.dart`
- Create helper getters for common pattern
- Example: `LoggerService get logger => getIt<LoggerService>()`
- Document usage pattern
- Add type-safe accessors

**3.6 Update Theme Demo Screen**
- Retrieve LoggerService from GetIt
- Log theme changes
- Display service status on screen
- Demonstrate DI usage pattern

**3.7 Create DI Documentation**
File: `lib/config/di/README.md`
- Document registration patterns
- Explain when to use each type
- Provide usage examples
- Document service lifecycle

#### Testing Checklist
- [ ] App initializes successfully
- [ ] Logger service can be retrieved
- [ ] Logging outputs to console correctly
- [ ] Multiple retrievals return same instance (singleton)
- [ ] No DI errors or warnings
- [ ] Theme demo screen uses injected service
- [ ] Hot restart reinitializes DI properly
- [ ] Error handling works if service not registered

#### DI Best Practices
- Register interfaces, not implementations
- Use lazy initialization for heavy services
- Avoid circular dependencies
- Register in logical order
- Document all registrations
- Use factories for stateful objects

#### Common Pitfalls to Avoid
- ❌ Registering before GetIt is ready
- ❌ Accessing services during registration
- ❌ Forgetting async initialization
- ❌ Not handling registration errors
- ❌ Tight coupling to GetIt in business logic

#### Success Criteria
✅ GetIt configured and initialized  
✅ Logger service working and injectable  
✅ Clear registration pattern established  
✅ Documentation complete  
✅ Example usage demonstrated  
✅ No DI-related errors  

#### Next Step Preparation
Step 4 will register router in DI and use it for navigation

#### Documentation Output
Create: `_project-planning/03-dependency-injection-complete.md`

---

### **Step 4: Routing with GoRouter**
**Phase**: Foundation & Core Setup  
**Estimated Time**: 60-90 minutes  
**Deliverable**: Complete navigation system with multiple routes

#### Objectives
1. Configure GoRouter for declarative navigation
2. Define route names and paths as constants
3. Create initial feature screens (splash, home, login)
4. Implement type-safe navigation
5. Set up navigation transitions
6. Integrate with dependency injection

#### Tasks

**4.1 Create Route Names**
File: `lib/config/routes/route_names.dart`
- Define class `Routes` with static const route names
- Define class `RoutePaths` with static const route paths
- Example structure:
  ```
  Routes.splash → RoutePaths.splash ('/splash')
  Routes.home → RoutePaths.home ('/home')
  Routes.login → RoutePaths.login ('/login')
  Routes.register → RoutePaths.register ('/register')
  Routes.profile → RoutePaths.profile ('/profile')
  Routes.editProfile → RoutePaths.editProfile ('/profile/edit')
  ```
- Document route hierarchy and relationships
- Include route parameter names as constants

**4.2 Create Splash Screen**
File: `lib/features/splash/presentation/screens/splash_screen.dart`
- Create simple splash screen with app logo/name
- Add loading indicator
- No business logic yet (will add in Step 18)
- Use theme colors and text styles from Step 2
- Display for 2 seconds then navigate

**4.3 Create Home Screen Placeholder**
File: `lib/features/home/presentation/screens/home_screen.dart`
- Create basic home screen with app bar
- Display "Home Screen" text
- Add buttons to navigate to other screens
- Add logout placeholder button
- Use custom widgets from core (will create in Step 5)

**4.4 Create Login Screen Placeholder**
File: `lib/features/auth/presentation/screens/login_screen.dart`
- Create basic login screen layout
- Add "Login Screen" text
- Add button to navigate to register
- Add button to navigate to home (bypass auth for now)
- Note: Full implementation in Step 16

**4.5 Create Register Screen Placeholder**
File: `lib/features/auth/presentation/screens/register_screen.dart`
- Create basic register screen layout
- Add "Register Screen" text
- Add button to navigate back to login
- Note: Full implementation in Step 17

**4.6 Configure GoRouter**
File: `lib/config/routes/app_router.dart`
- Create AppRouter class
- Create static GoRouter instance
- Configure routes:
  - Initial route: splash
  - Define all route configurations
  - Set route names from route_names.dart
- Configure page transitions (slide, fade, etc.)
- Add error page/route for undefined routes
- Add redirect logic placeholder (for Step 18 auth guards)

**4.7 Create Navigation Extension**
File: `lib/core/extensions/navigation_extensions.dart`
- Create BuildContext extension for type-safe navigation
- Add helper methods:
  - `pushNamed(String routeName)`
  - `pushReplacementNamed(String routeName)`
  - `pop()`
  - `go(String path)`
- Use GoRouter.of(context) internally
- Handle navigation errors

**4.8 Register Router in DI**
In `lib/config/di/injection_container.dart`:
- Register GoRouter as singleton
- Make accessible throughout app

**4.9 Update main.dart**
- Replace MaterialApp with MaterialApp.router
- Set routerConfig to AppRouter instance
- Remove home parameter
- Ensure theme configuration remains

**4.10 Update All Placeholder Screens**
- Add navigation buttons using extensions
- Test navigation between all screens
- Verify back button behavior
- Test deep link capability (document how)

#### Testing Checklist
- [ ] App starts on splash screen
- [ ] Splash automatically navigates to home
- [ ] Can navigate from home to login
- [ ] Can navigate from login to register
- [ ] Can navigate back from register to login
- [ ] Can navigate from home to profile (add route)
- [ ] Back button works correctly
- [ ] Page transitions animate smoothly
- [ ] Error route displays for unknown paths
- [ ] Hot reload preserves navigation state
- [ ] No navigation-related console errors
- [ ] Deep linking works (test with URL)

#### Route Configuration Best Practices
- Use named routes for type safety
- Configure page transitions consistently
- Handle navigation errors gracefully
- Support deep linking from start
- Use redirect for auth logic (Step 18)
- Keep route configuration centralized

#### Success Criteria
✅ GoRouter fully configured  
✅ All placeholder screens navigable  
✅ Type-safe navigation working  
✅ Transitions smooth and consistent  
✅ Error handling in place  
✅ Deep linking supported  
✅ Navigation extensions functional  

#### Next Step Preparation
Step 5 will create reusable widgets used in these screens

#### Documentation Output
Create: `_project-planning/04-routing-complete.md`

---

### **Step 5: Core Widgets Library**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 90-120 minutes  
**Deliverable**: Complete library of reusable UI components

#### Objectives
1. Create consistent, reusable widget components
2. Implement Material 3 design patterns
3. Build form input components with validation
4. Create loading and error state widgets
5. Establish widget usage patterns

#### Tasks

**5.1 Create Custom Button Widget**
File: `lib/core/widgets/custom_button.dart`
- Create enum ButtonType (primary, secondary, text, outlined)
- Create CustomButton stateless widget
- Accept parameters:
  - onPressed callback
  - text label
  - buttonType enum
  - loading state boolean
  - disabled state boolean
  - icon optional
  - full width option
- Implement each button type with theme colors
- Show loading indicator when loading
- Disable interaction when disabled or loading
- Add haptic feedback on press
- Use theme text styles

**5.2 Create Custom Text Field Widget**
File: `lib/core/widgets/custom_text_field.dart`
- Create CustomTextField stateless widget
- Accept parameters:
  - controller
  - label text
  - hint text
  - validator function
  - keyboard type
  - obscure text boolean
  - prefix icon
  - suffix icon
  - max length
  - enabled state
  - error text
  - helper text
  - onChanged callback
- Implement with InputDecoration from theme
- Support validation display
- Add clear button option
- Handle focus states properly

**5.3 Create Loading Indicator Widget**
File: `lib/core/widgets/loading_indicator.dart`
- Create LoadingIndicator stateless widget
- Accept parameters:
  - size (small, medium, large)
  - message optional text
  - color optional
- Implement with CircularProgressIndicator
- Add message text below if provided
- Center in available space
- Use theme colors

**5.4 Create Error View Widget**
File: `lib/core/widgets/error_view.dart`
- Create ErrorView stateless widget
- Accept parameters:
  - error message
  - retry callback optional
  - icon optional
- Display error icon (default to theme error color)
- Display error message with proper typography
- Show retry button if callback provided
- Center content vertically
- Make scrollable for long messages

**5.5 Create Empty State Widget**
File: `lib/core/widgets/empty_state.dart`
- Create EmptyState stateless widget
- Accept parameters:
  - title text
  - message text
  - icon optional
  - action button optional
- Display large icon
- Display title and message
- Show action button if provided
- Center content
- Use theme colors and text styles

**5.6 Create Custom App Bar Widget**
File: `lib/core/widgets/custom_app_bar.dart`
- Create CustomAppBar returning PreferredSizeWidget
- Accept parameters:
  - title text
  - actions list optional
  - show back button boolean
  - background color optional
- Implement with Material 3 AppBar
- Handle back button automatically
- Apply theme colors
- Support custom actions

**5.7 Create Avatar Widget**
File: `lib/core/widgets/avatar.dart`
- Create Avatar stateless widget
- Accept parameters:
  - image URL optional
  - initials text
  - size enum (small, medium, large)
  - background color optional
- Display network image if URL provided
- Display initials if no image
- Use circular shape
- Add loading state for network images
- Handle image load errors

**5.8 Create Bottom Sheet Helper**
File: `lib/core/widgets/bottom_sheet_helper.dart`
- Create static methods for showing bottom sheets
- showCustomBottomSheet method
- Accept child widget
- Configure default styling
- Add drag handle
- Set rounded top corners

**5.9 Create Dialog Helper**
File: `lib/core/widgets/dialog_helper.dart`
- Create static methods for common dialogs
- showConfirmDialog method
- showAlertDialog method
- showLoadingDialog method
- Accept title, message, actions
- Use theme styling
- Return Future<bool> for confirmation

**5.10 Create Widget Showcase Screen**
File: `lib/core/widgets/widget_showcase_screen.dart`
- Create screen displaying all widgets
- Show each widget in Card
- Add interactive examples
- Include code snippets (as commented text)
- Make it scrollable
- Add to router (temporary route)

**5.11 Update Router**
Add route for widget showcase (for development only)

**5.12 Update Placeholder Screens**
Update home, login, register screens to use custom widgets

#### Testing Checklist
- [ ] All custom widgets render correctly
- [ ] CustomButton responds to taps
- [ ] CustomButton shows loading state
- [ ] CustomTextField accepts input
- [ ] CustomTextField shows validation errors
- [ ] LoadingIndicator animates
- [ ] ErrorView displays messages correctly
- [ ] ErrorView retry callback works
- [ ] EmptyState centers properly
- [ ] CustomAppBar back button works
- [ ] Avatar displays images and initials
- [ ] Bottom sheet appears and dismisses
- [ ] Dialogs show and return values
- [ ] Showcase screen displays all widgets
- [ ] Widgets use theme colors consistently
- [ ] Widgets are accessible (TalkBack/VoiceOver)

#### Widget Design Principles
- Keep widgets composable
- Accept required parameters only
- Provide sensible defaults
- Use theme values, don't hardcode
- Support accessibility features
- Handle edge cases (null, empty, error)
- Make widgets testable

#### Success Criteria
✅ Complete widget library created  
✅ All widgets follow Material 3  
✅ Widgets use theme system  
✅ Showcase screen demonstrates usage  
✅ Widgets are reusable and composable  
✅ Accessibility supported  
✅ No hardcoded values  

#### Next Step Preparation
Step 6 will use these widgets in extensions and utilities

#### Documentation Output
Create: `_project-planning/05-core-widgets-complete.md`

---

### **Step 6: Extensions & Utilities**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Helper extensions and utility functions

#### Objectives
1. Create Dart extensions for common operations
2. Implement form validators
3. Build context-aware helpers
4. Create date and string utilities
5. Establish utility usage patterns

#### Tasks

**6.1 Create Context Extensions**
File: `lib/core/extensions/context_extensions.dart`
- Create BuildContext extension
- Add theme accessors:
  - `theme` → Theme.of(context)
  - `textTheme` → Theme.of(context).textTheme
  - `colorScheme` → Theme.of(context).colorScheme
- Add MediaQuery accessors:
  - `screenSize` → MediaQuery.of(context).size
  - `screenWidth` → screenSize.width
  - `screenHeight` → screenSize.height
  - `padding` → MediaQuery.of(context).padding
  - `isKeyboardOpen` → MediaQuery.of(context).viewInsets.bottom > 0
- Add responsive helpers:
  - `isMobile` → screenWidth < 600
  - `isTablet` → screenWidth >= 600 && < 900
  - `isDesktop` → screenWidth >= 900
- Add navigation shortcuts:
  - `pop<T>([T? result])`
  - `pushNamed(String routeName)`
  - `pushReplacementNamed(String routeName)`
- Add SnackBar helpers:
  - `showSnackBar(String message)`
  - `showErrorSnackBar(String message)`
  - `showSuccessSnackBar(String message)`
- Add localization shortcut:
  - `l10n` → AppLocalizations.of(context)! (prepare for Step 23)

**6.2 Create String Extensions**
File: `lib/core/extensions/string_extensions.dart`
- Create String extension
- Add validation helpers:
  - `isValidEmail` → bool (regex check)
  - `isValidPassword` → bool (min length, complexity)
  - `isValidPhone` → bool (basic format check)
- Add formatting helpers:
  - `capitalize` → First letter uppercase
  - `capitalizeWords` → All words capitalized
  - `toTitleCase` → Title case conversion
  - `truncate(int maxLength)` → Truncate with ellipsis
  - `removeWhitespace` → Remove all whitespace
- Add parsing helpers:
  - `toInt()` → int? (safe parsing)
  - `toDouble()` → double? (safe parsing)
  - `toBool()` → bool (handle 'true', '1', 'yes')
- Add null/empty checks:
  - `isNullOrEmpty` → bool
  - `isNotNullOrEmpty` → bool

**6.3 Create Date Extensions**
File: `lib/core/extensions/date_extensions.dart`
- Create DateTime extension
- Add formatting helpers:
  - `toFormattedDate()` → 'Jan 1, 2024'
  - `toFormattedTime()` → '12:30 PM'
  - `toFormattedDateTime()` → 'Jan 1, 2024 at 12:30 PM'
  - `toRelativeTime()` → '2 hours ago', 'Just now', etc.
  - `toIso8601String()` → ISO format for API
- Add comparison helpers:
  - `isToday` → bool
  - `isYesterday` → bool
  - `isTomorrow` → bool
  - `isThisWeek` → bool
  - `isThisMonth` → bool
  - `isThisYear` → bool
- Add calculation helpers:
  - `add Duration` → DateTime
  - `subtract Duration` → DateTime
  - `difference(DateTime other)` → Duration

**6.4 Create Num Extensions**
File: `lib/core/extensions/num_extensions.dart`
- Create num extension (works for int and double)
- Add formatting helpers:
  - `toCurrency([String symbol])` → '\$10.00'
  - `toPercentage([int decimals])` → '10.5%'
  - `toCompact()` → '1.5K', '2.3M' for large numbers
- Add utility helpers:
  - `toRadians()` → num * (pi / 180)
  - `toDegrees()` → num * (180 / pi)

**6.5 Create Validators**
File: `lib/core/utils/validators.dart`
- Create Validators static class
- Implement validation functions returning String? (for form validation):
  - `required(String? value, [String fieldName])` → error or null
  - `email(String? value)` → validate email format
  - `password(String? value)` → min 8 chars, uppercase, number, special
  - `confirmPassword(String? value, String? password)` → match check
  - `phone(String? value)` → basic phone format
  - `minLength(String? value, int min)` → minimum length check
  - `maxLength(String? value, int max)` → maximum length check
  - `numeric(String? value)` → only numbers
  - `alphanumeric(String? value)` → letters and numbers only
- Make validators composable:
  - `combine(List<String? Function(String?)> validators)` → run all
- Add customizable error messages

**6.6 Enhance Logger Service**
File: `lib/core/utils/logger.dart` (update from Step 3)
- Add log levels (verbose, debug, info, warning, error, fatal)
- Add pretty printing for objects
- Add stack trace logging for errors
- Add log filtering based on environment
- Add log file writing capability (optional)
- Integrate with crashlytics service (Step 12)

**6.7 Create Formatters Utility**
File: `lib/core/utils/formatters.dart`
- Create Formatters static class
- Add text input formatters:
  - `phoneFormatter` → TextInputFormatter for phones
  - `creditCardFormatter` → TextInputFormatter for cards
  - `dateFormatter` → TextInputFormatter for dates
  - `currencyFormatter` → TextInputFormatter for money
- Add string formatters:
  - `formatCurrency(double amount, [String symbol])`
  - `formatFileSize(int bytes)` → '1.5 MB'
  - `formatDuration(Duration duration)` → '2h 30m'

**6.8 Create Device Info Utility**
File: `lib/core/utils/device_info.dart`
- Create DeviceInfo static class
- Add platform checks:
  - `isIOS` → Platform.isIOS
  - `isAndroid` → Platform.isAndroid
  - `isWeb` → kIsWeb
- Add device type helpers:
  - `deviceType(BuildContext context)` → mobile, tablet, desktop
- Add capability checks:
  - `hasCamera` → bool (use device_info_plus if needed)
  - `hasBiometrics` → bool (prepare for future)

**6.9 Create Extensions Demo Screen**
File: `lib/core/extensions/extensions_demo_screen.dart`
- Create screen demonstrating all extensions
- Show context extensions in action
- Display string extension examples
- Show date formatting examples
- Test validators interactively
- Display device info
- Add to router for testing

**6.10 Update Widget Showcase**
Update widget showcase screen to use new extensions

#### Testing Checklist
- [ ] Context extensions work in widgets
- [ ] Theme accessors return correct values
- [ ] MediaQuery shortcuts work
- [ ] Navigation extensions function correctly
- [ ] SnackBar helpers display properly
- [ ] String extensions validate correctly
- [ ] Email validation regex accurate
- [ ] Password validation enforces rules
- [ ] Date extensions format properly
- [ ] Relative time displays correctly
- [ ] Validators return proper error messages
- [ ] Logger logs at different levels
- [ ] Formatters format correctly
- [ ] Device info returns accurate data
- [ ] Extensions demo screen works
- [ ] No extension-related errors

#### Extension Best Practices
- Keep extensions focused and cohesive
- Avoid side effects in extensions
- Document extension usage
- Handle null cases gracefully
- Don't extend third-party classes excessively
- Test extensions thoroughly

#### Success Criteria
✅ All extensions created and working  
✅ Validators functional and tested  
✅ Utilities provide useful helpers  
✅ Demo screen demonstrates usage  
✅ Extensions improve code readability  
✅ No namespace conflicts  

#### Next Step Preparation
Step 7 will use these validators in exception handling

#### Documentation Output
Create: `_project-planning/06-extensions-utilities-complete.md`

---

### **Step 7: Exception Handling System**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Custom exception hierarchy and error handling framework

#### Objectives
1. Create custom exception classes
2. Implement error mapping strategies
3. Build user-friendly error messages
4. Create error logging system
5. Establish error handling patterns

#### Tasks

**7.1 Create Base App Exception**
File: `lib/core/exceptions/app_exception.dart`
- Create abstract class AppException implements Exception
- Add properties:
  - message (String)
  - code (String optional)
  - details (dynamic optional)
  - stackTrace (StackTrace optional)
- Override toString() for logging
- Create toUserMessage() for display
- Add fromException factory for wrapping

**7.2 Create Network Exception**
File: `lib/core/exceptions/network_exception.dart`
- Extend AppException
- Add specific network error types:
  - NoInternetException
  - TimeoutException
  - ServerException (5xx errors)
  - ClientException (4xx errors)
  - UnauthorizedException (401)
  - ForbiddenException (403)
  - NotFoundException (404)
- Add statusCode property
- Map DioException to network exceptions
- Provide user-friendly messages

**7.3 Create Auth Exception**
File: `lib/core/exceptions/auth_exception.dart`
- Extend AppException
- Add auth-specific errors:
  - InvalidCredentialsException
  - UserNotFoundException
  - EmailAlreadyExistsException
  - WeakPasswordException
  - SessionExpiredException
  - TokenExpiredException
- Add authErrorCode property
- Map API auth errors
- Provide actionable user messages

**7.4 Create Validation Exception**
File: `lib/core/exceptions/validation_exception.dart`
- Extend AppException
- Add field-level validation errors:
  - InvalidEmailException
  - InvalidPhoneException
  - InvalidInputException
  - RequiredFieldException
- Add fieldName property
- Add errors Map<String, String> for multiple fields
- Provide field-specific error messages

**7.5 Create Storage Exception**
File: `lib/core/exceptions/storage_exception.dart`
- Extend AppException
- Add storage-specific errors:
  - ReadException
  - WriteException
  - DeleteException
  - EncryptionException
  - StorageFullException
- Map platform storage errors
- Provide recovery suggestions

**7.6 Create Cache Exception**
File: `lib/core/exceptions/cache_exception.dart`
- Extend AppException
- Add cache-specific errors:
  - CacheNotFoundException
  - CacheExpiredException
  - CacheCorruptedException
- Used for local data caching

**7.7 Create Failure Class**
File: `lib/core/utils/failure.dart`
- Create abstract class Failure (for domain layer)
- Create concrete failure classes:
  - ServerFailure
  - NetworkFailure
  - CacheFailure
  - ValidationFailure
  - AuthFailure
- Map exceptions to failures
- Provide user messages
- Note: Alternative to Either<Failure, T> pattern

**7.8 Create Error Handler Utility**
File: `lib/core/utils/error_handler.dart`
- Create ErrorHandler static class
- Implement handleError method:
  - Accept Exception and context
  - Map to appropriate AppException
  - Log error with logger
  - Report to crashlytics (Step 12)
  - Show user message via SnackBar
- Implement handleFailure method (for domain failures)
- Create getErrorMessage(dynamic error) → String
- Add error code mapping
- Support error callbacks

**7.9 Create Global Error Widget**
File: `lib/core/widgets/error_boundary.dart`
- Create ErrorBoundary widget (for uncaught errors)
- Wrap app in error boundary
- Display friendly error screen
- Provide restart/recovery options
- Log error details
- Show different UI for dev vs prod

**7.10 Integrate Error Handling**
Update main.dart:
- Add error widget builder
- Wrap app with ErrorBoundary
- Configure error handling
- Add uncaught error handlers:
  - FlutterError.onError
  - PlatformDispatcher.instance.onError

**7.11 Create Exception Demo Screen**
File: `lib/core/exceptions/exception_demo_screen.dart`
- Create screen to test error handling
- Add buttons to throw different exceptions
- Demonstrate error handling in action
- Show error messages and recovery
- Add to router for testing

**7.12 Update Logger Integration**
Update logger to handle exceptions:
- Log exception details
- Include stack traces
- Log to appropriate level
- Prepare for crashlytics

#### Testing Checklist
- [ ] Can throw and catch AppException
- [ ] Network exceptions map from Dio errors
- [ ] Auth exceptions have correct messages
- [ ] Validation exceptions work with forms
- [ ] Storage exceptions handle file errors
- [ ] Error handler logs appropriately
- [ ] User messages are friendly
- [ ] Error widget displays on crash
- [ ] Exception demo triggers errors
- [ ] Stack traces captured correctly
- [ ] Error recovery works
- [ ] No unhandled exceptions

#### Error Handling Best Practices
- Never expose internal errors to users
- Always log full error details
- Provide actionable error messages
- Handle errors at appropriate layer
- Map technical errors to user errors
- Test error scenarios thoroughly
- Document error codes
- Support error recovery

#### Success Criteria
✅ Complete exception hierarchy  
✅ Error mapping functional  
✅ User-friendly messages  
✅ Global error handling working  
✅ Error logging integrated  
✅ Demo screen functional  
✅ No unhandled exceptions  

#### Next Step Preparation
Step 8 will use these exceptions in environment configuration

#### Documentation Output
Create: `_project-planning/07-exception-handling-complete.md`

---

### **Step 8: Environment Configuration**
**Phase**: Infrastructure & Utilities  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Multi-environment setup with configuration files

#### Objectives
1. Create environment configuration system
2. Set up dev, staging, and production environments
3. Configure environment variables
4. Create environment-specific entry points
5. Add environment indicators for debugging

#### Tasks

**8.1 Create Environment Enum**
File: `lib/config/env/environment.dart`
- Create enum Environment { dev, staging, prod }
- Add extension with getters:
  - name → String
  - isDevelopment → bool
  - isStaging → bool
  - isProduction → bool

**8.2 Create Environment Config Class**
File: `lib/config/env/environment_config.dart`
- Create class EnvironmentConfig
- Add properties:
  - environment (Environment)
  - apiBaseUrl (String)
  - apiKey (String optional)
  - enableLogging (bool)
  - enableCrashlytics (bool)
  - enableAnalytics (bool)
  - apiTimeout (Duration)
  - socketUrl (String optional for websockets)
  - assetsBaseUrl (String optional for CDN)
- Add getters for feature flags
- Make properties immutable (final)
- Add copyWith method

**8.3 Create Environment Manager**
File: `lib/config/env/environment_manager.dart`
- Create singleton EnvironmentManager
- Store current EnvironmentConfig
- Add initialization method:
  - `initialize(EnvironmentConfig config)`
- Add static getter for current config:
  - `static EnvironmentConfig get config`
- Add validation for required fields
- Throw exception if not initialized

**8.4 Create .env Example File**
File: `config/env/.env.example`
```
API_BASE_URL=https://api.example.com
API_KEY=your_api_key_here
ENABLE_LOGGING=true
ENABLE_CRASHLYTICS=false
ENABLE_ANALYTICS=false
API_TIMEOUT_SECONDS=30
```
- Document all environment variables
- Add comments for clarity
- Note: This is template only

**8.5 Create Dev Configuration**
File: `config/env/.env.dev` (gitignored)
```
API_BASE_URL=https://api-dev.example.com
API_KEY=dev_key
ENABLE_LOGGING=true
ENABLE_CRASHLYTICS=false
ENABLE_ANALYTICS=false
API_TIMEOUT_SECONDS=60
```
- Development API endpoints
- Extended timeouts for debugging
- Logging enabled
- Crashlytics disabled

**8.6 Create Staging Configuration**
File: `config/env/.env.staging` (gitignored)
```
API_BASE_URL=https://api-staging.example.com
API_KEY=staging_key
ENABLE_LOGGING=true
ENABLE_CRASHLYTICS=true
ENABLE_ANALYTICS=true
API_TIMEOUT_SECONDS=30
```
- Staging API endpoints
- All monitoring enabled
- Production-like settings

**8.7 Create Production Configuration**
File: `config/env/.env.prod` (gitignored)
```
API_BASE_URL=https://api.example.com
API_KEY=prod_key
ENABLE_LOGGING=false
ENABLE_CRASHLYTICS=true
ENABLE_ANALYTICS=true
API_TIMEOUT_SECONDS=30
```
- Production API endpoints
- Minimal logging
- All monitoring enabled
- Optimized settings

**8.8 Create Dev Entry Point**
File: `lib/main_dev.dart`
- Import main.dart
- Create main() function
- Initialize EnvironmentManager with dev config
- Set Environment.dev
- Call sharedMain() from main.dart

**8.9 Create Staging Entry Point**
File: `lib/main_staging.dart`
- Same as dev but with staging configuration
- Set Environment.staging

**8.10 Create Production Entry Point**
File: `lib/main_prod.dart`
- Same as dev but with production configuration
- Set Environment.prod

**8.11 Update Main Entry Point**
File: `lib/main.dart`
- Rename main() to sharedMain()
- Accept optional EnvironmentConfig
- Use EnvironmentConfig throughout app
- Add environment validation
- Configure logger based on environment
- Don't make this a direct entry point

**8.12 Create Environment Indicator Widget**
File: `lib/config/env/environment_indicator.dart`
- Create banner widget showing current environment
- Display in development and staging only
- Show environment name and API base URL
- Position in top corner
- Make dismissible
- Add color coding (dev=blue, staging=orange)

**8.13 Wrap App with Environment Indicator**
In main.dart:
- Wrap MaterialApp.router with environment indicator
- Only show in non-production environments
- Position as banner overlay

**8.14 Update .gitignore**
Add:
```
config/env/.env.dev
config/env/.env.staging
config/env/.env.prod
*.env
```

**8.15 Configure Android Flavors**
File: `android/app/build.gradle`
- Add flavorDimensions "environment"
- Define productFlavors: dev, staging, prod
- Set applicationIdSuffix for dev and staging
- Configure different app names per flavor

**8.16 Document iOS Configuration**
Create: `docs/ios-schemes-setup.md`
- Steps to create Xcode schemes
- Configure scheme to run specific main file
- Screenshot examples

**8.17 Update Environment Demo**
Update existing demo to show environment values (mask secrets)

#### Testing Checklist
- [ ] Dev environment runs
- [ ] Staging environment runs  
- [ ] Production environment runs
- [ ] Environment indicator visible in dev/staging only
- [ ] Correct API URLs per environment
- [ ] Android flavors build separately
- [ ] No secrets committed

#### Success Criteria
✅ Three environments working  
✅ Configuration accessible  
✅ Secrets secured  

#### Documentation Output
Create: `_project-planning/08-environment-config-complete.md`

---

### **Step 9: Storage Service Implementation**
[...keep existing Step 9 content...]

---

### **Step 10: API Client Setup**
[...keep existing Step 10 content through 10.11...]

**10.12 Test API Integration**
- Test all HTTP methods in demo screen
- Verify interceptors work
- Test error scenarios
- Verify token injection

#### Testing Checklist
- [ ] GET requests successful
- [ ] POST requests successful
- [ ] Auth interceptor injects token
- [ ] Logging interceptor logs (dev only)
- [ ] Error interceptor maps exceptions
- [ ] Network errors retry automatically
- [ ] 401 triggers token refresh
- [ ] Demo screen functional

#### Success Criteria
✅ API client configured  
✅ All interceptors working  
✅ Error handling functional  
✅ Demo validates all features  

#### Documentation Output
Create: `_project-planning/10-api-client-complete.md`

---

### **Step 11: API Response Models**
**Phase**: API & Service Layer  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Type-safe API models with serialization

#### Objectives
1. Create generic API response wrapper
2. Implement JSON serialization with code generation
3. Create example models for testing
4. Validate serialization works

#### Tasks

**11.1 Create API Response Model**
File: `lib/services/api/models/api_response.dart`
- Use Freezed for immutability
- Generic type ApiResponse<T>
- Add fromJson factory
- Add toJson method

**11.2 Create Pagination Model**
File: `lib/services/api/models/pagination.dart`
- Properties: page, pageSize, total, hasMore
- Freezed + json_serializable
- Used for paginated lists

**11.3 Create User Model**
File: `lib/services/api/models/user_model.dart`
- Properties: id, email, name, avatar, createdAt
- Freezed annotations
- JSON serialization
- Example for testing

**11.4 Run Code Generation**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**11.5 Update API Demo**
- Fetch users list from mock API
- Deserialize to UserModel
- Display in list
- Test pagination

#### Testing Checklist
- [ ] Code generation successful
- [ ] Models deserialize from JSON
- [ ] Models serialize to JSON
- [ ] Freezed equality works
- [ ] copyWith works
- [ ] Demo displays model data

#### Success Criteria
✅ Code generation works  
✅ Serialization functional  
✅ Models type-safe  

#### Documentation Output
Create: `_project-planning/11-api-models-complete.md`

---

### **Step 12: Analytics & Crashlytics Services**
**Phase**: API & Service Layer  
**Estimated Time**: 30-45 minutes  
**Deliverable**: Service interfaces for monitoring

#### Objectives
1. Create analytics service interface
2. Create crashlytics service interface
3. Create mock implementations
4. Register in DI

#### Tasks

**12.1 Create Analytics Service**
File: `lib/services/analytics/analytics_service.dart`
- Abstract class with methods:
  - logEvent(String name, Map<String, dynamic> parameters)
  - logScreenView(String screenName)
  - setUserId(String userId)
  - setUserProperty(String name, String value)

**12.2 Create Analytics Implementation**
File: `lib/services/analytics/analytics_service_impl.dart`
- Implement interface
- Log to console for now
- Prepare for Firebase Analytics integration

**12.3 Create Crashlytics Service**
File: `lib/services/crashlytics/crashlytics_service.dart`
- Abstract class with methods:
  - recordError(exception, stackTrace, reason)
  - log(String message)
  - setCustomKey(String key, dynamic value)

**12.4 Create Crashlytics Implementation**
File: `lib/services/crashlytics/crashlytics_service_impl.dart`
- Implement interface
- Log to console for now
- Prepare for Firebase Crashlytics

**12.5 Register in DI**
Register both services as singletons

**12.6 Integrate with Error Handler**
Update error handler to use crashlytics service

**12.7 Add Analytics to Screens**
Add screen view tracking to router observers

#### Testing Checklist
- [ ] Services registered in DI
- [ ] Analytics logs events
- [ ] Crashlytics logs errors
- [ ] Screen views tracked
- [ ] Console shows logs

#### Success Criteria
✅ Services implemented  
✅ Logging functional  
✅ Ready for real integration  

#### Documentation Output
Create: `_project-planning/12-analytics-crashlytics-complete.md`

---

### **Step 13: Authentication Data Layer**
**Phase**: Authentication Feature  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Auth models, datasources, repositories

#### Objectives
1. Create auth request/response models
2. Implement remote datasource
3. Implement local datasource
4. Create repository implementation

#### Tasks

**13.1 Create Login Models**
Files:
- `lib/features/auth/data/models/login_request_model.dart`
- `lib/features/auth/data/models/login_response_model.dart`
- Use Freezed + JSON serialization

**13.2 Create Register Models**
Files:
- `lib/features/auth/data/models/register_request_model.dart`
- `lib/features/auth/data/models/register_response_model.dart`

**13.3 Create User Model**
File: `lib/features/auth/data/models/user_model.dart`
- Properties: id, email, name, token, refreshToken

**13.4 Create Remote Datasource**
File: `lib/features/auth/data/datasources/auth_remote_datasource.dart`
- Abstract class defining API methods
- Implementation using ApiClient
- Methods: login, register, logout, refreshToken

**13.5 Create Local Datasource**
File: `lib/features/auth/data/datasources/auth_local_datasource.dart`
- Abstract class for local operations
- Implementation using SecureStorageService
- Methods: saveToken, getToken, deleteToken, saveUser, getUser

**13.6 Run Code Generation**

**13.7 Test Datasources**
Test in isolation with mock API

#### Testing Checklist
- [ ] Models serialize correctly
- [ ] Remote datasource makes API calls
- [ ] Local datasource stores/retrieves data
- [ ] Token persists across restarts

#### Success Criteria
✅ All models created  
✅ Datasources functional  
✅ Data persists correctly  

#### Documentation Output
Create: `_project-planning/13-auth-data-layer-complete.md`

---

### **Step 14: Authentication Domain Layer**
**Phase**: Authentication Feature  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Entities, repository interface, use cases

#### Tasks

**14.1 Create User Entity**
File: `lib/features/auth/domain/entities/user.dart`
- Plain Dart class (no JSON)
- Properties: id, email, name

**14.2 Create Repository Interface**
File: `lib/features/auth/domain/repositories/auth_repository.dart`
- Abstract class with methods returning Future
- Methods: login, register, logout, checkAuthStatus, refreshToken

**14.3 Create Repository Implementation**
File: `lib/features/auth/data/repositories/auth_repository_impl.dart`
- Implements domain interface
- Uses remote and local datasources
- Maps models to entities
- Handles errors

**14.4 Create Use Cases**
Files:
- `lib/features/auth/domain/usecases/login_usecase.dart`
- `lib/features/auth/domain/usecases/register_usecase.dart`
- `lib/features/auth/domain/usecases/logout_usecase.dart`
- `lib/features/auth/domain/usecases/check_auth_status_usecase.dart`
- Each calls repository method

**14.5 Register in DI**
Register repository and use cases

#### Testing Checklist
- [ ] Use cases execute successfully
- [ ] Repository maps data correctly
- [ ] Errors handled properly

#### Success Criteria
✅ Clean architecture maintained  
✅ Domain layer independent  
✅ Use cases functional  

#### Documentation Output
Create: `_project-planning/14-auth-domain-layer-complete.md`

---

### **Step 15: Authentication State Management**
**Phase**: Authentication Feature  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Riverpod providers for auth

#### Tasks

**15.1 Create Auth State**
File: `lib/features/auth/presentation/providers/auth_state.dart`
- Use Freezed
- States: initial, loading, authenticated, unauthenticated, error

**15.2 Create Auth Notifier**
File: `lib/features/auth/presentation/providers/auth_notifier.dart`
- Use Riverpod code generation
- Methods: login, register, logout, checkAuthStatus
- Update state based on use case results

**15.3 Create Auth Provider**
File: `lib/features/auth/presentation/providers/auth_provider.dart`
- StateNotifierProvider wrapping AuthNotifier
- Export for use in widgets

**15.4 Create Form Providers**
Files:
- `lib/features/auth/presentation/providers/login_form_provider.dart`
- `lib/features/auth/presentation/providers/register_form_provider.dart`
- Manage form state separately

**15.5 Run Code Generation**

**15.6 Test Provider**
Create test screen to verify state changes

#### Testing Checklist
- [ ] Providers accessible
- [ ] State updates correctly
- [ ] Loading states work
- [ ] Error states handled

#### Success Criteria
✅ State management working  
✅ Providers generated  
✅ State updates reactive  

#### Documentation Output
Create: `_project-planning/15-auth-state-management-complete.md`

---

### **Step 16: Login Screen**
**Phase**: Authentication Feature  
**Estimated Time**: 60-90 minutes  
**Deliverable**: Full login UI and functionality

#### Tasks

**16.1 Create Login Screen**
File: `lib/features/auth/presentation/screens/login_screen.dart`
- Email field using CustomTextField
- Password field with visibility toggle
- Login button using CustomButton
- Navigation to register
- Forgot password link (placeholder)

**16.2 Create Login Form Widget**
File: `lib/features/auth/presentation/widgets/login_form.dart`
- Extract form to separate widget
- Connect to auth provider
- Handle validation
- Show loading state
- Display errors

**16.3 Add Form Validation**
- Use validators from Step 6
- Real-time validation
- Display error messages

**16.4 Connect to Provider**
- Watch auth provider
- Call login method
- Handle state changes
- Navigate on success

**16.5 Update Router**
Remove bypass navigation from Step 4

#### Testing Checklist
- [ ] Form displays correctly
- [ ] Validation works
- [ ] Loading indicator shows
- [ ] Errors display
- [ ] Successful login navigates
- [ ] Password toggle works

#### Success Criteria
✅ Login fully functional  
✅ Validation working  
✅ Navigation correct  

#### Documentation Output
Create: `_project-planning/16-login-screen-complete.md`

---

### **Step 17: Registration Screen**
**Phase**: Authentication Feature  
**Estimated Time**: 60-90 minutes  
**Deliverable**: Full registration UI

#### Tasks

**17.1 Create Register Screen**
File: `lib/features/auth/presentation/screens/register_screen.dart`
- Name, email, password, confirm password fields
- Terms acceptance checkbox
- Register button
- Login navigation link

**17.2 Create Register Form**
File: `lib/features/auth/presentation/widgets/register_form.dart`
- Comprehensive validation
- Password matching
- Terms requirement

**17.3 Connect to Provider**
Watch and use register method

#### Testing Checklist
- [ ] All validations work
- [ ] Password confirmation validates
- [ ] Terms checkbox required
- [ ] Registration successful

#### Success Criteria
✅ Registration functional  
✅ All validations pass  

#### Documentation Output
Create: `_project-planning/17-register-screen-complete.md`

---

### **Step 18: Auth Flow & Route Guards**
**Phase**: Authentication Feature  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Protected routes and auth flow

#### Tasks

**18.1 Create Route Guard**
File: `lib/config/routes/route_guard.dart`
- Check auth state from provider
- Redirect logic

**18.2 Update Router**
- Add redirect to GoRouter
- Protect routes requiring auth
- Redirect from login if authenticated

**18.3 Update Splash Screen**
Add auth check logic in splash

**18.4 Add Logout**
Add logout to home and profile screens

#### Testing Checklist
- [ ] Protected routes redirect
- [ ] Login redirects when authenticated
- [ ] Splash checks auth
- [ ] Logout works
- [ ] Deep links respect auth

#### Success Criteria
✅ Auth flow complete  
✅ Route guards working  
✅ Persistence functional  

#### Documentation Output
Create: `_project-planning/18-auth-flow-complete.md`

---

### **Step 19: Password Reset Flow**
**Phase**: Authentication Feature  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Password reset functionality

#### Tasks

**19.1 Create Reset Password Models**
Request/response models with Freezed

**19.2 Add Datasource Methods**
Implement forgot password and reset password

**19.3 Create Use Case**
Domain layer use case for password reset

**19.4 Create Reset Screens**
- Forgot password screen (email input)
- Reset password screen (new password)

**19.5 Update Router**
Add routes for reset flow

#### Testing Checklist
- [ ] Can request reset
- [ ] Receives reset email/code
- [ ] Can set new password
- [ ] Navigation works

#### Success Criteria
✅ Password reset functional  
✅ Email verification works  

#### Documentation Output
Create: `_project-planning/19-password-reset-complete.md`

---

### **Step 20: Home Feature**
**Phase**: Core Features  
**Estimated Time**: 45-60 minutes  
**Deliverable**: Home screen with navigation

#### Tasks

**20.1 Enhance Home Screen**
- Welcome message with user name
- Feature cards
- Bottom navigation bar
- Quick action buttons

**20.2 Create Home Widgets**
Files:
- `home_header.dart`
- `feature_card.dart`
- `quick_action_button.dart`

**20.3 Add Navigation**
Navigate to profile and other sections

**20.4 Display User Info**
Get from auth state

#### Testing Checklist
- [ ] Home displays after login
- [ ] User info shows
- [ ] Navigation works
- [ ] Bottom nav functional

#### Success Criteria
✅ Home screen complete  
✅ Navigation working  

#### Documentation Output
Create: `_project-planning/20-home-feature-complete.md`

---

### **Step 21: Profile Feature**
**Phase**: Core Features  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Profile screen with edit capability

#### Tasks

**21.1 Create Profile Screen**
File: `lib/features/profile/presentation/screens/profile_screen.dart`
- Avatar
- User information display
- Edit button
- Settings section
- Theme toggle
- Logout button

**21.2 Create Profile Widgets**
- `profile_header.dart`
- `profile_menu_item.dart`
- `settings_section.dart`

**21.3 Create Edit Profile Screen**
File: `lib/features/profile/presentation/screens/edit_profile_screen.dart`
- Form for editing name, email, phone
- Save button
- Validation

**21.4 Create Profile Data Layer**
Models, datasources, repository for profile updates

**21.5 Create Profile Use Case**
Update profile use case

**21.6 Create Profile Provider**
State management for profile

**21.7 Connect Screens**
Wire up edit functionality

#### Testing Checklist
- [ ] Profile displays
- [ ] Can navigate to edit
- [ ] Form validates
- [ ] Updates save
- [ ] Changes reflect immediately

#### Success Criteria
✅ Profile fully functional  
✅ Edit working  

#### Documentation Output
Create: `_project-planning/21-profile-feature-complete.md`

---

### **Step 22: Bottom Navigation**
**Phase**: Core Features  
**Estimated Time**: 30-45 minutes  
**Deliverable**: App-wide bottom navigation

#### Tasks

**22.1 Create Navigation Shell**
File: `lib/config/routes/navigation_shell.dart`
- StatefulShellRoute in GoRouter
- Bottom navigation bar
- Maintain state across tabs

**22.2 Update Router**
Reorganize routes under shell

**22.3 Add Navigation Items**
- Home
- Explore/Browse (placeholder)
- Profile
- Settings (placeholder)

**22.4 Handle Navigation State**
Persist selected tab

#### Testing Checklist
- [ ] Bottom nav displays
- [ ] Tab switches work
- [ ] State preserved
- [ ] Deep links work

#### Success Criteria
✅ Navigation structure complete  

#### Documentation Output
Create: `_project-planning/22-bottom-navigation-complete.md`

---

### **Step 23: Internationalization**
**Phase**: Finalization  
**Estimated Time**: 60-90 minutes  
**Deliverable**: Multi-language support

#### Tasks

**23.1 Configure l10n**
Create `l10n.yaml`

**23.2 Create ARB Files**
- `lib/l10n/app_en.arb` (English)
- `lib/l10n/app_es.arb` (Spanish - optional)

**23.3 Add All Strings**
Replace all hardcoded strings with ARB entries

**23.4 Generate Localizations**
```bash
flutter gen-l10n
```

**23.5 Update main.dart**
Add localization delegates

**23.6 Create Language Selector**
Add to profile/settings screen

**23.7 Update All Screens**
Use `context.l10n` throughout app

**23.8 Persist Language**
Save to local storage

#### Testing Checklist
- [ ] Generates successfully
- [ ] Displays in English
- [ ] Can switch language
- [ ] All strings translated
- [ ] Persists choice

#### Success Criteria
✅ i18n fully working  
✅ Multiple languages supported  

#### Documentation Output
Create: `_project-planning/23-internationalization-complete.md`

---

### **Step 24: Testing Implementation**
**Phase**: Finalization  
**Estimated Time**: 90-120 minutes  
**Deliverable**: Comprehensive test suite

#### Tasks

**24.1 Create Unit Tests**
Files:
- `test/unit/auth/auth_repository_test.dart`
- `test/unit/auth/login_usecase_test.dart`
- `test/unit/validators_test.dart`
- `test/unit/extensions_test.dart`

**24.2 Create Widget Tests**
Files:
- `test/widget/login_screen_test.dart`
- `test/widget/custom_button_test.dart`
- `test/widget/home_screen_test.dart`

**24.3 Create Mocks**
Use Mockito to generate mocks

**24.4 Configure Coverage**
Add to pubspec: `test: ^1.24.0`

**24.5 Create Test Helpers**
- Mock providers
- Test data builders
- Common test utilities

**24.6 Run Tests**
```bash
flutter test --coverage
```

#### Testing Checklist
- [ ] All tests pass
- [ ] Coverage >70%
- [ ] Critical paths tested
- [ ] Mocks work correctly

#### Success Criteria
✅ Test suite complete  
✅ Coverage acceptable  

#### Documentation Output
Create: `_project-planning/24-testing-complete.md`

---

### **Step 25: Environment Builds**
**Phase**: Finalization  
**Estimated Time**: 60-75 minutes  
**Deliverable**: Production-ready builds

#### Tasks

**25.1 Finalize Environment Files**
Complete all three .env files with production values

**25.2 Test Android Flavors**
Build all three flavors:
```bash
flutter build apk --flavor dev -t lib/main_dev.dart
flutter build apk --flavor staging -t lib/main_staging.dart
flutter build apk --flavor prod -t lib/main_prod.dart
```

**25.3 Configure iOS Schemes**
Follow documentation from Step 8

**25.4 Test iOS Builds**
Build for each scheme

**25.5 Verify Builds**
- Check app names
- Verify API endpoints
- Test on devices

#### Testing Checklist
- [ ] Dev build works
- [ ] Staging build works
- [ ] Production build works
- [ ] Correct configurations
- [ ] Can install simultaneously

#### Success Criteria
✅ All environments build  
✅ Configuration correct  

#### Documentation Output
Create: `_project-planning/25-environment-builds-complete.md`

---

### **Step 26: Production Polish**
**Phase**: Finalization  
**Estimated Time**: 90-120 minutes  
**Deliverable**: Production-ready application

#### Tasks

**26.1 Add App Icon**
- Configure `flutter_launcher_icons` package
- Generate icons for all platforms

**26.2 Add Splash Screen**
- Configure `flutter_native_splash` package
- Generate splash for all platforms

**26.3 Code Quality**
- Run `flutter analyze` and fix all issues
- Run `dart format .` on entire codebase
- Review and update analysis_options.yaml

**26.4 Performance Optimization**
- Add const constructors everywhere possible
- Optimize list builders
- Profile performance with DevTools
- Fix any jank or memory leaks

**26.5 Remove Debug Code**
- Remove all demo screens
- Remove widget showcase
- Remove test buttons
- Clean up console logs

**26.6 Documentation**
- Update README with final setup instructions
- Create CHANGELOG.md
- Add LICENSE file
- Document API integration points

**26.7 Security Audit**
- Verify no secrets in code
- Check .gitignore completeness
- Verify secure storage implementation
- Review error messages (no sensitive data)

**26.8 Final Testing**
- Complete user flow testing
- Test on multiple devices
- Test in all environments
- Verify offline handling

**26.9 Build Release**
- Create release builds for iOS and Android
- Test release builds thoroughly
- Prepare for distribution

#### Testing Checklist
- [ ] App icon displays
- [ ] Splash screen shows
- [ ] No analyzer warnings
- [ ] Code formatted
- [ ] Performance smooth
- [ ] No debug code
- [ ] Documentation complete
- [ ] Security verified
- [ ] Release builds successful

#### Success Criteria
✅ Production-ready  
✅ All polish complete  
✅ Documentation finished  
✅ Ready for distribution  

#### Documentation Output
Create: `_project-planning/26-production-polish-complete.md`

---

## Step Completion Checklist

After each step:
- [ ] Code compiles without errors
- [ ] App runs in simulator
- [ ] Hot reload works
- [ ] Feature works as expected
- [ ] No regressions
- [ ] Documentation created
- [ ] Code formatted
- [ ] No analyzer warnings
- [ ] Git commit with message

## Documentation Template

```markdown
# Step X: [Feature Name] - Completion Report

## Date Completed
[Date]

## Objectives Met
- [x] Objective 1
- [x] Objective 2

## Implementation Summary
[Brief description]

## Files Created/Modified
- `path/to/file.dart` - Description

## Testing Results
- ✅ Test 1 passed
- ✅ Test 2 passed

## Screenshots
[Optional]

## Challenges Faced
[Description and solutions]

## Notes for Next Step
[Important info]

## Commands Run
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Git Commit
[commit hash]
```

## Success Criteria

By Step 26, the app should:
- ✅ Run on iOS and Android
- ✅ Complete auth flow
- ✅ Secure token storage
- ✅ Working API integration
- ✅ Multiple environments
- ✅ Internationalization
- ✅ Comprehensive tests
- ✅ Clean architecture
- ✅ Production-ready
- ✅ Fully documented

## Progress Tracker

- [ ] Step 1: Project Initialization
- [ ] Step 2: Theme System
- [ ] Step 3: Dependency Injection
- [ ] Step 4: Routing
- [ ] Step 5: Core Widgets
- [ ] Step 6: Extensions & Utilities
- [ ] Step 7: Exception Handling
- [ ] Step 8: Environment Configuration
- [ ] Step 9: Storage Services
- [ ] Step 10: API Client
- [ ] Step 11: API Models
- [ ] Step 12: Analytics & Crashlytics
- [ ] Step 13: Auth Data Layer
- [ ] Step 14: Auth Domain Layer
- [ ] Step 15: Auth State Management
- [ ] Step 16: Login Screen
- [ ] Step 17: Registration Screen
- [ ] Step 18: Auth Flow & Guards
- [ ] Step 19: Password Reset
- [ ] Step 20: Home Feature
- [ ] Step 21: Profile Feature
- [ ] Step 22: Bottom Navigation
- [ ] Step 23: Internationalization
- [ ] Step 24: Testing
- [ ] Step 25: Environment Builds
- [ ] Step 26: Production Polish

---

**Ready to begin? Start with Step 1!**