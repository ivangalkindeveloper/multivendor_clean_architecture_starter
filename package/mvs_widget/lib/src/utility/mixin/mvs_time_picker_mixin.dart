import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' show TimeOfDay;

mixin MVSTimePickerMixin on Widget {
  Future<TimeOfDay?> show(
    BuildContext context, {
    bool useRootNavigator = false,
    FPCTimeOfDayRange? timeOfDayRange,
    required Widget Function(BuildContext) cupertinoBottomSheetBuilder,
    Color? barrierColor,
  }) =>
      showFPCTimePicker(
        context,
        useRootNavigator: useRootNavigator,
        timeOfDayRange: timeOfDayRange,
        cupertinoBottomSheetBuilder: cupertinoBottomSheetBuilder,
        barrierColor: barrierColor,
      );
}
