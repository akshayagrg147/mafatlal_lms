import 'package:flutter/material.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class VideoPlayByUrlWidget extends StatefulWidget {
  final String url;
  const VideoPlayByUrlWidget({super.key, required this.url});

  @override
  State<VideoPlayByUrlWidget> createState() => _VideoPlayByUrlWidgetState();
}

class _VideoPlayByUrlWidgetState extends State<VideoPlayByUrlWidget> {
  final _controller = YoutubePlayerController();

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void loadVideoPlayer() {
    print("in init  1: ${widget.url}");
    String id = extractYouTubeVideoId(widget.url);
    _controller.loadVideoById(videoId: id);
  }

  String extractYouTubeVideoId(String url) {
    final RegExp regExp = RegExp(
      r'^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*',
      caseSensitive: false,
      multiLine: false,
    );
    final Match? match = regExp.firstMatch(url);
    return match?.group(7) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColor.greyLight,
        ),
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.72,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  // Youtube player as widget
                  child: YoutubePlayer(
                    controller:
                        _controller, // Controler that we created earlier
                    aspectRatio:
                        16 / 9, // Aspect ratio you want to take in screen
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
