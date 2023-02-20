import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/class_game.dart';
import 'package:onet_mon/classes/game_settings.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/classes/shared_data.dart';
import 'package:onet_mon/game_widget.dart';
import 'package:onet_mon/painters/painter_background.dart';
import 'package:onet_mon/utils/scale_config.dart';
import 'package:onet_mon/widget/widget_menu_main.dart';
import 'package:onet_mon/widget/widget_menu_over.dart';
import 'package:onet_mon/widget/widget_menu_pause.dart';
import 'package:onet_mon/widget/widget_next_level.dart';
import 'package:provider/provider.dart';

class MainSreen extends StatefulWidget {
  @override
  State<MainSreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  MyGame myGame;
  int height = 0;
  int width = 0;

  @override
  void initState() {
    getData().then((value) => setStates());
    super.initState();
  }

  Future getData() async {
    gs = await SharedSettings.getSettings();
  }

  void setStates() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ScaleConfig().init(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          size: MediaQuery.of(context).size,
          painter: BackgroundPainter(),
          child: Consumer<GameState>(
            builder: (context, gs, child) {
              switch (gs.gameState) {
                case GameType.playing:
                  return GameWidget(game: myGame);
                  break;
                case GameType.gamePaused:
                  return PauseMenuWidget();
                  break;
                case GameType.gameOver:
                  return GameOverWidget();
                  break;
                case GameType.nextLevel:
                  return NextLevelWidget(nexLevelBtn: () {
                    context.read<GameState>().setGameState(GameType.playing);
                    GameData.level++;
                    myGame = MyGame();
                  });
                  break;
                default:
                  return MenuWidget(
                    playBtnFuc: () {
                      context.read<GameState>().setGameState(GameType.playing);
                      GameData.level = 1;
                      myGame = MyGame();
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
