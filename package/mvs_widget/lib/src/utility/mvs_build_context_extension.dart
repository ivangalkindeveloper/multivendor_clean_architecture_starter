import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

extension MVSBuildContextExtension on BuildContext {
  void changeTheme(
    MVSTheme theme,
  ) =>
      this.fpcChangeTheme(
        theme,
      );

  MVSAnimation get mvsAnimation => this.fpcAnimation as MVSAnimation;
  MVSDateTime get mvsDateTime => this.fpcDateTime as MVSDateTime;
  MVSDuration get mvsDuration => this.fpcDuration as MVSDuration;
  MVSFont get mvsFont => this.fpcFont as MVSFont;
  MVSHaptic get mvsHaptic => this.fpcHaptic as MVSHaptic;
  MVSSize get mvsSize => this.fpcSize as MVSSize;
  MVSTimeOfDay get mvsTimeOfDay => this.fpcTimeOfDay as MVSTimeOfDay;
  MVSTheme get mvsTheme => this.fpcTheme as MVSTheme;
}
