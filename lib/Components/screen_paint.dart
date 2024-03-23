import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenPaintDemo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black38
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 4, size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}