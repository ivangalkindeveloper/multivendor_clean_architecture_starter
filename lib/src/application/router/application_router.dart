import 'package:multivendor_clean_architecture_starter/src/application/widget/screen/fact/fact_screen.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

part 'application_router.gr.dart';

//TODO Starter: ApplicationRouter
@AutoRouterConfig()
class ApplicationRouter extends RootStackRouter {
  ApplicationRouter();

  @override
  RouteType get defaultRouteType =>
      MVSPlatformUtility.decomposeFromTarget<RouteType, RouteType, RouteType>(
        platform: defaultTargetPlatform,
        cupertino: const RouteType.cupertino(),
        material: const RouteType.material(),
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/fact",
          page: FactRoute.page,
          initial: true,
        ),
      ];
}
