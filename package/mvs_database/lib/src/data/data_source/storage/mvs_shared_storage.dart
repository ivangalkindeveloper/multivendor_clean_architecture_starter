import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

abstract class IMVSSharedStorage {
  FutureOr<void> init();

  String? getString({
    required String key,
  });

  FutureOr<void> setString({
    required String key,
    required String value,
  });
}

class MVSSharedStorage implements IMVSSharedStorage {
  MVSSharedStorage();

  late final SharedPreferences _sharedPreferences;

  @override
  FutureOr<void> init() async {
    this._sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String? getString({
    required String key,
  }) =>
      this._sharedPreferences.getString(key);

  @override
  FutureOr<void> setString({
    required String key,
    required String value,
  }) =>
      this._sharedPreferences.setString(
            key,
            value,
          );
}
