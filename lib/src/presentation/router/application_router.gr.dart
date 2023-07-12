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
    InitialPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialPage(),
      );
    }
  };
}

/// generated route for
/// [InitialPage]
class InitialPageRoute extends PageRouteInfo<void> {
  const InitialPageRoute({List<PageRouteInfo>? children})
      : super(
          InitialPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
