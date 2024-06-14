import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayController extends GetxController {
  late VlcPlayerController? vlcPlayerController;
  // VlcPlayerController _videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    initializePlayer();
  }


  @override
  void onClose() {
    vlcPlayerController?.dispose();
    super.onClose();
  }

        void initializePlayer() {
      vlcPlayerController = VlcPlayerController.network(
        'https://www.youtube.com/watch?v=xDxhr-zgAhE', // Replace with your video URL
        hwAcc: HwAcc.full,
        autoPlay: true,
        options: VlcPlayerOptions(),
      )..initialize().then((_) {
        update(); // This calls GetX's update method to refresh the UI
      });
    }


}


  // https://www.youtube.com/watch?v=xDxhr-zgAhE
