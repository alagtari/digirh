import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
        ),
        CustomRoute(
          page: AppFrame.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              page: HomeRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              initial: true,
            ),
            CustomRoute(
              page: CongeRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: SupervisorCongeRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            AutoRoute(
              page: DemandeCongeRoute.page,
            ),
            CustomRoute(
              page: AccountsRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            AutoRoute(
              page: AccountDetailsRoute.page,
            ),
            AutoRoute(
              page: EnvoiListRoute.page,
            ),
            AutoRoute(
              page: NewsRoute.page,
            ),
            CustomRoute(
              page: JournalRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
      ];
}
