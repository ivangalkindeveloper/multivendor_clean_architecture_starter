import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/dao/dao.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/fact_api.dart';
import 'package:multi_vendor_starter/src/core/data/data/fact/fact_dto.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact/fact.dart';
import 'dart:async';

abstract class IFactRepository {
  const IFactRepository();

  Future<Fact> getOneRandomFact();

  Future<Fact?> getLastFact();

  Future<void> insertFact({
    required Fact fact,
  });
}

class FactRepository implements IFactRepository {
  const FactRepository({
    required IFactApi factApi,
    required IDao<FactDatabaseTableData> factDao,
  })  : this._factApi = factApi,
        this._factDao = factDao;

  final IFactApi _factApi;
  final IDao<FactDatabaseTableData> _factDao;

  @override
  Future<Fact> getOneRandomFact() async {
    final FactDto factorDto = await this._factApi.getRandomFact();

    return Fact(
      id: factorDto.id,
      description: factorDto.description,
    );
  }

  @override
  Future<Fact?> getLastFact() async {
    final List<FactDatabaseTableData> factsDatabaseData =
        await this._factDao.get();
    if (factsDatabaseData.isEmpty) {
      return null;
    }

    final FactDatabaseTableData lastFactDatabase = factsDatabaseData.last;

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
            companion: FactDatabaseTableCompanion.insert(
              factId: fact.id,
              timestamp: DateTime.timestamp(),
              description: fact.description,
            ),
          );
}