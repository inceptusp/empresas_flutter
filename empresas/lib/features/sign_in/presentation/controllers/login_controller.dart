import 'package:empresas/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:empresas/shared/utils/dependencies_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final SignInUsecase signInUsecase = getIt<SignInUsecase>();

  @observable
  String signInResponse = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isShowingPassword = false;

  @action
  void changeEmail(value) => email = value;

  @action
  void changePassword(value) => password = value;

  @action
  String? emailValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return EnterprisesLocalizations.of(context)!.mandatoryFieldLabel;
    }
    return null;
  }

  @action
  String? passwordValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return EnterprisesLocalizations.of(context)!.mandatoryFieldLabel;
    }
    return null;
  }

  @action
  void showPassword() => isShowingPassword = !isShowingPassword;

  @action
  Future<void> signIn(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final signInResp = await signInUsecase(SignInParams(
        email: email,
        password: password,
      ));

      signInResp.fold((l) {
        Failure failure = l;
        signInResponse = failure.message;
      }, (r) => signInResponse = 'success');
    }
  }
}
