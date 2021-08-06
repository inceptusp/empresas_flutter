import 'dart:io';

import 'package:empresas/shared/utils/app_navigator.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/list_enterprises/presentation/pages/enterprise_details_page.dart';
import 'package:empresas/features/list_enterprises/presentation/pages/home_page.dart';
import 'package:empresas/features/sign_in/presentation/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigatorImpl implements AppNavigator {
  @override
  void goToEnterpriseDetails(BuildContext context, Enterprise enterprise) {
    const RouteSettings routeSettings = RouteSettings(name: '/EnterpriseDetailsPage');
    if (Platform.isAndroid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EnterpriseDetailsPage(enterprise: enterprise),
          settings: routeSettings,
        ),
      );
    } else if (Platform.isIOS) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => EnterpriseDetailsPage(enterprise: enterprise),
          settings: routeSettings,
        ),
      );
    }
  }

  @override
  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void replaceWithHome(BuildContext context) {
    const RouteSettings routeSettings = RouteSettings(name: '/HomePage');
    if (Platform.isAndroid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: routeSettings,
        ),
      );
    } else if (Platform.isIOS) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const HomePage(),
          settings: routeSettings,
        ),
      );
    }
  }

  @override
  void replaceWithLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 2),
        pageBuilder: (_, __, ___) => const LoginPage(),
        settings: const RouteSettings(name: '/LoginPage'),
      ),
    );
  }
}
