library mvs_database_opener;

export 'mvs_database_opener_unsupported.dart'
    if (dart.library.io) 'mvs_database_opener_io.dart'
    if (dart.library.html) 'mvs_database_opener_web.dart';
