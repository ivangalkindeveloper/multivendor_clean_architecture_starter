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
    FactPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FactPage(),
      );
    }
  };
}

/// generated route for
/// [FactPage]
class FactPageRoute extends PageRouteInfo<void> {
  const FactPageRoute({List<PageRouteInfo>? children})
      : super(
          FactPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FactPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
