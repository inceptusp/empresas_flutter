import 'package:empresas/features/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:empresas/shared/errors/exceptions.dart';
import 'package:empresas/shared/errors/failure.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDatasource datasource;

  SignInRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, Investor>> signIn(String email, String password) async {
    try {
      return Right(await datasource.signIn(email, password));
    } on ServerException {
      return const Left(ServerFailure(message: 'connection_error'));
    } on ConnectionException {
      return const Left(ConnectionFailure(message: 'connection_error'));
    } on SignInFailure catch (f) {
      return Left(SignInFailure(message: f.message));
    }
  }
}
