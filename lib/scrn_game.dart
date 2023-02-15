import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:onet2/onet/game_widget.dart';
import 'package:onet2/painters/p_background.dart';
import 'package:onet2/widget_option.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: BackgroundPainter(),
        child: SafeArea(
          child: GameWidget(
            game: MyGame()..paused = false,
            overlayBuilderMap: {
              'Question': (BuildContext context, MyGame game) {
                return Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                    child: Center(child: Text('This is a question')),
                  ),
                );
              },
            },
          ),
        ),
      ),
    );
  }
}