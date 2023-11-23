// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'application_router.dart';

abstract class _$ApplicationRouter extends RootStackRouter {
  // ignore: unused_element
  _$ApplicationRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FactRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FactScreen(),
      );
    }
  };
}

/// generated route for
/// [FactScreen]
class FactRoute extends PageRouteInfo<void> {
  const FactRoute({List<PageRouteInfo>? children})
      : super(
          FactRoute.name,
          initialChildren: children,
        );

  static const String name = 'FactRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
