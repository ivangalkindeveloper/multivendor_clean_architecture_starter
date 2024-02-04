import 'package:url_strategy/url_strategy.dart';
import 'dart:async';

class MVSRunner {
  static Future<void> run({
    required Future<void> Function() body,
    required void Function(Object, StackTrace) onError,
  }) async {
    setPathUrlStrategy();

    return runZonedGuarded<Future<void>>(
      body,
      onError,
    );
  }
}
