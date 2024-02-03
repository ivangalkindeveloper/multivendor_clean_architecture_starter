import 'dart:async';

class MVSInitializationStep<Config, Progress> {
  const MVSInitializationStep({
    required this.title,
    required this.initialize,
  });

  final String title;
  final FutureOr<void> Function(
    Config config,
    Progress progress,
  ) initialize;
}
