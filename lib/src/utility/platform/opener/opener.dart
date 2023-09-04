library database_opener;

export 'package:multivendor_clean_architecture_starter/src/utility/platform/opener/opener_unsupported.dart'
    if (dart.library.io) 'package:multivendor_clean_architecture_starter/src/utility/platform/opener/opener_io.dart'
    if (dart.library.html) 'package:multivendor_clean_architecture_starter/src/utility/platform/opener/opener_web.dart';
