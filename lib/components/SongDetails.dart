import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SongDetails extends StatelessWidget {
  final String songTitle;
  final String artistName;
  
  const SongDetails({super.key, required this.songTitle, required this.artistName});

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                "$songTitle",
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/download.svg",
              width: 25,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$artistName",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
