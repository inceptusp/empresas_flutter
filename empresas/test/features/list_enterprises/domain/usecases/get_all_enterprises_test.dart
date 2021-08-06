import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/features/list_enterprises/domain/usecases/get_all_enterprises.dart';
import 'package:empresas/shared/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_enterprises_test.mocks.dart';

@GenerateMocks([ListEnterprisesRepository])
main() {
  late GetAllEnterprisesUsecase usecase;
  late MockListEnterprisesRepository mockListEnterprisesRepository;

  setUp(() {
    mockListEnterprisesRepository = MockListEnterprisesRepository();
    usecase = GetAllEnterprisesUsecase(mockListEnterprisesRepository);
  });

  final List<Enterprise> tEnterprises = <Enterprise>[
    Enterprise(
      id: 1,
      ownEnterprise: false,
      name: 'superstore',
      description: 'description',
      value: 100,
      sharePrice: 100.0,
      enterpriseTypeId: 1,
      enterpriseTypeName: 'commerce',
    ),
    Enterprise(
      id: 1,
      ownEnterprise: false,
      name: 'bob restaurant',
      description: 'description',
      value: 10,
      sharePrice: 105.0,
      enterpriseTypeId: 2,
      enterpriseTypeName: 'food',
    ),
  ];

  test('Should get a list of all enterprises', () async {
    when(mockListEnterprisesRepository.getAllEnterprises()).thenAnswer(
      (_) async => Right(tEnterprises),
    );

    final result = await usecase(NoParams());

    expect(result, Right(tEnterprises));
    verify(mockListEnterprisesRepository.getAllEnterprises());
    verifyNoMoreInteractions(mockListEnterprisesRepository);
  });
}
