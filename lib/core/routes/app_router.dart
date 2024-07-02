import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        CustomRoute(
          page: AppFrame.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              page: HomeRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              initial: true,
            ),
            AutoRoute(
              page: EnvoiListRoute.page,
            ),
             AutoRoute(
              page: NewsRoute.page,
            ),
          ],
        ),
      ];
}
