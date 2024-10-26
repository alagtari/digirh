// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:digirh/features/account/presentation/views/account_details_screen.dart'
    as _i1;
import 'package:digirh/features/account/presentation/views/accounts_screen.dart'
    as _i2;
import 'package:digirh/features/auth/presentation/views/login_screen.dart'
    as _i9;
import 'package:digirh/features/conge/data/models/conge_model.dart' as _i14;
import 'package:digirh/features/conge/presentation/views/conge_screen.dart'
    as _i4;
import 'package:digirh/features/conge/presentation/views/demande_conge_screen.dart'
    as _i5;
import 'package:digirh/features/conge/presentation/views/supervisor_conge_screen.dart'
    as _i11;
import 'package:digirh/features/envoi/presentation/views/envoi_list_screen.dart'
    as _i6;
import 'package:digirh/features/home/presentation/views/app_frame.dart' as _i3;
import 'package:digirh/features/home/presentation/views/home_screen.dart'
    as _i7;
import 'package:digirh/features/journal/presentation/views/journal_screen.dart'
    as _i8;
import 'package:digirh/features/news/presentation/views/news_screen.dart'
    as _i10;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AccountDetailsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountDetailsScreen(),
      );
    },
    AccountsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountsScreen(),
      );
    },
    AppFrame.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AppFrame(),
      );
    },
    CongeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i4.CongeScreen()),
      );
    },
    DemandeCongeRoute.name: (routeData) {
      final args = routeData.argsAs<DemandeCongeRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DemandeCongeScreen(
          key: args.key,
          onAdd: args.onAdd,
        ),
      );
    },
    EnvoiListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EnvoiListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    JournalRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.JournalScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i9.LoginScreen()),
      );
    },
    NewsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewsScreen(),
      );
    },
    SupervisorCongeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i11.SupervisorCongeScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountDetailsScreen]
class AccountDetailsRoute extends _i12.PageRouteInfo<void> {
  const AccountDetailsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AccountDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDetailsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountsScreen]
class AccountsRoute extends _i12.PageRouteInfo<void> {
  const AccountsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AccountsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AppFrame]
class AppFrame extends _i12.PageRouteInfo<void> {
  const AppFrame({List<_i12.PageRouteInfo>? children})
      : super(
          AppFrame.name,
          initialChildren: children,
        );

  static const String name = 'AppFrame';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CongeScreen]
class CongeRoute extends _i12.PageRouteInfo<void> {
  const CongeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CongeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CongeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DemandeCongeScreen]
class DemandeCongeRoute extends _i12.PageRouteInfo<DemandeCongeRouteArgs> {
  DemandeCongeRoute({
    _i13.Key? key,
    required dynamic Function(_i14.LeaveModel) onAdd,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          DemandeCongeRoute.name,
          args: DemandeCongeRouteArgs(
            key: key,
            onAdd: onAdd,
          ),
          initialChildren: children,
        );

  static const String name = 'DemandeCongeRoute';

  static const _i12.PageInfo<DemandeCongeRouteArgs> page =
      _i12.PageInfo<DemandeCongeRouteArgs>(name);
}

class DemandeCongeRouteArgs {
  const DemandeCongeRouteArgs({
    this.key,
    required this.onAdd,
  });

  final _i13.Key? key;

  final dynamic Function(_i14.LeaveModel) onAdd;

  @override
  String toString() {
    return 'DemandeCongeRouteArgs{key: $key, onAdd: $onAdd}';
  }
}

/// generated route for
/// [_i6.EnvoiListScreen]
class EnvoiListRoute extends _i12.PageRouteInfo<void> {
  const EnvoiListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EnvoiListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnvoiListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.JournalScreen]
class JournalRoute extends _i12.PageRouteInfo<void> {
  const JournalRoute({List<_i12.PageRouteInfo>? children})
      : super(
          JournalRoute.name,
          initialChildren: children,
        );

  static const String name = 'JournalRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NewsScreen]
class NewsRoute extends _i12.PageRouteInfo<void> {
  const NewsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SupervisorCongeScreen]
class SupervisorCongeRoute extends _i12.PageRouteInfo<void> {
  const SupervisorCongeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SupervisorCongeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupervisorCongeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
