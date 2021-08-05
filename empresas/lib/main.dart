import 'package:empresas/enterprises_app.dart';
import 'package:empresas/helpers/utils/app_navigator.dart';
import 'package:empresas/helpers/utils/app_navigator_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<AppNavigator>(
      create: (context) => AppNavigatorImpl(),
      child: const EnterprisesApp(),
    ),
  );
}
