import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

/// The configuration of app routes.
@AutoRouterConfig(
  replaceInRouteName: 'Screen, Route',
)
class ApplicationRouter extends _$AppRouter {
  const ApplicationRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: FirstPageRoute.page,
          path: "/first_page",
        ),
      ];
}
