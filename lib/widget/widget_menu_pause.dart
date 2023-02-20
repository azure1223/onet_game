import 'package:flutter/material.dart';
import 'package:onet_mon/classes/class_game.dart';
import 'package:onet_mon/menu/stand_menu.dart';
import 'package:provider/provider.dart';

import 'package:onet_mon/utils/scale_config.dart';

class PauseMenuWidget extends StatefulWidget {
  PauseMenuWidget({Key key}) : super(key: key);

  @override
  State<PauseMenuWidget> createState() => _PauseMenuWidgetState();
}

class _PauseMenuWidgetState extends State<PauseMenuWidget> {
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
                title: 'paused',
                items: [
                  StandMenuItem(
                      title: 'Resume',
                      onTap: () {
                        context.read<GameState>().setGameState(GameType.playing);
                      }),
                  StandMenuItem(
                      title: 'Exit',
                      onTap: () {
                        context.read<GameState>().setGameState(GameType.none);
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
