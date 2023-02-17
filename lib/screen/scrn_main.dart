import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/class_game.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/game_widget.dart';
import 'package:onet_mon/painters/painter_background.dart';
import 'package:onet_mon/utils/scale_config.dart';
import 'package:onet_mon/widget/widget_menu_main.dart';
import 'package:onet_mon/widget/widget_menu_over.dart';
import 'package:onet_mon/widget/widget_menu_pause.dart';
import 'package:onet_mon/widget/widget_next_level.dart';
import 'package:provider/provider.dart';

class MainSreen extends StatefulWidget {
  MainSreen({Key key}) : super(key: key);

  @override
  State<MainSreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  MyGame myGame;
  int height = 0;
  int width = 0;
  @override
  void initState() {
    super.initState();
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
          child: SafeArea(
            child: Consumer<GameSettings>(
              builder: (context, gs, child) {
                switch (gs.gameState) {
                  case GameType.playing:
                    print('Media ::: ${MediaQuery.of(context).size}');
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
                      context.read<GameSettings>().setGameState(GameType.playing);
                      GameState.level++;
                      myGame = MyGame();
                    });
                    break;
                  default:
                    return MenuWidget(
                      playBtnFuc: () {
                        context.read<GameSettings>().setGameState(GameType.playing);
                        GameState.level = 1;
                        myGame = MyGame();
                      },
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
