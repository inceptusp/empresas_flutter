import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:empresas/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:empresas/shared/domain/usecases/usecase.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:equatable/equatable.dart';

class SignInUsecase implements Usecase<Investor, SignInParams> {
  final SignInRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<Either<Failure, Investor>> call(SignInParams signInParams) async {
    return await repository.signIn(signInParams.email, signInParams.password);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
