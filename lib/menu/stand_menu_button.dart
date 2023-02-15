import 'package:flutter/material.dart';
import 'package:onet2/menu/button_painter.dart';
import 'package:onet2/utils/scale_config.dart';

class StandMenuButton extends StatelessWidget {
  String title;
  double width;
  StandMenuButton({this.title, this.width = 200, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.h,
      child: CustomPaint(
        painter: MenuButtonPainter(title),
      ),
    );
  }
}
