import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/material.dart';

//TODO Starter: MVSScreenAppBar
class MVSScreenAppBar extends FPCScreenAppBar {
  MVSScreenAppBar({
    super.key,
    required BuildContext context,
    String? title,
  }) : super(
          context: context,
          title: title,
        );
}
