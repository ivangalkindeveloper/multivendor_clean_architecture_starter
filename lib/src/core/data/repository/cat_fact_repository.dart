import 'package:multi_vendor_starter/src/core/data/source/database/store/fact_store.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/fact_api.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'package:drift/drift.dart';
import 'dart:async';

abstract class IFactRepository {
  const IFactRepository();

  Future<Fact> getOneRandomFact();

  Future<Fact?> getLastFact();

  Future<void> insertNewFact({
    required Fact fact,
  });

  Future<void> updateFact({
    required Fact fact,
  });
}

class FactRepository implements IFactRepository {
  const FactRepository({
    required IFactApi factApi,
    required IFactStore factStore,
  })  : this._factApi = factApi,
        this._factStore = factStore;

  final IFactApi _factApi;
  final IFactStore _factStore;

  @override
  Future<Fact> getOneRandomFact() => this._factApi.getRandomFact();

  @override
  Future<Fact?> getLastFact() async {
    final List<FactDatabase> factsDatabase = await this._factStore.get();
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
  Future<void> insertNewFact({
    required Fact fact,
  }) =>
      this._factStore.insert(
            companion: FactDatabaseTableCompanion.insert(
              factId: fact.id,
              description: fact.description,
            ),
          );

  @override
  Future<void> updateFact({
    required Fact fact,
  }) async {
    final List<FactDatabase> catFactsDatabase = await this._factStore.get();

    this._factStore.update(
          companion: FactDatabaseTableCompanion.insert(
            id: Value(catFactsDatabase.last.id),
            factId: fact.id,
            description: fact.description,
          ),
        );
  }
}
