import 'package:flutter/material.dart';
import 'package:onet_mon/menu/button_painter.dart';
import 'package:onet_mon/utils/scale_config.dart';

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
