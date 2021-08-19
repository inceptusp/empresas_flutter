import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/data/datasource/list_enterprises_datasource.dart';
import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:empresas/features/list_enterprises/data/repositories/list_enterprises_repository_impl.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/shared/errors/exceptions.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'list_enterprises_repository_impl_test.mocks.dart';

@GenerateMocks([ListEnterprisesDatasource])
main() {
  late ListEnterprisesRepositoryImpl repository;
  late MockListEnterprisesDatasource mockListEnterprisesDatasource;

  String tQuery = 'Superstore';
  List<EnterpriseModel> tEnterpriseModelList = <EnterpriseModel>[
    const EnterpriseModel(
      id: 1,
      ownEnterprise: false,
      name: 'Superstore',
      description: 'Description test',
      city: 'Bristol',
      country: 'UK',
      value: 100,
      sharePrice: 100.0,
      enterpriseTypeId: 1,
      enterpriseTypeName: 'Commerce',
    ),
  ];
  List<Enterprise> tEnterpriseList = tEnterpriseModelList;

  setUp(() {
    mockListEnterprisesDatasource = MockListEnterprisesDatasource();
    repository = ListEnterprisesRepositoryImpl(datasource: mockListEnterprisesDatasource);
  });

  group('On normal server operation', () {
    test('Should return a list of searched enterprises', () async {
      when(mockListEnterprisesDatasource.searchEnterprises(any)).thenAnswer(
        (_) async => tEnterpriseModelList,
      );

      final result = await repository.searchEnterprises(tQuery);

      verify(mockListEnterprisesDatasource.searchEnterprises(tQuery));
      expect(result, Right(tEnterpriseList));
    });

    test('Should return a list of all enterprises', () async {
      when(mockListEnterprisesDatasource.getAllEnterprises()).thenAnswer(
        (_) async => tEnterpriseModelList,
      );

      final result = await repository.getAllEnterprises();

      verify(mockListEnterprisesDatasource.getAllEnterprises());
      expect(result, Right(tEnterpriseList));
    });
  });

  group('On failing server operation', () {
    test('Should return a ServerFailure on searched enterprises', () async {
      when(mockListEnterprisesDatasource.searchEnterprises(any)).thenThrow(ServerException());

      final result = await repository.searchEnterprises(tQuery);

      verify(mockListEnterprisesDatasource.searchEnterprises(tQuery));
      expect(result, const Left(ServerFailure(message: 'Failure test')));
    });

    test('Should return a ServerFailure on all enterprises listing', () async {
      when(mockListEnterprisesDatasource.getAllEnterprises()).thenThrow(ServerException());

      final result = await repository.getAllEnterprises();

      verify(mockListEnterprisesDatasource.getAllEnterprises());
      expect(result, const Left(ServerFailure(message: 'Failure test')));
    });
  });
}
