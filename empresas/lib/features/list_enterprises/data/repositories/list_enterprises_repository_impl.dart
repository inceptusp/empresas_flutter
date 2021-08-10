import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/shared/errors/failure.dart';

class ListEnterprisesRepositoryImpl implements ListEnterprisesRepository {
  @override
  Future<Either<Failure, List<Enterprise>>> getAllEnterprises() {
    // TODO: implement getAllEnterprises
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Enterprise>>> searchEnterprises(String query) {
    // TODO: implement searchEnterprises
    throw UnimplementedError();
  }
}
