import 'package:multi_vendor_starter/src/core/domain/entity/domain_entity.dart';
import 'dart:async';

abstract class IRepository {
  const IRepository();

  FutureOr<DomainEntity> getEntity();
}

class Repository implements IRepository {
  const Repository();

  @override
  FutureOr<DomainEntity> getEntity() => const DomainEntity(
        name: "Name",
      );
}
