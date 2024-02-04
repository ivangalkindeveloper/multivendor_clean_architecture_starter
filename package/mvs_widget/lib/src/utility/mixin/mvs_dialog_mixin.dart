import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

mixin MVSDialogMixin<T> on Widget {
  Future<T?> show(
    BuildContext context, {
    bool useRootNavigator = false,
    Color? barrierColor,
  }) =>
      showFPCDialog<T>(
        context,
        useRootNavigator: useRootNavigator,
        barrierColor: barrierColor,
        child: this,
      );
}
