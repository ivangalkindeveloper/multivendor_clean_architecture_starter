import 'package:flutter/widgets.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';

//TODO Starter: MVSText
class MVSText {
  static Widget regular16Black({
    required BuildContext context,
    required String text,
  }) =>
      FPCText.regular16Black(
        context: context,
        text: text,
      );

  static Widget regular16Danger({
    required BuildContext context,
    required String text,
  }) =>
      FPCText.regular16Danger(
        context: context,
        text: text,
      );

  static Widget medium16Black({
    required BuildContext context,
    required String text,
  }) =>
      FPCText.medium16Black(
        context: context,
        text: text,
      );
}
