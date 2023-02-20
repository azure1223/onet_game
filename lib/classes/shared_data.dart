import 'package:onet_mon/classes/game_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSettings {
  static Future<bool> saveSettings(GameSettings gs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('onet_game_settings', gs.toList());
  }

  static Future<GameSettings> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('onet_game_settings')) {
      return GameSettings.fromList(prefs.getStringList('onet_game_settings'));
    } else {
      return GameSettings.getDefautlt();
    }
  }
}
