import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/constants.dart';
import 'package:onet_mon/utils/scale_config.dart';

class TextComp extends PositionComponent {
  String text;
  String label;

  TextComp({this.text, this.label, Vector2 size, Vector2 position}) : super(size: size, position: position);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    TextSpan span = TextSpan(
      style: TextStyle(
        color: WHITE_COLOR,
        fontSize: 16.sp,
      ),
      text: label,
    );

    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset((size.x / 2) - (tp.width / 2), 0));

    TextSpan span2 = TextSpan(
      style: TextStyle(
        color: WHITE_COLOR,
        fontSize: 24.sp,
      ),
      text: text,
    );
    TextPainter tp2 = TextPainter(text: span2, textDirection: TextDirection.ltr);
    tp2.layout();
    tp2.paint(canvas, Offset((size.x / 2) - (tp2.width / 2), tp.height));
  }
}
