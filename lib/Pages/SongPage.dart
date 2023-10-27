import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/Pages/PlaySongPage.dart';
import 'package:music_player/components/SongTile.dart';
import 'package:music_player/components/TrendingSogSlider.dart';
import 'package:music_player/components/songHeader.dart';
import 'package:music_player/config/Colors.dart';
import 'package:music_player/controller/CloudSongController.dart';
import 'package:music_player/controller/SongPlayerController.dart';
import 'package:music_player/controller/songDataController.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SongPageHeader(),
              const SizedBox(height: 20),
              const TrendingSongSlider(),
              const SizedBox(height: 20),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          songDataController.isDeviceSong.value = false;
                        },
                        child: Text("Cloud Song",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? lableColor
                                      : primaryColor,
                                ))),
                    InkWell(
                      onTap: () {
                        songDataController.isDeviceSong.value = true;
                      },
                      child: Text(
                        "Device Song",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: songDataController.isDeviceSong.value
                                  ? primaryColor
                                  : lableColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => songDataController.isDeviceSong.value
                    ? Column(
                        children: songDataController.localSongList.value
                            .map((e) => SongTile(
                                  onPress: () {
                                    songPlayerController.playLocalAudio(e);
                                    songDataController.findCurrentSongPlayingIndex(e.id);
                                    Get.to(PlaySongPage(
                                
                                    ));
                                  },
                                  songName: e.title,
                                ))
                            .toList())
                    : Column(
                        children: cloudSongController.cloudSongList.value.map((e) =>SongTile(
                                  onPress: () {
                                    songPlayerController.playCloudAudio(e);
                                    songDataController.findCurrentSongPlayingIndex(e.id!);
                                    Get.to(PlaySongPage());
                                  },
                                  songName: e.title!,
                                ) ).toList(),
                      ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
