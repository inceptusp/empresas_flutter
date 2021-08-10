import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:empresas/shared/errors/failure.dart';

abstract class SignInRepository {
  Future<Either<Failure, Investor>> signIn(String email, String password);
}
