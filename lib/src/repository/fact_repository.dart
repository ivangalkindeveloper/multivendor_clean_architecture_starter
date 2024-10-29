import 'package:multivendor_clean_architecture_starter/src/domain/entity/fact.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'dart:async';

//TODO Starter: Repository
abstract interface class FactRepository {
  const FactRepository();

  FutureOr<Fact> getOneRandomFact();

  FutureOr<Fact?> getLastFact();

  FutureOr<void> insertFact({
    required Fact fact,
  });
}

final class FactRepository$ implements FactRepository {
  const FactRepository$({
    required MVSFactApi factApi,
    required MVSDao<MVSFactDatabaseTableData> factDao,
  })  : this._factApi = factApi,
        this._factDao = factDao;

  final MVSFactApi _factApi;
  final MVSDao<MVSFactDatabaseTableData> _factDao;

  @override
  Future<Fact> getOneRandomFact() async {
    final MVSFactDto factorDto = await this._factApi.getRandomFact();

    return Fact(
      id: factorDto.id,
      description: factorDto.description,
    );
  }

  @override
  Future<Fact?> getLastFact() async {
    final List<MVSFactDatabaseTableData> factsDatabaseData =
        await this._factDao.get();
    if (factsDatabaseData.isEmpty) {
      return null;
    }

    final MVSFactDatabaseTableData lastFactDatabase = factsDatabaseData.last;

    return Fact(
      id: lastFactDatabase.factId,
      description: lastFactDatabase.description,
    );
  }

  @override
  Future<void> insertFact({
    required Fact fact,
  }) =>
      this._factDao.insert(
            companion: MVSFactDatabaseTableCompanion.insert(
              factId: fact.id,
              timestamp: DateTime.timestamp(),
              description: fact.description,
            ),
          );
}
