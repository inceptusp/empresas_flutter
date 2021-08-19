import 'package:empresas/features/list_enterprises/data/datasource/list_enterprises_datasource.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/shared/errors/exceptions.dart';
import 'package:empresas/shared/errors/failure.dart';

class ListEnterprisesRepositoryImpl implements ListEnterprisesRepository {
  final ListEnterprisesDatasource datasource;

  ListEnterprisesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<Enterprise>>> getAllEnterprises() async {
    try {
      return Right(await datasource.getAllEnterprises());
    } on ServerException catch (_) {
      return const Left(ServerFailure(message: 'connection_error'));
    }
  }

  @override
  Future<Either<Failure, List<Enterprise>>> searchEnterprises(String query) async {
    try {
      return Right(await datasource.searchEnterprises(query));
    } on ServerException catch (_) {
      return const Left(ServerFailure(message: 'connection_error'));
    }
  }
}
