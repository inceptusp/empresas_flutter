import 'package:dartz/dartz.dart';
import 'package:empresas/features/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:empresas/features/sign_in/data/models/investor_model.dart';
import 'package:empresas/features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:empresas/shared/errors/exceptions.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_repository_impl_test.mocks.dart';

@GenerateMocks([SignInDatasource])
main() {
  late SignInRepositoryImpl repository;
  late MockSignInDatasource mockSignInDatasource;

  const String tEmail = 'testeapple@ioasys.com.br';
  const String tPassword = '123';
  const InvestorModel tInvestorModel = InvestorModel(
    id: 1,
    name: 'Teste Apple',
    email: 'testeapple@ioasys.com.br',
    city: 'BH',
    country: 'Brasil',
    balance: 1000000.0,
    photo: null,
    portfolioEnterprisesNumber: 0,
    portfolioEnterprises: [],
    portfolioValue: 1000000.0,
    firstAccess: false,
    superAngel: false,
  );
  const Investor tInvestor = tInvestorModel;

  setUp(() {
    mockSignInDatasource = MockSignInDatasource();
    repository = SignInRepositoryImpl(datasource: mockSignInDatasource);
  });

  group('On normal server operation', () {
    test('Should return a Investor on successful sign in', () async {
      when(mockSignInDatasource.signIn(any, any)).thenAnswer(
        (_) async => tInvestorModel,
      );

      final result = await repository.signIn(tEmail, tPassword);

      verify(mockSignInDatasource.signIn(tEmail, tPassword));
      expect(result, const Right(tInvestor));
    });
  });

  group('On failing server operation', () {
    test('Should return a ServerFailure on sign in', () async {
      when(mockSignInDatasource.signIn(any, any)).thenThrow(ServerException());

      final result = await repository.signIn(tEmail, tPassword);

      verify(mockSignInDatasource.signIn(tEmail, tPassword));
      expect(result, const Left(ServerFailure(message: 'Failure test')));
    });
  });
}
