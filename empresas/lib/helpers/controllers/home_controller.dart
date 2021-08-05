import 'dart:io';

import 'package:empresas/helpers/enterprises_api.dart';
import 'package:empresas/helpers/entities/enterprise.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<Enterprise>? enterprises;

  @observable
  bool isSearching = false;

  @observable
  String? searchError;

  @action
  Future<void> searchEnterprises(String query) async {
    isSearching = true;
    try {
      enterprises = await EnterprisesApi.search(query);
    } on SocketException catch (_) {
      searchError = 'connection_error';
    } catch (_) {}
    isSearching = false;
  }
}