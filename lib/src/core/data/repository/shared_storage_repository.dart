import 'package:mvs_database/mvs_database.dart';
import 'dart:async';

abstract class ISharedStorageRepository {
  const ISharedStorageRepository();

  FutureOr<String?> getThemeType();

  FutureOr<void> setThemeType({
    required String themeType,
  });

  FutureOr<String?> getLocaleTag();

  FutureOr<void> setLocaleTag({
    required String loclaeTag,
  });
}

class SharedStorageRepository implements ISharedStorageRepository {
  const SharedStorageRepository({
    required this.sharedStorage,
  });

  final IMVSSharedStorage sharedStorage;

  static const String keyTheme = "theme";
  static const String keyLocale = "locale";

  @override
  FutureOr<String?> getThemeType() => this.sharedStorage.getString(
        key: keyTheme,
      );

  @override
  FutureOr<void> setThemeType({
    required String themeType,
  }) =>
      this.sharedStorage.setString(
            key: keyTheme,
            value: themeType,
          );

  @override
  FutureOr<String?> getLocaleTag() => this.sharedStorage.getString(
        key: keyLocale,
      );

  @override
  FutureOr<void> setLocaleTag({
    required String loclaeTag,
  }) =>
      this.sharedStorage.setString(
            key: keyLocale,
            value: loclaeTag,
          );
}
