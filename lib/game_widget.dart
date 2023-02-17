import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/class_game.dart';
import 'package:onet_mon/classes/onet_model.dart';
import 'package:onet_mon/components/command_component.dart';
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
  AudioPlayerComponent audioplayer;
  CommandComponent commComp;

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
    Vector2 gameSize = Vector2(canvasSize.x - 50.w, canvasSize.y);
    int height = 8;
    int widht = (gameSize.x / (gameSize.y / height)).round();

    om = OnetModel.fromValue(w: widht, h: height);
    audioplayer = AudioPlayerComponent();

    commComp = CommandComponent(
      size: Vector2(50.w, canvasSize.y),
      position: Vector2(canvasSize.x - 50.w, 0),
    );

    gameView = GameView(
      size: gameSize,
      images: images,
      model: om,
      nextLevel: nextLevel,
      playSound: playSound,
    );

    add(gameView);
    add(commComp);
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
    commComp.timer.pauseTimer(false);
    super.onDetach();
  }

  @override
  void onAttach() {
    audioplayer.stopBgm();
    commComp.timer.pauseTimer(true);
    super.onDetach();
  }

  GameView gameView;
  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        commComp.timer.pauseTimer(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        audioplayer.stopBgm();
        commComp.timer.pauseTimer(false);
        break;
    }
    super.lifecycleStateChange(state);
  }
}
