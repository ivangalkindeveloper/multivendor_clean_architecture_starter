class MVSRunner<Config> {
  static Future<void> run({
    required Future<void> Function() body,
    required void Function(Object, StackTrace) onError,
  }) =>
      _run();

  static Never _run() => throw UnsupportedError("Unsupported platform");
}
