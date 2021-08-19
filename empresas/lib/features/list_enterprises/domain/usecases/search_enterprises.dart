import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/shared/domain/usecases/usecase.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:equatable/equatable.dart';

class SearchEnterprisesUsecase implements Usecase<List<Enterprise>, SearchParams> {
  final ListEnterprisesRepository repository;

  SearchEnterprisesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Enterprise>>> call(SearchParams searchParams) async {
    return await repository.searchEnterprises(searchParams.query);
  }
}

class SearchParams extends Equatable {
  final String query;

  const SearchParams({required this.query});

  @override
  List<Object?> get props => <Object>[query];
}
