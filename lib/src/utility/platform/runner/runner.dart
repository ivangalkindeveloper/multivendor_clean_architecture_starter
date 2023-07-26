library runner;

export 'package:multi_vendor_starter/src/utility/platform/runner/runner_unsupported.dart'
    if (dart.library.io) 'package:multi_vendor_starter/src/utility/platform/runner/runner_io.dart'
    if (dart.library.html) 'package:multi_vendor_starter/src/utility/platform/runner/runner_web.dart';
