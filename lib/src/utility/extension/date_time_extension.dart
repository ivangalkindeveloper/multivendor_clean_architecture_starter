import 'package:multivendor_clean_architecture_starter/src/utility/logger/logger.dart';

//TODO Starter: DateTimeExtension
extension DateTimeExtension on DateTime {
  /// Transforms DateTime to String with format: 00:00:00
  String get formatted =>
      [hour, minute, second].map(Logger.timeFormat).join(':');
}
