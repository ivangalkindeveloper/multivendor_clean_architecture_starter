final class MVSRunner {
  const MVSRunner({
    required this.body,
    required this.onError,
  });

  final Future<void> Function() body;
  final void Function(Object, StackTrace) onError;

  Future<void> run() => _run();

  static Never _run() => throw UnsupportedError("Unsupported platform");
}
