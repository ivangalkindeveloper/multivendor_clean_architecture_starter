import 'package:collection/collection.dart';

enum Environment {
  vendorOne,
  vendorTwo;

  static Environment fromString(
    String value,
  ) {
    final Environment? result = Environment.values
        .firstWhereOrNull((Environment element) => element.name == value);

    if (result == null) {
      throw ArgumentError("Unknown Environment: $value");
    }

    return result;
  }
}
