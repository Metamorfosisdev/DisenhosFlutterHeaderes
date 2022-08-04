import 'dart:math';

import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final double porcentage;
  final Color? colorPorcentage;
  final Color? circleColor;
  const ProgressIndicatorWidget({
    Key? key,
    required this.porcentage,
    this.colorPorcentage,
    this.circleColor,
  }) : super(key: key);

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double previousPorcentage = 0;

  @override
  void initState() {
    previousPorcentage = widget.porcentage;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);
    //which part of porcentage must animate
    double animatedPart = widget.porcentage - previousPorcentage;
    previousPorcentage = widget.porcentage;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: ProgressIndicatorWidgetPainter(
              (widget.porcentage - animatedPart) +
                  (animatedPart * animationController.value),
              widget.colorPorcentage,
              widget.circleColor,
            ),
          ),
        );
      },
    );
  }
}

class ProgressIndicatorWidgetPainter extends CustomPainter {
  double porcentage;
  Color? colorPorcentage;
  Color? circleColor;
  ProgressIndicatorWidgetPainter(
      this.porcentage, this.colorPorcentage, this.circleColor);
  @override
  void paint(Canvas canvas, Size size) {
    //Circle properties
    Paint paint = Paint()
      ..strokeWidth = 15
      ..color = circleColor ?? Colors.white
      ..style = PaintingStyle.stroke;
    //Arc properties
    Paint paintArc = Paint()
      ..strokeWidth = 10
      ..color = colorPorcentage ?? Colors.blue[100] as Color
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset((size.width) * 0.5, (size.height) * 0.5),
      min((size.width) * 0.5, (size.height) * 0.5),
      paint,
    );

    //porcentage = 10;
    double sweepAngle = 2 * pi * (porcentage / 100.0);

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset((size.width) * 0.5, (size.height) * 0.5),
          radius: min((size.width) * 0.5, (size.height) * 0.5)),
      -pi / 2,
      sweepAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
