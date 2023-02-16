import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/class_game.dart';
import 'package:onet_mon/classes/onet_model.dart';
import 'package:onet_mon/components/comp_toggle_btn.dart';
import 'package:onet_mon/classes/constants.dart';
import 'package:onet_mon/components/audio_component.dart';
import 'package:onet_mon/game_view.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:onet_mon/components/timer_component.dart';
import 'package:onet_mon/utils/scale_config.dart';

import 'package:provider/provider.dart';

class MyGame extends FlameGame with HasTappables {
  bool musicEnable = false;
  bool soundEnable = true;

  OnetModel om;

  SpriteButtonComponent hintBtn;
  SpriteButtonComponent pauseBtn;
  ToggleButton soundBtn;
  ToggleButton musicBtn;
  AudioPlayerComponent audioplayer;

  TmerWidget timer;

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
  }

  @override
  Color backgroundColor() => Colors.transparent;

  Future loadFiles() async {
    List.generate(36, (index) {
      imageList.add('icon$index.png');
    });

    await images.loadAll(imageList);
    FlameAudio.bgm.initialize();
  }

  loadComponents() {
    om = OnetModel();
    audioplayer = AudioPlayerComponent();
    hintBtn = SpriteButtonComponent(
      button: Sprite(images.fromCache('ic_hint_up.png')),
      buttonDown: Sprite(images.fromCache('ic_hint_down.png')),
      size: Vector2(40.w, 40.h),
      position: Vector2(canvasSize.x - 50.w, 90.h),
      onPressed: () {
        gameView.showHint();
      },
    );

    pauseBtn = SpriteButtonComponent(
      button: Sprite(images.fromCache('ic_pause.png')),
      size: Vector2(40.w, 40.h),
      position: Vector2(canvasSize.x - 50.w, 30.h),
      onPressed: gamePause,
    );

    musicBtn = ToggleButton(
      onSprite: Sprite(images.fromCache('ic_music_on.png')),
      offSprite: Sprite(images.fromCache('ic_music_off.png')),
      size: Vector2(40.w, 40.h),
      position: Vector2(canvasSize.x - 50.w, canvasSize.y - 130.h),
      onTap: (value) {
        if (value) {
          audioplayer.playBgm();
        } else {
          audioplayer.stopBgm();
        }
      },
    );

    soundBtn = ToggleButton(
      isEnable: soundEnable,
      onSprite: Sprite(images.fromCache('ic_sound_on.png')),
      offSprite: Sprite(images.fromCache('ic_sound_off.png')),
      size: Vector2(40.w, 40.h),
      position: Vector2(canvasSize.x - 50.w, canvasSize.y - 70.h),
      onTap: (value) {
        soundEnable = value;
      },
    );

    Vector2 gameSize = Vector2(canvasSize.x - 50, canvasSize.y - 10);

    gameView = GameView(
      size: gameSize,
      images: images,
      model: om,
      nextLevel: nextLevel,
      playSound: playSound,
    );

    timer = TmerWidget(size: Vector2(canvasSize.x, 10), position: Vector2(0, canvasSize.y - 10), onFinish: gameOver);

    add(gameView);
    add(hintBtn);
    add(pauseBtn);
    add(timer);
    add(soundBtn);
    add(musicBtn);
  }

  @override
  Future onLoad() async {
    await loadFiles();
    await loadComponents();
  }

  void playSound(String n) {
    if (!soundEnable) return;
    audioplayer.playSfx(n);
  }

  void gameOver() {
    Provider.of<GameSettings>(buildContext, listen: false).setGameState(GameType.gameOver);
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    super.onTapDown(pointerId, info);
    gameView.onTouchEvent(info.eventPosition.global);
  }

  void nextLevel() {
    playSound('finish.wav');
    Provider.of<GameSettings>(buildContext, listen: false).setGameState(GameType.nextLevel);
  }

  void gamePause() {
    Provider.of<GameSettings>(buildContext, listen: false).setGameState(GameType.gamePaused);
  }

  @override
  void onDetach() {
    audioplayer.stopBgm();
    timer.pauseTimer(false);
    super.onDetach();
  }

  @override
  void onAttach() {
    audioplayer.stopBgm();
    timer.pauseTimer(true);
    super.onDetach();
  }

  GameView gameView;
  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        timer.pauseTimer(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        audioplayer.stopBgm();
        timer.pauseTimer(false);
        break;
    }
    super.lifecycleStateChange(state);
  }
}
