import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/game_settings.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/classes/onet_model.dart';
import 'package:onet_mon/components/command_component.dart';
import 'package:onet_mon/classes/constants.dart';
import 'package:onet_mon/components/audio_component.dart';
import 'package:onet_mon/game_view.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:onet_mon/utils/scale_config.dart';
import 'package:provider/provider.dart';

class MyGame extends FlameGame with HasTappables {
  bool musicEnable = false;
  bool soundEnable = true;

  OnetModel om;

  CommandComponent commComp;

  @override
  Color backgroundColor() => Colors.transparent;

  Future loadFiles() async {
    List.generate(36, (index) {
      imageList.add('${gs.gameIcon}/$index.png');
    });

    await images.loadAll(imageList);
    FlameAudio.bgm.initialize();
  }

  loadComponents() {
    Vector2 gameSize = Vector2(canvasSize.x - 50.w, canvasSize.y);
    int height = gs.gameResolution;
    int widht = (gameSize.x / (gameSize.y / height)).round();

    om = OnetModel.fromValue(w: widht, h: height);

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
    if (!GameData.soundEnabled) return;
    audioplayer.playSfx(n);
  }

  void gameOver() {
    Provider.of<GameState>(buildContext, listen: false).setGameState(GameType.gameOver);
  }

  void nextLevel() {
    playSound('finish.wav');
    Provider.of<GameState>(buildContext, listen: false).setGameState(GameType.nextLevel);
  }

  void gamePause() {
    Provider.of<GameState>(buildContext, listen: false).setGameState(GameType.gamePaused);
  }

  @override
  void onDetach() {
    // audioplayer.stopBgm();
    commComp.timer.pauseTimer(false);
    super.onDetach();
  }

  @override
  void onAttach() {
    // GameState.musicEnabled?
    // audioplayer.startBgm():audioplayer.stopBgm();
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
        // audioplayer.stopBgm();
        commComp.timer.pauseTimer(false);
        break;
    }
    super.lifecycleStateChange(state);
  }
}
