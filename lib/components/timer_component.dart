import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TmerWidget extends PositionComponent {
  Function onFinish;
  TmerWidget({this.onFinish, Vector2 size, Vector2 position}) : super(size: size, position: position);
  double percent = 0;
  Timer countDown;
  int reimainingTime = 600;
  int total = 600;
  bool timerRunning = false;

  @override
  void update(double dt) {
    if (timerRunning && reimainingTime > 0) {
      percent = ((total - reimainingTime) / total);
      countDown.update(dt);
    }
    super.update(dt);
  }

  @override
  Future onLoad() async {
    startTimer();
  }

  startTimer() {
    countDown = Timer(1, onTick: () {
      if (reimainingTime > 0) {
        reimainingTime--;
        if (reimainingTime == 0) {
          if (onFinish != null) {
            onFinish();
          }
        }
      }
    }, repeat: true);
    countDown.start();
    timerRunning = true;
  }

  pauseTimer(bool value) {
    timerRunning = value;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(0, 0, size.x, size.y), Radius.circular(4)),
      paint,
    );

    double barSize = 4;
    double i = size.y - barSize - 2;
    while (i > size.y * percent) {
      double perc = ((size.y - i) / size.y);
      paint.color = mix(Color.fromARGB(255, 11, 243, 19), Color.fromARGB(255, 253, 17, 0), perc);
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(2, i, size.x - 4, barSize), Radius.circular(2)), paint);
      i -= barSize + 2;
    }
  }

  Color mix(Color a, Color b, double percent) {
    return Color.fromRGBO((a.red * percent + b.red * (1.0 - percent)).floor(), ((a.green * percent) + (b.green * (1.0 - percent))).floor(), (a.blue * percent + b.blue * (1.0 - percent)).floor(), 1.0);
  }
}
