import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/Model/MySongModel.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxBool isLoop = false.obs;
  RxBool isSuffeled = false.obs;
  RxDouble volumLavel = 0.2.obs;
  RxBool isCouldSoundPlaying = false.obs;
  RxString albumUrl = "".obs;

  void playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    isCouldSoundPlaying.value = false;

    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data),
      ),
    );

    player.play();
    updatePosition();
    isPlaying.value = true;
  }
  void playCloudAudio(MySongModel song) async {
    songTitle.value = song.title!;
    songArtist.value = song.artist!;
    albumUrl.value = song.albumArt!;
    isCouldSoundPlaying.value = true;

    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data!),
      ),
    );

    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void chnageVolum(double volume)
  {
    volumLavel.value = volume;
    player.setVolume(volumLavel.value);
    print(volumLavel.value);
  }

  void setLoopSong() async {
    if (isLoop.value) {
      await player.setLoopMode(LoopMode.off);
    } else {
      await player.setLoopMode(LoopMode.one);
    }
    isLoop.value = !isLoop.value;
  }

  void playRandomSong() async {
    if (isSuffeled.value) {
      await player.setShuffleModeEnabled(false);
    } else {
      await player.setShuffleModeEnabled(true);
    }
    isSuffeled.value = !isSuffeled.value;
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
