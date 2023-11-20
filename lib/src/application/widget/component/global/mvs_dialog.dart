import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: showMVSDialog
Future<T?> showMVSDialog<T>({
  required BuildContext context,
  required Widget child,
}) =>
    showFPCDialog<T>(
      context,
      child: child,
    );
