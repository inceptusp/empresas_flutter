import 'package:dartz/dartz.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/features/list_enterprises/domain/usecases/search_enterprises.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_enterprises_test.mocks.dart';

@GenerateMocks([ListEnterprisesRepository])
main() {
  late SearchEnterprisesUsecase usecase;
  late MockListEnterprisesRepository mockListEnterprisesRepository;

  setUp(() {
    mockListEnterprisesRepository = MockListEnterprisesRepository();
    usecase = SearchEnterprisesUsecase(mockListEnterprisesRepository);
  });

  final String tQuery = 'superstore';
  final List<Enterprise> tSearchResult = <Enterprise>[
    Enterprise(
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

  test('Should get a list of searched enterprises', () async {
    when(mockListEnterprisesRepository.searchEnterprises(any)).thenAnswer(
      (_) async => Right(tSearchResult),
    );

    final result = await usecase(SearchParams(query: tQuery));

    expect(result, Right(tSearchResult));
    verify(mockListEnterprisesRepository.searchEnterprises(tQuery));
    verifyNoMoreInteractions(mockListEnterprisesRepository);
  });
}
