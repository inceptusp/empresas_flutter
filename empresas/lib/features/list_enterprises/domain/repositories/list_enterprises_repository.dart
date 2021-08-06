import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/shared/utils/failure.dart';

abstract class ListEnterprisesRepository {
  Future<Either<Failure, List<Enterprise>>> searchEnterprises(String query);

  Future<Either<Failure, List<Enterprise>>> getAllEnterprises();
}
