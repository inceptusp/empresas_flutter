import 'package:empresas/shared/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppNavigator appNavigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              Color(0xAACC99C0),
              Color(0xAAAF2674),
              Color(0xAAB40F94),
              Color(0xAA861FBA),
            ],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo_ioasys.png', width: 200, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    appNavigator = context.read<AppNavigator>();
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => appNavigator.replaceWithLogin(context),
    );
  }
}
