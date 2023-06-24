import 'package:multi_vendor_starter/src/core/data/implementation/enum.dart';

abstract class IConfig {
  const IConfig();

  abstract final Environment environment;

  abstract final String baseUrl;
  abstract final String apiController;
}
