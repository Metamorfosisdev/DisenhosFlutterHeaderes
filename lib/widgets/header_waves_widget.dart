import 'package:flutter/material.dart';

class WaveHeaderWidget extends StatelessWidget {
  const WaveHeaderWidget({Key? key}) : super(key: key);

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
    //Code to add gradiant into canvas illustration
    Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xffFCDCDC),
        Color(0xffBECEDA),
      ],
    );
    Rect rect = Rect.fromCircle(
      center: const Offset(0, 100),
      radius: 180,
    );
    //Paint instance
    Paint paint = Paint()..shader = gradient.createShader(rect);
    paint.color = const Color(0xff95BCCC);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    //Path instance
    Path path = Path();
    path.lineTo(0, (size.height) * 0.3);
    path.quadraticBezierTo((size.width) * 0.25, (size.height) * 0.4,
        (size.width) * 0.50, (size.height) * 0.3);
    path.quadraticBezierTo((size.width) * 0.75, (size.height) * 0.2,
        (size.width), (size.height) * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
