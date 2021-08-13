import 'package:empresas/features/list_enterprises/domain/usecases/search_enterprises.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/shared/utils/dependencies_container.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final SearchEnterprisesUsecase searchUsecase = getIt<SearchEnterprisesUsecase>();

  @observable
  List<Enterprise>? enterprises;

  @observable
  bool isSearching = false;

  @observable
  String? searchError;

  @action
  Future<void> searchEnterprises(String query) async {
    isSearching = true;
    final searchResp = await searchUsecase(SearchParams(query: query));
    searchResp.fold((l) => enterprises = [], (r) => enterprises = r);
    isSearching = false;
  }
}
