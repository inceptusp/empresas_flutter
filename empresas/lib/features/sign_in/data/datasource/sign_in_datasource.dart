import 'package:empresas/features/sign_in/data/models/investor_model.dart';

abstract class SignInDatasource {
  /// Calls the https://empresas.ioasys.com.br/api/v1/users/auth/sign_in endpoint.
  ///
  /// Throws [ServerException] on errors.
  Future<InvestorModel> signIn(String email, String password);
}
