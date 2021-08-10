import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/shared/domain/usecases/usecase.dart';
import 'package:empresas/shared/errors/failure.dart';

class GetAllEnterprisesUsecase implements Usecase<List<Enterprise>, NoParams> {
  final ListEnterprisesRepository repository;

  GetAllEnterprisesUsecase(this.repository);

  Future<Either<Failure, List<Enterprise>>> call(NoParams noParams) async {
    return await repository.getAllEnterprises();
  }
}
