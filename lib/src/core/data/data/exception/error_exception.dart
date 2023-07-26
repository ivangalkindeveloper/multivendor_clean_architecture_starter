//TODO Starter: ErrorException
class ErrorException implements Exception {
  const ErrorException({
    required this.message,
  });

  final String message;
}
