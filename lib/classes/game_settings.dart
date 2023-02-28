import 'package:flutter/material.dart';

GameSettings gs;

class GameSettings {
  String gameIcon;
  int gameResolution;
  int gameTime;
  int bgColor;
  double bgOpacity;

  GameSettings({
    this.gameIcon,
    this.gameResolution,
    this.gameTime,
    this.bgColor,
    this.bgOpacity,
  });
  factory GameSettings.fromList(List<String> list) => GameSettings(
        gameIcon: list[0],
        gameResolution: int.parse(list[1]),
        gameTime: int.parse(list[2]),
        bgColor: int.parse(list[3]),
        bgOpacity: double.parse(list[4]),
      );
  List<String> toList() => [gameIcon, '$gameResolution', '$gameTime', '$bgColor', '$bgOpacity'];
  factory GameSettings.getDefautlt() => GameSettings(
        gameIcon: 'pokemon',
        gameResolution: 8,
        gameTime: 600,
        bgColor: 0,
        bgOpacity: 1.0,
      );
}

List<String> icon_list = ['pokemon', 'crypto'];
List<int> resu_list = [4, 6, 8];
List<int> time_list = [720, 600, 480, 300];
List<Color> color_list = [
  Color(0xFFFFDCFA),
  Color(0xFFE8D0A9),
  Color(0xFFB7AFA3),
  Color(0xFFC1DAD6),
  Color(0xFFF5FAFA),
  Color(0xFFACD1E9),
  Color(0xFF6D929B),
];
