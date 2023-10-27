import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;

  void playLocalAudio(String url) async {
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(url),
      ),
    );

    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void playNextSong() async {
    player.seekToNext();
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  void changeSongSlider(Duration position) {
    player.seek(position);
  }

  void updatePosition() async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split(".")[0];
        sliderMaxValue.value = d!.inSeconds.toDouble();
      });
      player.positionStream.listen((p) {
        currentTime.value = p.toString().split(".")[0];
        sliderValue.value = p.inSeconds.toDouble();
        if (totalTime.value == currentTime.value) {
          isPlaying.value = false;
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
