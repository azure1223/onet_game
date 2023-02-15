import 'package:flutter/material.dart';

import 'package:onet2/constants.dart';
import 'package:onet2/utils/scale_config.dart';

class MenuButtonPainter extends CustomPainter {
  String title;
  MenuButtonPainter(this.title);
  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.height / 2;
    Paint fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = COLOR_ORANGE;

    Paint strokePaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..color = COLOR_BROWN;

    Rect rec = Rect.fromLTRB(0, 0, size.width, size.height);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          rec,
          Radius.circular(radius),
        ),
        fillPaint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          rec,
          Radius.circular(radius),
        ),
        strokePaint);

    TextSpan span = TextSpan(
      style: TextStyle(
        color: Colors.blue,
        fontFamily: 'Shades',
        fontSize: 35.sp,
      ),
      text: title,
    );
    TextPainter tp2 = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp2.layout();
    tp2.paint(canvas, Offset(rec.center.dx - (tp2.width / 2), rec.center.dy - (tp2.height / 2)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  drawButton(text) {}
}
