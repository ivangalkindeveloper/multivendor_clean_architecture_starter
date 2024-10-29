import 'package:flutter/material.dart';
import 'package:l/l.dart';

extension on LogLevel {
  /// Emoji for each log level
  String get emoji => maybeWhen(
        shout: () => '❗️',
        error: () => '🚫',
        warning: () => '⚠️',
        info: () => '💡',
        debug: () => '🐞',
        orElse: () => '📌',
      );
}

//TODO Starter: DateTimeExtension
extension DateTimeExtension on DateTime {
  /// Transforms DateTime to String with format: 00:00:00
  String get formatted =>
      [hour, minute, second].map(MVSLogger.timeFormat).join(':');
}

class MVSLogger {
  static void i(Object message) => l.i(message);

  static void w(Object message, [StackTrace? stackTrace]) =>
      l.w(message, stackTrace);

  static void e(Object message, [StackTrace? stackTrace]) =>
      l.e(message, stackTrace);

  static void d(Object message) => l.d(message);

  /// How much digits there should be in the time
  static const int timeLength = 2;

  /// Log options for the [L] library
  static const LogOptions _logOptions = LogOptions(
    printColors: false,
    messageFormatting: _formatLoggerMessage,
  );

  /// Formats the time to have [timeLength] digits
  static String timeFormat(int input) =>
      input.toString().padLeft(timeLength, '0');

  /// Formats the message for the [L] library
  static String _formatLoggerMessage(
    Object message,
    LogLevel logLevel,
    DateTime now,
  ) =>
      '${logLevel.emoji} ${now.formatted} | $message';

  /// Formats the error message for the [L] library
  ///
  /// If [stackTrace] is null then we get the stack trace from the
  /// [StackTrace.current].
  ///
  /// Builds error through [StringBuffer] and returns it.
  static String _formatError(
    String type,
    String error,
    StackTrace? stackTrace,
  ) {
    final StackTrace trace = stackTrace ?? StackTrace.current;

    final StringBuffer buffer = StringBuffer(type)
      ..write(' error: ')
      ..writeln(error)
      ..writeln('Stack trace:')
      ..write(trace.toString());

    return buffer.toString();
  }

  /// Helper static method to log a zone error
  ///
  /// later, it would be send to the sentry
  static void logZoneError(
    Object? e,
    StackTrace s,
  ) =>
      l.e(_formatError('Top-level', e.toString(), s), s);

  /// Helper static method to log a flutter error [FlutterError.onError]
  /// like widget overflow, etc.
  static void logFlutterError(
    FlutterErrorDetails details,
  ) =>
      l.e(
        _formatError('Flutter', details.exceptionAsString(), details.stack),
        details.stack,
      );

  /// Helper static method to log a platform dispatcher error
  /// like native code errors
  static bool logPlatformDispatcherError(
      Object exception, StackTrace stackTrace) {
    l.e(
      _formatError('PlatformDispatcher', exception.toString(), stackTrace),
      stackTrace,
    );
    return true;
  }

  /// run in a zone
  static T runLogging<T>(T Function() body) => l.capture(body, _logOptions);
}
