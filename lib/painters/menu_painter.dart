import 'package:flutter/material.dart';
import 'dart:math' as math;

class MenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Rect r2 = Rect.fromLTRB(radius, 95, size.width - radius, 95 + 50.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       r2,
    //       Radius.circular(radius),
    //     ),
    //     fillPaint);
    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       r2,
    //       Radius.circular(radius),
    //     ),
    //     strokePaint..strokeWidth = 4);

    // TextSpan span2 = TextSpan(style: TextStyle(color: Colors.white, fontFamily: 'Storm', fontSize: 50), text: 'Play');
    // TextPainter tp2 = TextPainter(text: span2, textDirection: TextDirection.ltr);
    // tp2.layout();
    // tp2.paint(canvas, Offset(r2.center.dx - (tp2.width / 2), r2.center.dy - (tp2.height / 2)));

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromLTRB(radius, 175, size.width - radius, 175 + 50.0),
    //       Radius.circular(radius),
    //     ),
    //     fillPaint);
    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromLTRB(radius, 175, size.width - radius, 175 + 50.0),
    //       Radius.circular(radius),
    //     ),
    //     strokePaint..strokeWidth = 4);

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromLTRB(radius, 255, size.width - radius, 255 + 50.0),
    //       Radius.circular(radius),
    //     ),
    //     fillPaint);
    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromLTRB(radius, 255, size.width - radius, 255 + 50.0),
    //       Radius.circular(radius),
    //     ),
    //     strokePaint..strokeWidth = 4);

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromLTRB(radius, 335, size.width - radius, 335 + 50.0),
    //       Radius.circular(radius),
    //     ),
    //     fillPaint);
    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //       Rect.fromLTRB(radius, 335, size.width - radius, 335 + 50.0),
    //       Radius.circular(radius),
    //     ),
    //     strokePaint..strokeWidth = 4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  drawButton(text) {}
}
