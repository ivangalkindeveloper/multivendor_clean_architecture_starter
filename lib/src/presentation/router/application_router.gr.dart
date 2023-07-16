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
    CatFactPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CatFactPage(),
      );
    }
  };
}

/// generated route for
/// [CatFactPage]
class CatFactPageRoute extends PageRouteInfo<void> {
  const CatFactPageRoute({List<PageRouteInfo>? children})
      : super(
          CatFactPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatFactPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
