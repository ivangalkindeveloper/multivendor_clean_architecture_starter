import 'package:drift/drift.dart';

abstract class MVSDao<T> {
  Future<List<T>> get();

  Stream<List<T>> watch();

  Future<int> insert({
    required UpdateCompanion<T> companion,
  });

  Future<bool> update({
    required UpdateCompanion<T> companion,
  });

  Future<int> delete({
    required UpdateCompanion<T> companion,
  });
}
