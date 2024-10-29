import 'package:mvs_database/mvs_database.dart';
import 'dart:async';

//TODO Starter: Repository
abstract interface class SharedRepository {
  const SharedRepository();

  FutureOr<String?> getThemeType();

  FutureOr<void> setThemeType({
    required String themeType,
  });

  FutureOr<String?> getLocaleTag();

  FutureOr<void> setLocaleTag({
    required String loclaeTag,
  });
}

class SharedRepository$ implements SharedRepository {
  static const String keyTheme = "theme";
  static const String keyLocale = "locale";

  const SharedRepository$({
    required this.sharedStorage,
  });

  final MVSSharedStorage sharedStorage;

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
