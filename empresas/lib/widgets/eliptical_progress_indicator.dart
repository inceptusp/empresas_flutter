import 'dart:math' as math;

import 'package:flutter/material.dart';

class ElipticalProgressIndicator extends StatefulWidget {
  const ElipticalProgressIndicator({Key? key}) : super(key: key);

  @override
  _ElipticalProgressIndicatorState createState() => _ElipticalProgressIndicatorState();
}

class _ElipticalProgressIndicatorState extends State<ElipticalProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerA;
  late Animation<double> _animationA;
  late AnimationController _animationControllerB;
  late Animation<double> _animationB;

  _ElipticalProgressIndicatorState() {
    _animationControllerA = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    _animationControllerB = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    _animationA = Tween<double>(
      begin: -math.pi,
      end: math.pi,
    ).animate(_animationControllerA);
    _animationB = Tween<double>(
      begin: math.pi,
      end: -math.pi,
    ).animate(_animationControllerB);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform.rotate(
          angle: _animationA.value,
          child: Image.asset('assets/images/ellipse_1.png'),
        ),
        Transform.rotate(
          angle: _animationB.value,
          child: Image.asset('assets/images/ellipse_2.png'),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    _animationControllerA.repeat();
    _animationControllerB.repeat();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationControllerA.dispose();
    _animationControllerB.dispose();
    super.dispose();
  }
}
