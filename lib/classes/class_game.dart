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
