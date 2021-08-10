import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';

abstract class ListEnterprisesDatasource {
  /// Calls the https://empresas.ioasys.com.br/api/v1/enterprises?name={query} endpoint.
  ///
  /// Throws [ServerException] on errors.
  Future<List<EnterpriseModel>> searchEnterprises(String query);

  /// Calls the https://empresas.ioasys.com.br/api/v1/enterprises endpoint.
  ///
  /// Throws [ServerException] on errors.
  Future<List<EnterpriseModel>> getAllEnterprises();
}
