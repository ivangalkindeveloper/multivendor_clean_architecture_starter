import 'dart:async';

class MVSRunner {
  static Future<void> run({
    required Future<void> Function() body,
    required void Function(Object, StackTrace) onError,
  }) =>
      runZonedGuarded<Future<void>>(
        body,
        onError,
      )!;
}
