import 'package:empresas/features/list_enterprises/data/datasource/list_enterprises_datasource.dart';
import 'package:empresas/features/list_enterprises/data/repositories/list_enterprises_repository_impl.dart';
import 'package:empresas/features/list_enterprises/domain/repositories/list_enterprises_repository.dart';
import 'package:empresas/features/list_enterprises/domain/usecases/get_all_enterprises.dart';
import 'package:empresas/features/list_enterprises/domain/usecases/search_enterprises.dart';
import 'package:empresas/features/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:empresas/features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:empresas/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:empresas/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:empresas/shared/data/datasources/enterprises_remote_api.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton<SignInDatasource>(
    () => EnterprisesRemoteApi(client: getIt()),
  );
  getIt.registerLazySingleton<ListEnterprisesDatasource>(
    () => EnterprisesRemoteApi(client: getIt()),
  );

  getIt.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(datasource: getIt()),
  );
  getIt.registerLazySingleton<ListEnterprisesRepository>(
    () => ListEnterprisesRepositoryImpl(datasource: getIt()),
  );

  getIt.registerSingleton<SignInUsecase>((SignInUsecase(getIt())));
  getIt.registerSingleton(SearchEnterprisesUsecase(getIt()));
  getIt.registerSingleton(GetAllEnterprisesUsecase(getIt()));
}
