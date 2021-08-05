// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$signInResponseAtom =
      Atom(name: '_LoginControllerBase.signInResponse');

  @override
  String get signInResponse {
    _$signInResponseAtom.reportRead();
    return super.signInResponse;
  }

  @override
  set signInResponse(String value) {
    _$signInResponseAtom.reportWrite(value, super.signInResponse, () {
      super.signInResponse = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isShowingPasswordAtom =
      Atom(name: '_LoginControllerBase.isShowingPassword');

  @override
  bool get isShowingPassword {
    _$isShowingPasswordAtom.reportRead();
    return super.isShowingPassword;
  }

  @override
  set isShowingPassword(bool value) {
    _$isShowingPasswordAtom.reportWrite(value, super.isShowingPassword, () {
      super.isShowingPassword = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_LoginControllerBase.signIn');

  @override
  Future<void> signIn(GlobalKey<FormState> formKey) {
    return _$signInAsyncAction.run(() => super.signIn(formKey));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void changeEmail(dynamic value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(dynamic value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? emailValidator(BuildContext context, String? value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.emailValidator');
    try {
      return super.emailValidator(context, value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? passwordValidator(BuildContext context, String? value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.passwordValidator');
    try {
      return super.passwordValidator(context, value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showPassword() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.showPassword');
    try {
      return super.showPassword();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signInResponse: ${signInResponse},
email: ${email},
password: ${password},
isShowingPassword: ${isShowingPassword}
    ''';
  }
}
