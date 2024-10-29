import 'package:mvs_database/src/storage/mvs_key_value_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

abstract interface class MVSSharedStorage extends MVSKeyValueStorage {
  Future<void> init();
}

class MVSSharedStorage$ implements MVSSharedStorage {
  MVSSharedStorage$();

  late final SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    this._sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String? getString({
    required String key,
  }) =>
      this._sharedPreferences.getString(key);

  @override
  Future<void> setString({
    required String key,
    required String value,
  }) =>
      this._sharedPreferences.setString(
            key,
            value,
          );
}
