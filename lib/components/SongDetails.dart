import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/SongPlayerController.dart';

class SongDetails extends StatelessWidget {

  
  const SongDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/play_outline.svg"),
            SizedBox(width: 10),
            Text(
              "210 Plays",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Obx(() => Text(
                "${songPlayerController.songTitle.value}",
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),)
            ),
            SvgPicture.asset(
              "assets/icons/download.svg",
              width: 25,
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${songPlayerController.songArtist.value}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),)
      ],
    );
  }
}
