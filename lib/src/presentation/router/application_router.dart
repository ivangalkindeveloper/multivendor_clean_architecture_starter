import 'package:multi_vendor_starter/src/presentation/view/page/fact/fact_page.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

part 'application_router.gr.dart';

//TODO Starter: ApplicationRouter
@AutoRouterConfig(
  replaceInRouteName: "Screen, Page, Route",
)
class ApplicationRouter extends _$ApplicationRouter {
  ApplicationRouter();

  @override
  RouteType get defaultRouteType =>
      FPCPlatformUtil.decompose<RouteType, RouteType, RouteType>(
        platform: FPCPlatform.values.fromTargetPlatform(defaultTargetPlatform),
        cupertino: const RouteType.cupertino(),
        material: const RouteType.material(),
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/fact",
          page: FactPageRoute.page,
          initial: true,
        ),
      ];
}
