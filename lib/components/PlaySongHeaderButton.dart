import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_player/config/Colors.dart';

class PlaySongHeaderButton extends StatelessWidget {
  const PlaySongHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () 
          {
            Get.back();
          },
          child: Container(
            width: 40,height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: divColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: SvgPicture.asset("assets/icons/back_page.svg"),
            ),
          ),
        ),
        Container(
          width: 40,height: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: divColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: SvgPicture.asset("assets/icons/setting.svg"),
          ),
        ),
      ],
    );
  }
}
