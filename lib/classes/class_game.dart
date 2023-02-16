import 'package:flutter/foundation.dart';

enum GameType {
  none,
  playing,
  nextLevel,
  gameOver,
  gamePaused,
}

class GameSettings extends ChangeNotifier {
  GameType gameState;
  GameSettings({this.gameState = GameType.none});
  void setGameState(GameType gt) {
    gameState = gt;
    notifyListeners();
  }
}
