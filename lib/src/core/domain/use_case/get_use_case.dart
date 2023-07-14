import 'package:multi_vendor_starter/src/core/data/repository/repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/domain_entity.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/use_case.dart';
import 'dart:async';

class GetUseCase implements IUseCase<DomainEntity> {
  const GetUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  FutureOr<DomainEntity> execute() => this.repository.getEntity();
}
