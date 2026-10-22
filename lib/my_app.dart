import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/color/app_color.dart';
import 'package:graft_template/config/core_kit/core_kit_config.dart';
import 'package:graft_template/config/route/app_router.dart';
import 'package:graft_template/config/route/app_router_observer.dart';
import 'package:graft_template/config/theme/custom_theme.dart';
import 'package:graft_template/config/theme/graft/theme_graft.dart';
import 'package:material_ui/material_ui.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }

  @override
  ScrollViewKeyboardDismissBehavior getKeyboardDismissBehavior(
    BuildContext context,
  ) {
    return ScrollViewKeyboardDismissBehavior.onDrag;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeGraft = context.use(ThemeGraft.new);

    return themeGraft.slot(
      builder: (themeState) {
        return CoreKit.router(
          title: 'Graft Template',
          config: AppCoreKitConfig(),
          navigatorKey: appRouter.navigatorKey,
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(
            navigatorObservers: () => [
              AppRouterObserver(),
              GraftRouteObserver(),
            ],
          ),
          theme: commonThemeData(ThemeColor.light),
          darkTheme: commonThemeData(ThemeColor.dark),
          themeMode: themeState.mode,
        );
      },
    );
  }
}
