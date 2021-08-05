import 'package:empresas/helpers/utils/app_navigator.dart';
import 'package:empresas/helpers/controllers/login_controller.dart';
import 'package:empresas/widgets/eliptical_progress_indicator.dart';
import 'package:empresas/widgets/error_messages.dart';
import 'package:empresas/widgets/sliver_login_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = LoginController();
  late AppNavigator _appNavigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverLoginAppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: EnterprisesLocalizations.of(context)!.emailLabel,
                        ),
                        validator: (value) => _loginController.emailValidator(context, value),
                        onChanged: _loginController.changeEmail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Observer(
                        builder: (context) => TextFormField(
                          obscureText: !_loginController.isShowingPassword,
                          decoration: InputDecoration(
                            labelText: EnterprisesLocalizations.of(context)!.passwordLabel,
                            suffixIcon: IconButton(
                              onPressed: _loginController.showPassword,
                              icon: _loginController.isShowingPassword
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : const Icon(Icons.remove_red_eye),
                            ),
                          ),
                          validator: (value) => _loginController.passwordValidator(context, value),
                          onChanged: _loginController.changePassword,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Observer(
                          builder: (context) => ElevatedButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return const SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: Center(child: ElipticalProgressIndicator()),
                                  );
                                },
                              );
                              await _loginController.signIn(_formKey);
                              _signIn();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                  right: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              EnterprisesLocalizations.of(context)!.signInLabel.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _appNavigator = context.read<AppNavigator>();
    super.initState();
  }

  void _showErrorAlert([String error = '']) {
    showDialog(
      context: context,
      builder: (context) => ErrorMessage.errorAlert(
        context: context,
        errorCode: error,
        onClose: () => _appNavigator.pop(context),
      ),
    );
  }

  void _signIn() async {
    if (_loginController.signInResponse == 'success') {
      _appNavigator.pop(context);
      _appNavigator.replaceWithHome(context);
    } else {
      _appNavigator.pop(context);
      _showErrorAlert(_loginController.signInResponse);
    }
  }
}
