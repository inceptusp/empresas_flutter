import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

// ignore_for_file: prefer_expression_function_bodies
class ErrorMessage {
  static Widget errorAlert({
    required BuildContext context,
    required String errorCode,
    String? errorCodeMsg,
    required Function() onClose,
  }) {
    switch (errorCode) {
      case 'Invalid login credentials. Please try again.':
        return _errorAlert(
          context: context,
          title: EnterprisesLocalizations.of(context)!.wrongCredentialsErrorAlertTitle,
          content: '${EnterprisesLocalizations.of(context)!.wrongCredentialsErrorAlertMessage}\n\n',
          errorCode: errorCodeMsg ?? errorCode,
          onClose: onClose,
        );
      case 'connection_error':
        return _errorAlert(
          context: context,
          title: EnterprisesLocalizations.of(context)!.connectionErrorAlertTitle,
          content: '${EnterprisesLocalizations.of(context)!.connectionErrorAlertMessage}\n\n',
          errorCode: errorCodeMsg ?? errorCode,
          onClose: onClose,
        );
      default:
        return _errorAlert(
          context: context,
          title: EnterprisesLocalizations.of(context)!.unknownErrorAlertTitle,
          content: '${EnterprisesLocalizations.of(context)!.unknownErrorAlertMessage}\n\n',
          errorCode: errorCodeMsg ?? errorCode,
          onClose: onClose,
        );
    }
  }

  static Widget _errorAlert({
    required BuildContext context,
    required String title,
    required String content,
    required String errorCode,
    required Function() onClose,
  }) {
    return AlertDialog(
      title: Text(title),
      content: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: content,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            TextSpan(
              text: '${EnterprisesLocalizations.of(context)!.errorCodeLabel}: ' + errorCode,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color!.withAlpha(90),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(EnterprisesLocalizations.of(context)!.closeButtonLabel.toUpperCase()),
          onPressed: onClose,
        ),
      ],
    );
  }
}
