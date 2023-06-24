import 'package:multi_vendor_starter/src/core/data/implementation/enum.dart';
import 'package:multi_vendor_starter/src/core/data/interface/config.dart';

class VendorOneConfig implements IConfig {
  const VendorOneConfig();

  @override
  final Environment environment = Environment.vendorOne;

  @override
  final String baseUrl = "https://vendor-one.com";
  @override
  final String apiController = "/api/v1";
}
