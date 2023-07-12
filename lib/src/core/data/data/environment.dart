enum Environment {
  vendorOne,
  vendorTwo;

  static Environment fromString(
    String value,
  ) {
    switch (value) {
      case "vendorOne":
        return vendorOne;
      case "vendorTwo":
        return vendorTwo;
      default:
        throw ArgumentError("Unknown Environment: $value");
    }
  }
}
