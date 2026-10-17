import 'package:auto_route/auto_route.dart';
import 'package:graft_template/config/route/app_router.gr.dart';

final appRouter = AppRouter();

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next();
  }
}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRouteGuard> get guards => [AuthGuard()];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: InfoRoute.page),
    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: TaskCatalogRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: SecurityRoute.page),
  ];
}
