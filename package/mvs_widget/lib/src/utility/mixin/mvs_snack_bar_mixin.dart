import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart'
    show SnackBar, ScaffoldFeatureController, SnackBarClosedReason;

mixin MVSSnackBarMixin on Widget {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    EdgeInsets? padding,
    Duration? duration,
  }) =>
      showFPCSnackBar(
        context,
        padding: padding,
        duration: duration,
        child: this,
      );
}
