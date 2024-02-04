import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

class MVSPlatformUtility {
  static T decomposeFromTarget<T, Cupertino extends T, Material extends T>({
    required TargetPlatform platform,
    required Cupertino cupertino,
    required Material material,
  }) =>
      FPCPlatformUtility.decomposeFromTarget(
        platform: platform,
        cupertino: cupertino,
        material: material,
      );

  static T decomposeFromContext<T, Cupertino extends T, Material extends T>({
    required BuildContext context,
    required Cupertino cupertino,
    required Material material,
  }) =>
      FPCPlatformUtility.decomposeFromContext(
        context: context,
        cupertino: cupertino,
        material: material,
      );
}
