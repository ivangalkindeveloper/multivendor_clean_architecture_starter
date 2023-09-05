import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/material.dart';

//TODO Starter: showMVSDatePicker
Future<DateTime?> showMVSDatePicker({
  required BuildContext context,
  required Widget Function(BuildContext) cupertinoModalBuilder,
}) =>
    showFPCDatePicker(
      context: context,
      cupertinoModalBuilder: cupertinoModalBuilder,
    );

//TODO Starter: showMVSTimePicker
Future<TimeOfDay?> showMVSTimePicker({
  required BuildContext context,
  required Widget Function(BuildContext) cupertinoModalBuilder,
}) =>
    showFPCTimePicker(
      context: context,
      cupertinoModalBuilder: cupertinoModalBuilder,
    );
