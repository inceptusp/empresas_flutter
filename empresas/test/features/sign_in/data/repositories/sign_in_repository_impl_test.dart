import 'package:empresas/features/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:empresas/features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'sign_in_repository_impl_test.mocks.dart';

@GenerateMocks([SignInDatasource])
main() {
  late SignInRepositoryImpl repository;
  late MockSignInDatasource mockSignInDatasource;

  setUp(() {
    mockSignInDatasource = MockSignInDatasource();
    repository = SignInRepositoryImpl(datasource: mockSignInDatasource);
  });
}
