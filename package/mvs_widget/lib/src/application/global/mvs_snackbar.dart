import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: showMVSSnackbar
void showMVSSnackbar(
  BuildContext context, {
  required Widget child,
}) =>
    showFPCSnackBar(
      context,
      child: child,
    );
