import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:empresas/shared/utils/failure.dart';
import 'package:equatable/equatable.dart';

abstract class SignInRepository extends Equatable {
  Future<Either<Failure, Investor>> signIn(String email, String password);
}
