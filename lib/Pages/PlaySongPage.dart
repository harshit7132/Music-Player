import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/components/PlaySongHeaderButton.dart';
import 'package:music_player/components/SongAndVolume.dart';
import 'package:music_player/components/SongControllerButton.dart';
import 'package:music_player/components/SongDetails.dart';
import 'package:music_player/components/Songwave.dart';
import 'package:music_player/config/Colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PlaySongPage extends StatelessWidget {

  const PlaySongPage({super.key,});


  @override
  Widget build(BuildContext context) {
  var value = 20.0;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              PlaySongHeaderButton(),
              SizedBox(height: 10),
              SongAndValume(),
              SizedBox(height: 40),
              SongDetails(
          
              ),
              SizedBox(height: 10),
              Spacer(),
              SongControllerButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
