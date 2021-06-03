import 'dart:io';

import 'package:empresas/helpers/enterprises_api.dart';
import 'package:empresas/pages/home_page.dart';
import 'package:empresas/widgets/eliptical_progress_indicator.dart';
import 'package:empresas/widgets/error_messages.dart';
import 'package:empresas/widgets/sliver_login_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

// ignore_for_file: prefer_expression_function_bodies, for better readability on Widgets files
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isShowingPassword = false;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
                        controller: _emailTextController,
                        decoration: InputDecoration(
                          labelText: EnterprisesLocalizations.of(context)!.emailLabel,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return EnterprisesLocalizations.of(context)!.mandatoryFieldLabel;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextFormField(
                        controller: _passwordTextController,
                        obscureText: !_isShowingPassword,
                        decoration: InputDecoration(
                          labelText: EnterprisesLocalizations.of(context)!.passwordLabel,
                          suffixIcon: IconButton(
                            onPressed: _showPassword,
                            icon: _isShowingPassword
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return EnterprisesLocalizations.of(context)!.mandatoryFieldLabel;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signIn,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorAlert([String error = '']) {
    showDialog(
      context: context,
      builder: (context) => ErrorMessage.errorAlert(
        context: context,
        errorCode: error,
        onClose: () => Navigator.pop(context),
      ),
    );
  }

  void _showPassword() {
    setState(() {
      _isShowingPassword = !_isShowingPassword;
    });
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
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
      try {
        Map<String, dynamic> signInResp = await EnterprisesApi.signIn(
          _emailTextController.text,
          _passwordTextController.text,
        );
        bool success = signInResp['success'];
        if (success) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
              settings: const RouteSettings(name: '/HomePage'),
            ),
          );
        } else {
          Navigator.pop(context);
          _showErrorAlert(signInResp['errors'].first);
        }
      } on SocketException catch (_) {
        Navigator.pop(context);
        _showErrorAlert('connection_error');
      } catch (e) {
        Navigator.pop(context);
        _showErrorAlert('$e');
      }
    }
  }
}
