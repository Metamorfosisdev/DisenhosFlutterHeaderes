import 'package:flutter/material.dart';

class BackgroundTriangleBottomWidget extends StatelessWidget {
  const BackgroundTriangleBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: (size.height),
        width: size.width,
        child: CustomPaint(
          painter: _DiagonalHeaderPainter(),
        ),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /*
     * Declare paint and modify the default settings
     */
    Paint paint = Paint();
    paint.color = const Color(0xff95BCCC);
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill; //The stroke styly only draw a line

    Path path = Path();

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    //Call canvas method to draw the previously declared paint
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
