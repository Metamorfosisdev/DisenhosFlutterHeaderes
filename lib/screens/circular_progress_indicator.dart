import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  static String routeName = '/CircularProgressScreen';
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>
    with SingleTickerProviderStateMixin {
  double porcentage = 0.0;
  double newporcentage = 0.0;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    animationController.addListener(() {
      print(animationController.value);
      //calculate the interpolation of the animation to assign the new porcentage value
      //The lerpDouble could return a NaN field thar could be correct if the value send
      //its different than a number otherwise just need add the !
      porcentage =
          lerpDouble(porcentage, newporcentage, animationController.value)!;
      //Than as fast the porcentage is updated we need to call the setState method
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
              //color: Colors.blue,
              ),
          child: CustomPaint(
            painter: _CircularProgressPainter(porcentage),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          porcentage = newporcentage;
          if (newporcentage < 100) {
            newporcentage += 10;
          } else {
            porcentage = 0;
            newporcentage = 0;
          }
          setState(() {});

          animationController.forward(from: 0.0);
        },
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double porcentage;

  _CircularProgressPainter(this.porcentage);

  @override
  void paint(Canvas canvas, Size size) {
    //paint the circle
    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    //paint the progress
    Paint paintProgress = Paint()
      ..strokeWidth = 5
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset((size.width) * 0.5, (size.height) * 0.5),
        min((size.width) * 0.5, (size.height) * 0.5), paint);

    double arcAngle = 2 * pi * (porcentage / 100.0);

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset((size.width) * 0.5, (size.height) * 0.5),
        radius: min((size.width) * 0.5, (size.height) * 0.5),
      ),
      -pi / 2,
      arcAngle,
      false,
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
