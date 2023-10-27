import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/CloudSongController.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(

      body: Center(
        child: ElevatedButton(
          child: Text('CALLL DATABASE'),
          onPressed: () {
           cloudSongController.getCloudSound();
          },
        ),  
      ),
    );
  }
}