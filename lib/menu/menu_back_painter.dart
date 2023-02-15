import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:onet2/constants.dart';
import 'package:onet2/utils/scale_config.dart';

class MenuBackPainter extends CustomPainter {
  String title;
  MenuBackPainter(this.title);
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 30;
    double angle = 90.0;

    Paint fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = COLOR_ORANGE;

    Paint strokePaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20.0
      ..style = PaintingStyle.stroke
      ..color = COLOR_BROWN;
    Paint strokePaint2 = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14.0
      ..style = PaintingStyle.stroke
      ..color = COLOR_ORANGE;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(10, 30, size.width - 10, size.height - 10),
          Radius.circular(radius),
        ),
        fillPaint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(10, 30, size.width - 10, size.height - 10),
          Radius.circular(radius),
        ),
        strokePaint..strokeWidth = 10);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(10, 30, size.width - 10, size.height - 10),
          Radius.circular(radius),
        ),
        strokePaint2..strokeWidth = 4);

    strokePaint.strokeWidth = 20;
    strokePaint2.strokeWidth = 14;

    double newRadius = radius + 10;
    Offset topLeft = Offset(newRadius, newRadius + 15);
    Offset topRight = Offset(size.width - newRadius, newRadius + 15);

    Offset bottomLeft = Offset(newRadius, size.height - newRadius);
    Offset bottomRight = Offset(size.width - newRadius, size.height - newRadius);

    drawArcWithRadius(canvas, topLeft, radius, 180.0, angle, strokePaint);
    drawArcWithRadius(canvas, topLeft, radius, 180.0, angle, strokePaint2);

    drawArcWithRadius(canvas, topRight, radius, -90.0, angle, strokePaint);
    drawArcWithRadius(canvas, topRight, radius, -90.0, angle, strokePaint2);

    drawArcWithRadius(canvas, bottomRight, radius, 0.0, angle, strokePaint);
    drawArcWithRadius(canvas, bottomRight, radius, 0.0, angle, strokePaint2);

    drawArcWithRadius(canvas, bottomLeft, radius, 90.0, angle, strokePaint);
    drawArcWithRadius(canvas, bottomLeft, radius, 90.0, angle, strokePaint2);

    Rect r = Rect.fromLTRB(radius * 1.3, 0, size.width - (radius * 1.3), 50);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          r,
          Radius.circular(radius),
        ),
        fillPaint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          r,
          Radius.circular(radius),
        ),
        strokePaint..strokeWidth = 4);

    TextSpan span = TextSpan(
      style: TextStyle(
        color: Colors.blue,
        fontFamily: 'Shades',
        fontSize: 40.sp,
      ),
      text: title,
    );
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(r.center.dx - (tp.width / 2), r.center.dy - (tp.height / 2)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double doubleToAngle(double angle) => angle * math.pi / 180.0;
  void drawArcWithRadius(Canvas canvas, Offset center, double radius, double startAngle, double angle, Paint paint) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), doubleToAngle(startAngle), doubleToAngle(angle), false, paint);
  }
}
