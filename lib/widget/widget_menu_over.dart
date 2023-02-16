import 'package:flutter/material.dart';
import 'package:onet2/classes/class_game.dart';
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
          Expanded(child: Container()),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Text(
                      'GAME OVER',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<GameSettings>().setGameState(GameType.none);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    width: double.infinity,
                    height: 50,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Close',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
