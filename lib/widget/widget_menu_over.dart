import 'package:flutter/material.dart';
import 'package:onet2/classes/class_game.dart';
import 'package:onet2/menu/stand_menu.dart';
import 'package:onet2/utils/scale_config.dart';
import 'package:provider/provider.dart';

class GameOverWidget extends StatefulWidget {
  GameOverWidget({Key key}) : super(key: key);

  @override
  State<GameOverWidget> createState() => _GameOverWidgetState();
}

class _GameOverWidgetState extends State<GameOverWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: StandMenu(
                title: 'GAME OVER',
                items: [
                  StandMenuItem(
                      title: 'Close',
                      onTap: () {
                        context.read<GameSettings>().setGameState(GameType.none);
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
