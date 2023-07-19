import 'package:multi_vendor_starter/src/core/data/source/database/storage/fact_storage.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/fact_api.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'package:drift/drift.dart';
import 'dart:async';

abstract class IFactRepository {
  const IFactRepository();

  Future<Fact> getOneRandomFact();

  Future<Fact?> getLastFact();

  Future<void> insertFact({
    required Fact fact,
  });

  Future<void> updateLastFact({
    required Fact fact,
  });
}

class FactRepository implements IFactRepository {
  const FactRepository({
    required IFactApi factApi,
    required IFactStorage factStorage,
  })  : this._factApi = factApi,
        this._factStorage = factStorage;

  final IFactApi _factApi;
  final IFactStorage _factStorage;

  @override
  Future<Fact> getOneRandomFact() => this._factApi.getRandomFact();

  @override
  Future<Fact?> getLastFact() async {
    final List<FactDatabase> factsDatabase = await this._factStorage.get();
    if (factsDatabase.isEmpty) {
      return null;
    }

    final FactDatabase lastFactDatabase = factsDatabase.last;

    return Fact(
      id: lastFactDatabase.factId,
      description: lastFactDatabase.description,
    );
  }

  @override
  Future<void> insertFact({
    required Fact fact,
  }) =>
      this._factStorage.insert(
            companion: FactDatabaseTableCompanion.insert(
              factId: fact.id,
              description: fact.description,
            ),
          );

  @override
  Future<void> updateLastFact({
    required Fact fact,
  }) async {
    final List<FactDatabase> factsDatabase = await this._factStorage.get();

    this._factStorage.update(
          companion: FactDatabaseTableCompanion.insert(
            id: Value(factsDatabase.last.id),
            factId: fact.id,
            description: fact.description,
          ),
        );
  }
}
