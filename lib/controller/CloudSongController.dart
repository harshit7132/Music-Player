import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:music_player/Model/MySongModel.dart';

class CloudSongController extends GetxController {
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList = RxList<MySongModel>([]);
  RxList<MySongModel> trandingSongList = RxList<MySongModel>([]);

  @override
  void onInit() {
    getCloudSound();
    // TODO: implement onInit
    super.onInit();
  }

  void uploadSongToDB() async{
    MySongModel newSong = MySongModel(
      id: 1,
      title: "Suni-Nahi-Zamane-Ne-Teri-Meri-Kahaani(PagalWorld)",
      artist: "Jubain Nautiyal",
      album: "album",
      albumArt: "https://c.saavncdn.com/586/Dil-Kahe-Hindi-2020-20200904224534-500x500.jpg",
      data: "https://firebasestorage.googleapis.com/v0/b/musicplayer-3d5a1.appspot.com/o/Suni-Nahi-Zamane-Ne-Teri-Meri-Kahaani(PagalWorld).mp3?alt=media&token=6e095a5f-87b6-4ad8-96f6-4d67ffaf9140&_gl=1*uz8ayw*_ga*MTUwODI2NDM0LjE2OTc3OTYyODk.*_ga_CW55HF8NVT*MTY5ODQxODI2MC4yLjEuMTY5ODQyNDQ0NS42MC4wLjA.",
    );

    await db.collection("tranding").add(newSong.toJson());
    print("😍 Song upload to Database  😍");
  }


  void getCloudSound() async {
    cloudSongList.clear();
    await db.collection("songs").get().then((value) {
      value.docs.forEach((element) {
        cloudSongList.add(MySongModel.fromJson(element.data()));
      });
    });
    await db.collection("tranding").get().then((value) {
      value.docs.forEach((element) {
        trandingSongList.add(MySongModel.fromJson(element.data()));
      });
    });
  }

}
