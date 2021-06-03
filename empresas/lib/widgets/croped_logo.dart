import 'package:flutter/material.dart';

// ignore_for_file: prefer_expression_function_bodies, for better readability on Widgets files
class CropedLogo extends StatelessWidget {
  const CropedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 64,
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
          image: AssetImage('assets/images/logo_ioasys.png'),
        ),
      ),
    );
  }
}
