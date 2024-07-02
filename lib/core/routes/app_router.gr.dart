// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:digirh/features/auth/presentation/views/login_screen.dart'
    as _i4;
import 'package:digirh/features/envoi/presentation/views/envoi_list_screen.dart'
    as _i2;
import 'package:digirh/features/home/presentation/views/app_frame.dart' as _i1;
import 'package:digirh/features/home/presentation/views/home_screen.dart'
    as _i3;
import 'package:digirh/features/news/presentation/views/news_screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AppFrame.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppFrame(),
      );
    },
    EnvoiListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EnvoiListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i4.LoginScreen()),
      );
    },
    NewsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppFrame]
class AppFrame extends _i6.PageRouteInfo<void> {
  const AppFrame({List<_i6.PageRouteInfo>? children})
      : super(
          AppFrame.name,
          initialChildren: children,
        );

  static const String name = 'AppFrame';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EnvoiListScreen]
class EnvoiListRoute extends _i6.PageRouteInfo<void> {
  const EnvoiListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EnvoiListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnvoiListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewsScreen]
class NewsRoute extends _i6.PageRouteInfo<void> {
  const NewsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
