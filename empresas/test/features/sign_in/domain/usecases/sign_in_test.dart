import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:empresas/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:empresas/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_test.mocks.dart';

@GenerateMocks([SignInRepository])
main() {
  late SignInUsecase usecase;
  late MockSignInRepository mockSignInRepository;

  setUp(() {
    mockSignInRepository = MockSignInRepository();
    usecase = SignInUsecase(mockSignInRepository);
  });

  final String tEmail = 'bob@bob.com';
  final String tPassword = '12341234';
  final Investor tInvestor = Investor(
    id: 1,
    name: 'bob',
    email: 'bob@bob.com',
    city: 'bobland',
    country: 'bobstan',
    balance: 100.0,
    portfolioEnterprisesNumber: 0,
    portfolioEnterprises: [],
    portfolioValue: 0,
    firstAccess: false,
    superAngel: false,
  );

  test('Should successfully sign in', () async {
    when(mockSignInRepository.signIn(any, any)).thenAnswer(
      (_) async => Right(tInvestor),
    );

    final result = await usecase(SignInParams(email: tEmail, password: tPassword));

    expect(result, Right(tInvestor));
    verify(mockSignInRepository.signIn(tEmail, tPassword));
    verifyNoMoreInteractions(mockSignInRepository);
  });

  test('Should return a SignInFailure on unsuccessful sign in', () async {
    final Failure tFailure = SignInFailure(message: 'Wrong Credentials');
    when(mockSignInRepository.signIn(any, any)).thenAnswer(
      (_) async => Left(tFailure),
    );

    final result = await usecase(SignInParams(email: tEmail, password: tPassword));

    expect(result, Left(tFailure));
    verify(mockSignInRepository.signIn(tEmail, tPassword));
    verifyNoMoreInteractions(mockSignInRepository);
  });
}
