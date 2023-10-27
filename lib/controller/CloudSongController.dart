import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CloudSongController extends GetxController {
  final db = FirebaseFirestore.instance;

  void addSongToCloud() async {
    var newSong = {
      "id": "1",
      "album": "album",
      "albumId": "1",
      "artist": "artist",
      "artistId": "1",
      "bookmark": "bookmark",
      "composer": "composer",
      "data": "data",
      "dateAdded": "dateAdded",
      "dateModified": "dateModified",
      "displayName": "displayName",
      "duration": "duration",
      "filePath": "filePath",
      "fileSize": "fileSize",
      "genre": "genre",
      "isAlarm": "isAlarm",
      "isMusic": "isMusic",
      "isNotification": "isNotification",
      "isPodcast": "isPodcast",
      "isRingtone": "isRingtone",
      "title": "title",
      "track": "track",
      "year": "year"
    };

    await db.collection("songs").add(newSong);
  }
}
