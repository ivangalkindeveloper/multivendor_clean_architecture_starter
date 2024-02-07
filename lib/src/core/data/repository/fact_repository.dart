import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact_bo.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'dart:async';

//TODO Starter: IRepository
abstract class IFactRepository {
  const IFactRepository();

  Future<FactBO> getOneRandomFact();

  Future<FactBO?> getLastFact();

  Future<void> insertFact({
    required FactBO fact,
  });
}

class FactRepository implements IFactRepository {
  const FactRepository({
    required IMVSFactAPI factAPI,
    required IMVSDAO<MVSFactDatabaseTableData> factDAO,
  })  : this._factAPI = factAPI,
        this._factDAO = factDAO;

  final IMVSFactAPI _factAPI;
  final IMVSDAO<MVSFactDatabaseTableData> _factDAO;

  @override
  Future<FactBO> getOneRandomFact() async {
    final MVSFactDto factorDto = await this._factAPI.getRandomFact();

    return FactBO(
      id: factorDto.id,
      description: factorDto.description,
    );
  }

  @override
  Future<FactBO?> getLastFact() async {
    final List<MVSFactDatabaseTableData> factsDatabaseData =
        await this._factDAO.get();
    if (factsDatabaseData.isEmpty) {
      return null;
    }

    final MVSFactDatabaseTableData lastFactDatabase = factsDatabaseData.last;

    return FactBO(
      id: lastFactDatabase.factId,
      description: lastFactDatabase.description,
    );
  }

  @override
  Future<void> insertFact({
    required FactBO fact,
  }) =>
      this._factDAO.insert(
            companion: MVSFactDatabaseTableCompanion.insert(
              factId: fact.id,
              timestamp: DateTime.timestamp(),
              description: fact.description,
            ),
          );
}
