import 'package:url_strategy/url_strategy.dart';
import 'dart:async';

class MVSRunner {
  const MVSRunner({
    required this.body,
    required this.onError,
  });

  final Future<void> Function() body;
  final void Function(Object, StackTrace) onError;

  Future<void> run() async {
    setPathUrlStrategy();

    return runZonedGuarded<Future<void>>(
      body,
      onError,
    );
  }
}
