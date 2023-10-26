import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/config/Colors.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPress;
  const SongTile({super.key, required this.songName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: divColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            SvgPicture.asset("assets/icons/play.svg"),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                "$songName",
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
