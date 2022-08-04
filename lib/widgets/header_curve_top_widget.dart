import 'package:flutter/material.dart';

class CurveHeaderTop extends StatelessWidget {
  const CurveHeaderTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: CustomPaint(
          painter: _CurveHeaderTopPainter(),
        ),
      ),
    );
  }
}

class _CurveHeaderTopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Paint instance
    Paint paint = Paint();
    paint.color = const Color(0xff95BCCC);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    //Path instance
    Path path = Path();
    path.lineTo(0, (size.height) * 0.3);
    path.quadraticBezierTo((size.width) * 0.5, (size.height) * 0.4, size.width,
        (size.height) * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
