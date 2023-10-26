import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/config/Colors.dart';

class SongTile extends StatelessWidget {
  final String songName;
  const SongTile({super.key, required this.songName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
    );
  }
}
