// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:graft_template/features/auth/screens/login_screen.dart' as _i4;
import 'package:graft_template/features/auth/screens/reset_password_screen.dart'
    as _i5;
import 'package:graft_template/features/auth/screens/signup_screen.dart' as _i8;
import 'package:graft_template/features/dashboard/screens/dashboard_screen.dart'
    as _i1;
import 'package:graft_template/features/home/home_screen.dart' as _i2;
import 'package:graft_template/features/info/graft/info_graft.dart' as _i13;
import 'package:graft_template/features/info/screens/info_screen.dart' as _i3;
import 'package:graft_template/features/security/screens/security_screen.dart'
    as _i6;
import 'package:graft_template/features/settings/screens/settings_screen.dart'
    as _i7;
import 'package:graft_template/features/splash/screens/splash_screen.dart'
    as _i9;
import 'package:graft_template/features/tasks/screens/task_catalog_screen.dart'
    as _i10;
import 'package:material_ui/material_ui.dart' as _i12;

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.InfoScreen]
class InfoRoute extends _i11.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({
    _i12.Key? key,
    required _i13.InfoType type,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         InfoRoute.name,
         args: InfoRouteArgs(key: key, type: type),
         initialChildren: children,
       );

  static const String name = 'InfoRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InfoRouteArgs>();
      return _i3.InfoScreen(key: args.key, type: args.type);
    },
  );
}

class InfoRouteArgs {
  const InfoRouteArgs({this.key, required this.type});

  final _i12.Key? key;

  final _i13.InfoType type;

  @override
  String toString() {
    return 'InfoRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InfoRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.ResetPasswordScreen]
class ResetPasswordRoute extends _i11.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i11.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.ResetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i6.SecurityScreen]
class SecurityRoute extends _i11.PageRouteInfo<void> {
  const SecurityRoute({List<_i11.PageRouteInfo>? children})
    : super(SecurityRoute.name, initialChildren: children);

  static const String name = 'SecurityRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.SecurityScreen();
    },
  );
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i8.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashScreen();
    },
  );
}

/// generated route for
/// [_i10.TaskCatalogScreen]
class TaskCatalogRoute extends _i11.PageRouteInfo<void> {
  const TaskCatalogRoute({List<_i11.PageRouteInfo>? children})
    : super(TaskCatalogRoute.name, initialChildren: children);

  static const String name = 'TaskCatalogRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.TaskCatalogScreen();
    },
  );
}
