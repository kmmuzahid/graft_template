import 'package:graft/graft.dart';
import 'package:graft_template/config/dependency/app_scope.dart';
import 'package:graft_template/config/theme/graft/theme_graft.dart';
import 'package:graft_template/features/auth/graft/signup_graft.dart';
import 'package:graft_template/features/dashboard/graft/dashboard_graft.dart';
import 'package:graft_template/features/info/graft/info_graft.dart';
import 'package:graft_template/features/security/graft/security_graft.dart';
import 'package:graft_template/features/settings/graft/profile_graft.dart';
import 'package:graft_template/features/splash/graft/splash_graft.dart';
import 'package:graft_template/features/tasks/graft/task_catalog_graft.dart';

class DependencyBinder {
  static void initialize() {
    // 1. Singletons (Global, route-independent)
    bind<ThemeGraft>(ThemeGraft.new);
    bind<ProfileGraft>(ProfileGraft.new);

    // 2. Global / Route-Scoped Controller Factories
    bind<SplashGraft>(SplashGraft.new);
    bind<DashboardGraft>(DashboardGraft.new);
    bind<TaskCatalogGraft>(TaskCatalogGraft.new);
    bind<SecurityGraft>(SecurityGraft.new);
    bind<LiveCounterGraft>(LiveCounterGraft.new);
    bind<InfoGraft>(InfoGraft.new);

    // 3. Flow-Scoped Controllers (Cleaned up upon flow completion)
    scope(AppScope.signup, () {
      bind<SignUpGraft>(SignUpGraft.new);
    });
  }

  static void dependencies() => initialize();
}
