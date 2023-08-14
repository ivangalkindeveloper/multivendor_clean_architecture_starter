import 'package:collection/collection.dart';

//TODO Starter: Environment
enum Environment {
  vendorCat,
  vendorDog;

  static Environment fromString(
    String value,
  ) {
    final Environment? result = Environment.values.firstWhereOrNull(
      (Environment element) => element.name == value,
    );

    if (result == null) {
      throw ArgumentError("Unknown Environment: $value");
    }

    return result;
  }
}
