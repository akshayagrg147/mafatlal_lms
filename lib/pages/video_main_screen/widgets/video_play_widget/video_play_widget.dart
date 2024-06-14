import 'package:flutter/material.dart';

// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../modals/tbl_institute_topic_data.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayWidget extends StatefulWidget {
  final InstituteTopicData? topic;

  const VideoPlayWidget({super.key, required this.topic});

  @override
  State<VideoPlayWidget> createState() => _VideoPlayWidgetState();
}

class _VideoPlayWidgetState extends State<VideoPlayWidget> {
  // late VideoPlayerController _videoController;

  // var controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // ..setBackgroundColor(const Color(0x00000000))
  // ..setNavigationDelegate(
  // NavigationDelegate(
  // onProgress: (int progress) {
  // // Update loading bar.
  // },
  // onPageStarted: (String url) {},
  // onPageFinished: (String url) {},
  // onWebResourceError: (WebResourceError error) {},
  // onNavigationRequest: (NavigationRequest request) {
  // if (request.url.startsWith('https://www.youtube.com/')) {
  // return NavigationDecision.prevent;
  // }
  // return NavigationDecision.navigate;
  // },
  // ),
  // )
  // ..loadRequest(Uri.parse('https://www.youtube.com/watch?v=xXyfon-SOR8'));

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.topic?.fileNameExt == 'mp4' && widget.topic?.code != null) {
  //     _videoController = VideoPlayerController.network(widget.topic!.code!)
  //       ..initialize().then((_) {
  //         setState(() {});  // Ensure the first frame is shown
  //       });
  //   }
  // }

  late VideoPlayerController controller;
  final _controller = YoutubePlayerController();

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VideoPlayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.topic?.code != widget.topic?.code) {
      loadVideoPlayer();
    }
  }

  void loadVideoPlayer() {
    if ((widget.topic?.fileNameExt == 'mp4' ||
            widget.topic?.fileNameExt == 'html5') &&
        widget.topic?.code != null) {
      print("in init : ${widget.topic!.code!}");
      if (widget.topic!.code!.contains("https://www.youtube.com")) {
        String id = extractYouTubeVideoId(widget.topic!.code!);
        _controller.loadVideoById(videoId: id);
      } else {
        controller = VideoPlayerController.networkUrl(Uri.parse(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
      }
    }
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

  //
  @override
  void dispose() {
    print("in dispose 3");
    if ((widget.topic?.topicDataType == 'MP4' ||
            widget.topic?.topicDataType == 'HTML5') &&
        widget.topic?.code != null) {
      if (!widget.topic!.code!.contains("https://www.youtube.com")) {
        controller.dispose();
        print("in dispose 1");
      }
      // _controller.dispose();
      print("in dispose 2");
    }
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("topic data in : ${widget.topic?.instituteTopicDataId}");
    print(": ${widget.topic?.toMap()}");

    Widget contentWidget;

    // if (widget.topic?.fileNameExt == 'html5' && widget.topic?.code != null) {
    //   contentWidget = WebViewWidget(controller: controller);
    //   //     WebView(
    //   //   initialUrl: widget.topic!.code,
    //   //   javascriptMode: JavascriptMode.unrestricted,
    //   // );
    // } else

    if ((widget.topic?.fileNameExt == 'mp4' ||
            widget.topic?.fileNameExt == 'html5') &&
        widget.topic?.code != null) {
      if (widget.topic!.code!.contains("https://www.youtube.com")) {
        contentWidget = Center(
          // Youtube player as widget
          child: YoutubePlayer(
            controller: _controller, // Controler that we created earlier
            aspectRatio: 16 / 9, // Aspect ratio you want to take in screen
          ),
        );
      } else {
        contentWidget = controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : const Center(child: CircularProgressIndicator());
      }
    } else if (widget.topic?.fileNameExt == 'pdf' &&
        widget.topic?.code != null) {
      contentWidget = SfPdfViewer.network(widget.topic!.code!);
    } else if (widget.topic?.fileNameExt == 'doc' &&
        widget.topic?.code != null) {
      contentWidget = SfPdfViewer.network(widget.topic!.code!);
      // contentWidget = WebViewWidget(controller: controller);
    } else {
      contentWidget = Center(child: Text('Unsupported file type'));
    }

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
                contentWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// else
//   VlcPlayer(
//     controller: videoPlayerController,
//     aspectRatio: 16 / 9,
//     placeholder:
//         const Center(child: CircularProgressIndicator()),
//   ),

// Positioned.fill(
//   child: Signature(
//     color: Colors.black, // Color of the drawing
//     strokeWidth: 2.0, // Thickness of the drawing lines
//   ),
// ),

// late VlcPlayerController videoPlayerController;
// final pdfController = PdfController(
//   document: PdfDocument.openAsset(
//       'assets/testflutter pub run pdfx:install_web.pdf'),
// );

// File? _pdfFile;
// final String path = "C:\\Users\\Saurabh\\Documents\\11.pdf";

// @override
// void initState() {
//   super.initState();
//   _loadPdfFile();
// }
//
// Future<void> _loadPdfFile() async {
//   final filePath = 'D:\\11.pdf';
//   _pdfFile = File(filePath);
//   setState(() {});
//   print("in hh ${filePath}");
// }

// Future<void> _loadPdfFile() async {
//   final pdfBytes = await readPdfFile();
//   setState(() {
//     _pdfFile = pdfBytes;
//   });
// }

// Future<List<int>> readPdfFile() async {
//   final filePath = 'C:\\Users\\Saurabh\\Documents\\11.pdf';
//   final file = File(filePath);
//   return await file.readAsBytes();
// }
