import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/components/comp_text.dart';
import 'package:onet_mon/components/timer_component.dart';
import 'package:onet_mon/game_widget.dart';
import 'package:onet_mon/utils/scale_config.dart';

class CommandComponent extends PositionComponent with HasGameRef<MyGame> {
  CommandComponent({Vector2 size, Vector2 position}) : super(size: size, position: position);
  double buttonSize = 40.w;
  @override
  onLoad() {
    pauseBtn = SpriteButtonComponent(
      button: Sprite(game.images.fromCache('ic_pause.png')),
      size: Vector2(buttonSize, buttonSize),
      position: Vector2((size.x - buttonSize) / 2, 10.h),
      onPressed: game.gamePause,
    );
    hintBtn = SpriteButtonComponent(
      button: Sprite(game.images.fromCache('ic_hint_up.png')),
      buttonDown: Sprite(game.images.fromCache('ic_hint_down.png')),
      size: Vector2(buttonSize, buttonSize),
      position: Vector2((size.x - buttonSize) / 2, 60.h),
      onPressed: () {
        game.gameView.showHint();
      },
    );
    timer = TmerWidget(
      size: Vector2(20.w, size.y - 220.h),
      position: Vector2(15.w, 110.h),
      onFinish: game.gameOver,
    );
    scoreComp = TextComp(
      text: '0',
      label: 'score',
      size: size,
      position: Vector2(0, size.y - 100.h),
    );
    levelComp = TextComp(
      label: 'level',
      text: '0',
      size: size,
      position: Vector2(0, size.y - 50.h),
    );

    add(timer);
    add(pauseBtn);
    add(hintBtn);
    add(scoreComp);
    add(levelComp);
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreComp.text = '${GameData.score}';
    levelComp.text = '${GameData.level}';
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white.withOpacity(.2);
    canvas.drawRect(
        Rect.fromLTRB(
          0,
          0,
          size.x,
          size.y,
        ),
        paint);
  }

  SpriteButtonComponent hintBtn;
  SpriteButtonComponent pauseBtn;
  TextComp scoreComp;
  TextComp levelComp;

  TmerWidget timer;
}
