import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:onet2/game_widget.dart';

class AudioPlayerComponent extends Component with HasGameRef<MyGame> {
  @override
  void onLoad() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll(['bg_music.mp3', 'good.wav', 'bad.wav', 'click.wav', 'finish.wav', 'random.wav']);
    return super.onLoad();
  }

  void playBgm() {
    FlameAudio.bgm.play('bg_music.mp3');
  }

  void playSfx(String filename) {
    FlameAudio.play(filename);
  }

  void stopBgm() {
    FlameAudio.bgm.stop();
  }
}
