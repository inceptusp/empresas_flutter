import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:empresas/shared/errors/failure.dart';

class SignInRepositoryImpl implements SignInRepository {
  @override
  Future<Either<Failure, Investor>> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
