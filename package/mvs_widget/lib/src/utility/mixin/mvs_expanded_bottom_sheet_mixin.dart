import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

mixin MVSExpandedBottomSheetMixin<T> on Widget {
  Future<T?> show(
    BuildContext context, {
    bool useRootNavigator = false,
    Color? barrierColor,
    BorderRadius? borderRadius,
  }) =>
      showFPCExpandedBottomSheet<T>(
        context,
        useRootNavigator: useRootNavigator,
        barrierColor: barrierColor,
        borderRadius: borderRadius,
        child: this,
      );
}
