import 'package:get_it/get_it.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/theme/graft/theme_graft.dart';
import 'package:graft_template/features/dashboard/graft/dashboard_graft.dart';
import 'package:graft_template/features/info/graft/info_graft.dart';
import 'package:graft_template/features/security/graft/security_graft.dart';
import 'package:graft_template/features/settings/graft/profile_graft.dart';
import 'package:graft_template/features/splash/graft/splash_graft.dart';
import 'package:graft_template/features/tasks/graft/task_catalog_graft.dart';

class DependencyBinder {
  static void bind() {
    // Connect fallback locator to GetIt
    GraftRegistry.fallbackLocator = <T extends Object>() => GetIt.I<T>();

    // Register Singletons (Global, route-independent)
    GraftRegistry.registerSingleton<ThemeGraft>(ThemeGraft.new);
    GraftRegistry.registerSingleton<ProfileGraft>(ProfileGraft.new);

    // Register Route-Scoped Factories
    GraftRegistry.register<SplashGraft>(SplashGraft.new);
    GraftRegistry.register<DashboardGraft>(DashboardGraft.new);
    GraftRegistry.register<TaskCatalogGraft>(TaskCatalogGraft.new);
    GraftRegistry.register<SecurityGraft>(SecurityGraft.new);
    GraftRegistry.register<LiveCounterGraft>(LiveCounterGraft.new);
    GraftRegistry.register<InfoGraft>(InfoGraft.new);
  }

  static void dependencies() => bind();
}
