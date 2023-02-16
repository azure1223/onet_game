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
    paint.color = Colors.red;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(12, 1, size.x - 12, size.y - 2), Radius.circular(size.y / 2)),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(12, 1, (size.x - 12) * (1 - percent), size.y - 2), Radius.circular(size.y / 2)),
      paint..color = Colors.blue,
    );
  }
}
