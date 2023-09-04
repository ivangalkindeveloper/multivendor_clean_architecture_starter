library runner;

export 'package:multivendor_clean_architecture_starter/src/utility/platform/runner/runner_unsupported.dart'
    if (dart.library.io) 'package:multivendor_clean_architecture_starter/src/utility/platform/runner/runner_io.dart'
    if (dart.library.html) 'package:multivendor_clean_architecture_starter/src/utility/platform/runner/runner_web.dart';
