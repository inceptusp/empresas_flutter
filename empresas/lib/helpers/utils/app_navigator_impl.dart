import 'dart:io';

import 'package:empresas/helpers/utils/app_navigator.dart';
import 'package:empresas/helpers/entities/enterprise.dart';
import 'package:empresas/pages/detailed_enterprise_page.dart';
import 'package:empresas/pages/home_page.dart';
import 'package:empresas/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigatorImpl implements AppNavigator {
  @override
  void goToEnterpriseDetails(BuildContext context, Enterprise enterprise) {
    const RouteSettings routeSettings = RouteSettings(name: '/DetailedEnterprisePage');
    if (Platform.isAndroid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailedEnterprisePage(enterprise: enterprise),
          settings: routeSettings,
        ),
      );
    } else if (Platform.isIOS) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DetailedEnterprisePage(enterprise: enterprise),
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
