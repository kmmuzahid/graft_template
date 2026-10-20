# Graft Flutter Template

A highly structured, production-ready Flutter template designed for building ultra-fast, scalable, and maintainable applications. It comes pre-configured with **Graft** for fine-grained reactive state management and enterprise dependency injection, **AutoRoute** for declarative type-safe routing, and **CoreKit** for UI components, networking, authentication, and security.

---

## 🚀 Tech Stack & Core Libraries

- **State Management**: [graft](https://pub.dev/packages/graft) (`^1.0.0-alpha.2`) — Self-optimizing reactive engine with BLoC-style domain models, surgical leaf diffing (< 50ns), and Frame-0 instant dry state hydration.
- **Dependency Injection**: Graft Native DI (`bind`, `bindAsync`, `use`, `scope`) — Sub-nanosecond lookups via monotonic integer `TypeId`, topological reverse DAG teardowns, and type-safe enum scoping.
- **Frame-0 Dry Persistence**: Restores domain states synchronously on Frame 0 before the first widget builds, eliminating blank frames and loading spinners.
- **Declarative Routing**: [auto_route](https://pub.dev/packages/auto_route) for automated, type-safe navigation, route guards, and deep-linking support with `GraftRouteObserver`.
- **Core Utility Package**: [core_kit](https://pub.dev/packages/core_kit) (`^1.1.4`) which provides:
  - Responsive screen scaling (`.w`, `.h`, `.sp`, `.r` utilities).
  - Production-ready UI widgets (`CkButton`, `CkText`, `CkTextField`, `CkAppBar`, etc.).
  - Robust networking layer (`CkTransport` based on Dio) with auto-token refresh & request retries.
  - Secure storage wrapper (`CkStorage` using Keychain/Keystore and fallback).
  - Fully integrated Authentication module (`CkAuthService` / `ckAuth`).

---

## 📁 Project Directory Structure

```text
lib/
├── config/
│   ├── api/          # API endpoint declarations
│   ├── color/        # ThemeColor styling & extensions (Dark/Light configurations)
│   ├── core_kit/     # Modular CoreKit configuration files and AppCoreKitConfig
│   ├── dependency/   # Graft Native DI configurations (bind, scopes, singletons)
│   ├── route/        # AutoRoute definitions, observers, and navigation guards
│   ├── storage/      # Graft storage drivers (SharedPrefsStateConfig)
│   └── theme/        # Custom ThemeData configurations, fonts, and theme-switching Graft
│
├── features/         # Modular feature-by-feature layout (auth, dashboard, home, info, security, splash, tasks)
├── gen/              # Generated assets & resources (flutter_gen)
├── my_app.dart       # Theme setup, GraftRouteObserver registration, and MaterialApp setup
└── main.dart         # Application entry point with Graft Frame-0 persistence bootstrapping
```

---

## 💾 Frame-0 Dry Persistence & Flow Scoping

### SignUp Draft State & Scoped Teardown
In this template, **dry state persistence is used selectively** for the account registration flow (`SignUpGraft` / `SignUpState`):
1. **Persistent Draft**: When a user inputs their username, email, phone number, and birth date on the sign-up page, the fields are persisted via `onDry()`. If the user leaves the app or visits Terms & Conditions, their form data is restored on Frame 0 with **zero blank frames**.
2. **Transient Isolation**: Sensitive fields (like passwords) and transient states (like `isLoading`) are omitted from `onDry()`.
3. **Automatic Cleanup on Success**: Once the user successfully signs up or authenticates, `signupGraft.onSignUpSuccess()` is called:
   - Purges the draft from storage via `invalidateDry()`.
   - Cleans up and tears down the entire scope via `AppScope.signup.drop()`.

```dart
// Flow completion in SignUpGraft:
void onSignUpSuccess() {
  invalidateDry();        // 1. Clears draft from persistent storage
  AppScope.signup.drop(); // 2. Drops scope and disposes scoped controllers
}
```

---

## 💉 Dependency Injection with Graft DI

Dependencies are registered in `lib/config/dependency/dependency_binder.dart` with zero service-locator boilerplate:

```dart
// 1. Singletons (Global services & controllers)
bind<ThemeGraft>(ThemeGraft.new);
bind<ProfileGraft>(ProfileGraft.new);
bind<InfoRepository>(InfoRepository.new);

// 2. Global / Route-Scoped Controller Factories
bind<SplashGraft>(SplashGraft.new);
bind<DashboardGraft>(DashboardGraft.new);
bind<InfoGraft>(InfoGraft.new);

// 3. Flow-Scoped Controllers (Cleaned up upon flow completion)
scope(AppScope.signup, () {
  bind<SignUpGraft>(SignUpGraft.new);
});
```

To resolve in controllers or services:
```dart
final repo = use<InfoRepository>();
```

To resolve or borrow across Flutter route stacks:
```dart
final graft = context.use(SignUpGraft.new);
```

---

## 🛣️ Declarative Routing (AutoRoute)

Routes are defined under `lib/config/route/app_router.dart`. Annotating screen classes with `@RoutePage()` compiles them into router definitions automatically.

### Running Code Generation
To generate paths and router mappings, run the build runner command:
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Navigating Between Screens
Use the global `appRouter` instance:
```dart
appRouter.push(const LoginRoute()); // Navigate forward
appRouter.replaceAll([const HomeRoute()]); // Clear stack and navigate
```

---

## 🎨 Design & Layout Guidelines

- **Theme Extensibility**: Access project colors directly using `context.colors` (extends context with active theme colors, e.g. `context.colors.background`).
- **Responsive Layouts**: Use `.w` (width), `.h` (height), `.sp` (font size), `.r` (radius) on standard Flutter containers.
- **Core Widgets**: Prefer standard `Ck` prefixed UI components (`CkText`, `CkButton`, `CkTextField`) to ensure cohesive design tokens, fonts, and styles.
