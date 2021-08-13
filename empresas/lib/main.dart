import 'package:empresas/enterprises_app.dart';
import 'package:empresas/shared/utils/app_navigator.dart';
import 'package:empresas/shared/utils/app_navigator_impl.dart';
import 'package:empresas/shared/utils/dependencies_container.dart' as deps;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await deps.init();
  runApp(
    Provider<AppNavigator>(
      create: (context) => AppNavigatorImpl(),
      child: const EnterprisesApp(),
    ),
  );
}
