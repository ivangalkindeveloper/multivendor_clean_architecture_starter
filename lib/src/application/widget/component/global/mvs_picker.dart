import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/material.dart';

//TODO Starter: showMVSDatePicker
Future<DateTime?> showMVSDatePicker(
  BuildContext context, {
  required Widget Function(BuildContext) cupertinoBottomSheetBuilder,
}) =>
    showFPCDatePicker(
      context,
      cupertinoBottomSheetBuilder: cupertinoBottomSheetBuilder,
    );

//TODO Starter: showMVSTimePicker
Future<TimeOfDay?> showMVSTimePicker({
  required BuildContext context,
  required Widget Function(BuildContext) cupertinoBottomSheetBuilder,
}) =>
    showFPCTimePicker(
      context,
      cupertinoBottomSheetBuilder: cupertinoBottomSheetBuilder,
    );
