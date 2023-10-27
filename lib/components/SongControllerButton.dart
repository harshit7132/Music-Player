import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_player/config/Colors.dart';
import 'package:music_player/controller/SongPlayerController.dart';
import 'package:music_player/controller/songDataController.dart';

class SongControllerButtons extends StatelessWidget {
  const SongControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${songPlayerController.currentTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                  child: Obx(
                () => Slider(
                  value: songPlayerController.sliderValue.value
                      .clamp(0.0, songPlayerController.sliderValue.value),
                  onChanged: (value) {
                    songPlayerController.sliderValue.value = value;

                    Duration songPostion = Duration(seconds: value.toInt());
                    songPlayerController.changeSongSlider(songPostion);

                  },
                  min: 0,
                  max: songPlayerController.sliderMaxValue.value,
                ),
              )),
              Text(
                "${songPlayerController.totalTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                songDataController.playPreviousSong();
              },
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                width: 20,
              ),
            ),
            SizedBox(width: 40),
            Obx(
              () => songPlayerController.isPlaying.value
                  ? InkWell(
                      onTap: () {
                        songPlayerController.pausePlaying();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/pause.svg",
                            width: 20,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        songPlayerController.resumePlaying();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/play.svg",
                            width: 20,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(width: 40),
            InkWell(
              onTap: (){
                songDataController.playNextSong();
              },
              child: SvgPicture.asset(
                "assets/icons/next.svg",
                width: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                songPlayerController.playRandomSong();
              },
              child: Obx(() => SvgPicture.asset(
                "assets/icons/suffle.svg",
                width: 20,
                      color: songPlayerController.isSuffeled.value ? primaryColor : lableColor,
              ),)
            ),
            InkWell(
              onTap: (){
               songPlayerController.setLoopSong();
              },
              child: Obx(() => SvgPicture.asset(
                "assets/icons/repeat.svg" ,
                width: 20,
                color: songPlayerController.isLoop.value ? primaryColor : lableColor,
              ),)
            ),
            SvgPicture.asset(
              "assets/icons/songbook.svg",
              width: 20,
            ),
            SvgPicture.asset(
              "assets/icons/heart.svg",
              width: 20,
            ),
          ],
        ),
      ],
    );
  }
}
