import 'dart:async';

final class MVSRunner {
  const MVSRunner({
    required this.body,
    required this.onError,
  });

  final Future<void> Function() body;
  final void Function(Object, StackTrace) onError;

  Future<void> run() => runZonedGuarded<Future<void>>(
        body,
        onError,
      )!;
}
