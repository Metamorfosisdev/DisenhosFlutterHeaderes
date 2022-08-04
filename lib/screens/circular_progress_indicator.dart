import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  static String routeName = '/CircularProgressScreen';
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> {
  double porcentage = 10;
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
          if (porcentage < 100) {
            porcentage += 10;
          } else {
            porcentage = 0;
          }
          setState(() {});
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
