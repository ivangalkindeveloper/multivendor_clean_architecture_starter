abstract class MVSKeyValueStorage {
  String? getString({
    required String key,
  });

  Future<void> setString({
    required String key,
    required String value,
  });
}
