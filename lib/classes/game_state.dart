import 'package:flutter/foundation.dart';

enum GameType {
  none,
  playing,
  nextLevel,
  gameOver,
  gamePaused,
}

class GameState extends ChangeNotifier {
  GameType gameState;
  GameState({this.gameState = GameType.none});
  void setGameState(GameType gt) {
    gameState = gt;
    notifyListeners();
  }
}

class GameData {
  // List<int> data;
  // int height;
  // int hint;
  // bool isHinted;
  static int lastMatch = 0;
  static int timeLeft = 0;
  static int level = 1;
  // int mode;
  static int score = 0;
  // int width;
  static bool soundEnabled = true;
  static bool musicEnabled = false;
}
