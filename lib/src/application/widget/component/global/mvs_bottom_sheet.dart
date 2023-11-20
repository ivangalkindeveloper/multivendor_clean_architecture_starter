import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: showMVSExpandedBottomSheet
Future<T?> showMVSExpandedBottomSheet<T>({
  required BuildContext context,
  required Widget child,
}) =>
    showFPCExpandedBottomSheet<T>(
      context,
      child: child,
    );

Future<T?> showMVSSmallBottomSheet<T>({
  required BuildContext context,
  required Widget child,
}) =>
    showFPCSmallBottomSheet<T>(
      context,
      child: child,
    );
