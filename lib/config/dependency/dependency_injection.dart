import 'package:graft/graft.dart';
import 'package:graft_template/config/theme/graft/theme_graft.dart';
import 'package:graft_template/features/auth/graft/signup_graft.dart';
import 'package:graft_template/features/dashboard/graft/dashboard_graft.dart';
import 'package:graft_template/features/info/graft/info_graft.dart';
import 'package:graft_template/features/info/repository/info_repository.dart';
import 'package:graft_template/features/security/graft/security_graft.dart';
import 'package:graft_template/features/settings/graft/profile_graft.dart';
import 'package:graft_template/features/splash/graft/splash_graft.dart';
import 'package:graft_template/features/tasks/graft/task_catalog_graft.dart';

/// Type-safe developer-defined enum scopes for Graft flows.
enum AppScope {
  /// Scoped flow for user account registration.
  /// Transient by default: controllers auto-dispose when the route unmounts.
  signup,
}

/// Global Dependency Injection configuration for Graft.
void configureDependencies() {
  // 1. Global Singletons
  bind<ThemeGraft>(ThemeGraft.new);
  bind<ProfileGraft>(ProfileGraft.new);
  bind<InfoRepository>(InfoRepository.new);

  // 2. Global / Route-Scoped Controller Factories
  bind<SplashGraft>(SplashGraft.new);
  bind<DashboardGraft>(DashboardGraft.new);
  bind<TaskCatalogGraft>(TaskCatalogGraft.new);
  bind<SecurityGraft>(SecurityGraft.new);
  bind<LiveCounterGraft>(LiveCounterGraft.new);
  bind<InfoGraft>(InfoGraft.new);

  // 3. Flow-Scoped Controllers (auto-disposed when scope/route unmounts)
  scope(AppScope.signup, () {
    bind<SignUpGraft>(SignUpGraft.new);
  });
}
