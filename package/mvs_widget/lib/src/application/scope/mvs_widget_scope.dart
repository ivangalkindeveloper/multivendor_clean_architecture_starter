import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

class MVSWidgetScope extends StatelessWidget {
  const MVSWidgetScope({
    super.key,
    required this.animation,
    required this.timeOfDay,
    required this.dateTime,
    required this.duration,
    required this.haptic,
    required this.theme,
    required this.size,
    required this.font,
    required this.child,
  });

  final MVSAnimation animation;
  final MVSTimeOfDay timeOfDay;
  final MVSDateTime dateTime;
  final MVSDuration duration;
  final MVSHaptic haptic;
  final MVSTheme theme;
  final MVSSize size;
  final MVSFont font;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlutterPlatformComponent(
      animation: this.animation,
      timeOfDay: this.timeOfDay,
      dateTime: this.dateTime,
      duration: this.duration,
      haptic: this.haptic,
      theme: this.theme,
      size: this.size,
      font: this.font,
      child: this.child,
    );
  }
}
