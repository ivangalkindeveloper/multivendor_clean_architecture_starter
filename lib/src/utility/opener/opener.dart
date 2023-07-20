library database_opener;

export 'package:multi_vendor_starter/src/utility/opener/opener_unsupported.dart'
    if (dart.library.io) 'package:multi_vendor_starter/src/core/utility/opener/opener_io.dart'
    if (dart.library.html) 'package:multi_vendor_starter/src/core/utility/opener/opener_web.dart';
