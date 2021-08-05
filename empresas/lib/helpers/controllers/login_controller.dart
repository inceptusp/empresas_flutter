import 'dart:io';

import 'package:empresas/helpers/enterprises_api.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String signInResponse = '';

  @observable
  String email = '';

  @action
  void changeEmail(value) => email = value;

  @action
  String? emailValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return EnterprisesLocalizations.of(context)!.mandatoryFieldLabel;
    }
    return null;
  }

  @observable
  String password = '';

  @action
  void changePassword(value) => password = value;

  @action
  String? passwordValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return EnterprisesLocalizations.of(context)!.mandatoryFieldLabel;
    }
    return null;
  }

  @observable
  bool isShowingPassword = false;

  @action
  void showPassword() => isShowingPassword = !isShowingPassword;

  @action
  Future<void> signIn(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> signInResp = await EnterprisesApi.signIn(email, password);
        bool success = signInResp['success'];
        if (success) {
          signInResponse = 'success';
        } else {
          signInResponse = signInResp['errors'].first;
        }
      } on SocketException catch (_) {
        signInResponse = 'connection_error';
      } catch (_) {}
    }
  }
}
