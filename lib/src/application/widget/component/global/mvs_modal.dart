import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: showMVSExpandedModal
Future<T?> showMVSExpandedModal<T>({
  required BuildContext context,
  required Widget child,
}) =>
    showFPCExpandedModal<T>(
      context: context,
      child: child,
    );

Future<T?> showMVSPopUpModal<T>({
  required BuildContext context,
  required Widget child,
}) =>
    showFPCPopUpModal<T>(
      context: context,
      child: child,
    );
