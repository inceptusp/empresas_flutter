import 'package:empresas/features/list_enterprises/data/datasource/list_enterprises_datasource.dart';
import 'package:empresas/features/list_enterprises/data/repositories/list_enterprises_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'list_enterprises_repository_impl_test.mocks.dart';

@GenerateMocks([ListEnterprisesDatasource])
main() {
  late ListEnterprisesRepositoryImpl repository;
  late MockListEnterprisesDatasource mockListEnterprisesDatasource;

  setUp(() {
    mockListEnterprisesDatasource = MockListEnterprisesDatasource();
    repository = ListEnterprisesRepositoryImpl(datasource: mockListEnterprisesDatasource);
  });
}
