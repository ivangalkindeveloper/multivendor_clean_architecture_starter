import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

mixin MVSSmallBottomSheetMixin<T> on Widget {
  Future<T?> show(
    BuildContext context, {
    bool useRootNavigator = false,
    Color? barrierColor,
  }) =>
      showFPCSmallBottomSheet<T>(
        context,
        useRootNavigator: useRootNavigator,
        barrierColor: barrierColor,
        child: this,
      );
}
