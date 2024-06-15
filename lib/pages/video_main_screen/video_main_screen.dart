import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:teaching_app/pages/video_main_screen/controller/video_main_screen_controller.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/chapter_list_widget/chapter_list_widget.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/dialog_content.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/play_by_url_widget.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/video_play_widget/video_play_widget.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';
import 'package:teaching_app/widgets/dialog_widget.dart';
import 'package:teaching_app/widgets/edit_text.dart';
import 'package:teaching_app/widgets/elevated_card.dart';
import 'package:whiteboard/whiteboard.dart';

import '../../app_theme.dart';
import '../../modals/tbl_institute_topic_data.dart';
import '../../widgets/address_header.dart';
import '../../widgets/flag_container.dart';
// import '../add_content_planning/controller/content_planning_controller.dart';

class VideoMainScreen extends StatelessWidget {
  const VideoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: VideoMainScreenController(),
        builder: (_) {
          return AppScaffold(
            showTopRadius: false,
            showAppbar: true,
            bgColor: ThemeColor.scaffoldBgColor,
            showLeading: true,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: _.isContinueWatching.value == true
                        ? Obx(() => ElevatedCard(
                        child: AddressHeader(
                          address:
                          "${_.className} / ${_.subjectName} / ${_.chapterName} / ${_.topicName}",
                        )))
                        : Obx(() => ElevatedCard(
                        child: AddressHeader(
                          address:
                          "${_.className} / ${_.chapterName} / ${_.topicName}",
                        ))),
                  ),
                  Expanded(
                    flex: 9,
                    child: LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        // Wide screen: use Row
                        return Row(
                          children: [
                            Expanded(flex:6,child: interactiveLayout(context)),
                            Expanded(flex:4,child: contentLayout(context)),
                          ],
                        );
                      } else {
                        return Container(
                          child: Column(
                            children: [
                              Expanded(flex:6,child: interactiveLayout(context)),
                              Expanded(flex:4,child: contentLayout(context)),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget showCustomDialog(BuildContext context, String flagTitle,
      List<InstituteTopicData> dataList) {
    VideoMainScreenController controller =
    Get.find<VideoMainScreenController>();
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            10), // Adjust this value to decrease/increase rounded corners
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.75,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close)),
                const SizedBox(
                  height: 8,
                ),
                FlagContainer(
                  flagTitle: flagTitle,
                  flagTitleColor: ThemeColor.darkBlue4392,
                  bgColor: ThemeColor.scaffoldBgColor,
                  child: VideoMainScreenTopicDataSelecter(
                    controller: controller,
                    dataList: dataList,
                  ), // Pass the appropriate controller
                ),
              ]),
        ),
      ),
    );
  }
  Widget interactiveLayout(BuildContext context){
    return GetBuilder(
      init: VideoMainScreenController(),
      builder: (_) {return Obx(() {
        final topics = _.topics.value;
        // print("topics length ${topics.length} : ${topics[0].instituteTopicId}");
        // print(topics);
        if (topics.isNotEmpty) {
          return ElevatedCard(
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          _.openWhiteBoard.value == true
                              ? Expanded(
                            child: ElevatedCard(
                                child: Stack(
                                  children: [
                                    WhiteBoard(
                                      strokeColor: _
                                          .selectedColor
                                          .value,
                                      isErasing: _
                                          .isErasing
                                          .value,
                                      controller: _
                                          .whiteBoardController,
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Column(
                                            children: [
                                              IconButton(
                                                icon:
                                                const Icon(Icons.color_lens),
                                                onPressed: () => _selectColor(
                                                    context,
                                                    _),
                                              ),
                                              IconButton(
                                                icon:
                                                const Icon(Icons.undo),
                                                onPressed:
                                                    () {
                                                  _.undo();
                                                },
                                              ),
                                              IconButton(
                                                icon:
                                                const Icon(Icons.redo),
                                                onPressed:
                                                    () {
                                                  _.redo();
                                                },
                                              ),
                                              IconButton(
                                                icon:
                                                const Icon(Icons.brush),
                                                onPressed:
                                                    () {
                                                  _.isErasing.toggle();
                                                },
                                              ),
                                              IconButton(
                                                icon:
                                                const Icon(Icons.clear),
                                                onPressed:
                                                    () {
                                                  _.clear();
                                                },
                                              ),
                                            ])),
                                  ],
                                )),
                          )
                              : _.openPlayWithUrl
                              .value ==
                              true
                              ? Expanded(
                            child:
                            ElevatedCard(
                              child:
                              VideoPlayByUrlWidget(
                                url: _
                                    .playByUrlController
                                    .text,
                              ),
                            ),
                          )
                              : Obx(() => Expanded(
                            child:
                            VideoPlayWidget(
                              topic: _
                                  .currentTopicData
                                  .value,
                            ),
                          )),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: SpeedDial(
                          animatedIcon:
                          AnimatedIcons.add_event,
                          backgroundColor: Colors.blue,
                          overlayColor: Colors.white,
                          overlayOpacity: 0,
                          direction:
                          SpeedDialDirection.up,
                          children: [
                            SpeedDialChild(
                              child: const Icon(Icons
                                  .question_answer_outlined),
                              backgroundColor:
                              Colors.grey,
                              label: 'Questions',
                              onTap: () async {
                                _.openWhiteBoard.value =
                                false;
                                _.openPlayWithUrl
                                    .value = false;
                                // showDialog(
                                // context: context,
                                // builder:
                                // (BuildContext context) {
                                // return showCustomDialog(
                                // context,
                                // 'eMaterial',
                                // _.videotopics.value);
                                // },
                                // );
                              },
                            ),
                            SpeedDialChild(
                              child: const Icon(
                                  Icons.picture_as_pdf),
                              backgroundColor:
                              Colors.grey,
                              label: 'AI Content',
                              onTap: () async {
                                _.openWhiteBoard.value =
                                false;
                                _.openPlayWithUrl
                                    .value = false;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext
                                  context) {
                                    return showCustomDialog(
                                        context,
                                        'AI Content',
                                        _.aiContentTopics
                                            .value);
                                  },
                                );
                              },
                            ),
                            SpeedDialChild(
                              child: const Icon(
                                  Icons.picture_as_pdf),
                              backgroundColor:
                              Colors.grey,
                              label: 'Play By Url',
                              onTap: () async {
                                _.openWhiteBoard.value =
                                false;
                                // _.openPlayWithUrl.value = true;

                                // var result = await Get.bottomSheet(
                                //   showPlayByUrlDialog(
                                //       context,
                                //       'Play By Url',
                                //       _.ematerialtopics
                                //           .value),
                                //   ignoreSafeArea: false,
                                //   isScrollControlled: true,
                                // );

                                showDialog(
                                  context: context,
                                  builder: (BuildContext
                                  context) {
                                    return showPlayByUrlDialog(
                                        context,
                                        'Play By Url',
                                        _.ematerialtopics
                                            .value);
                                  },
                                );
                              },
                            ),
                            SpeedDialChild(
                              child: const Icon(
                                  Icons.picture_as_pdf),
                              backgroundColor:
                              Colors.grey,
                              label: 'eMaterial',
                              onTap: () async {
                                _.openPlayWithUrl
                                    .value = false;
                                _.openWhiteBoard.value =
                                false;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext
                                  context) {
                                    return showCustomDialog(
                                        context,
                                        'eMaterial',
                                        _.ematerialtopics
                                            .value);
                                  },
                                );
                              },
                            ),
                            SpeedDialChild(
                              child: const Icon(Icons
                                  .video_collection_outlined),
                              backgroundColor:
                              Colors.grey,
                              label: 'Video',
                              onTap: () async {
                                _.openWhiteBoard.value =
                                false;
                                _.openPlayWithUrl
                                    .value = false;

                                showDialog(
                                  context: context,
                                  builder: (BuildContext
                                  context) {
                                    return showCustomDialog(
                                        context,
                                        'Video',
                                        _.videotopics
                                            .value);
                                  },
                                );
                              },
                            ),
                            SpeedDialChild(
                              child: const Icon(Icons
                                  .video_collection_outlined),
                              backgroundColor:
                              Colors.grey,
                              label: 'WhiteBoard',
                              onTap: () async {
                                _.openWhiteBoard.value =
                                true;
                                _.openPlayWithUrl
                                    .value = false;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Render a placeholder widget or loading indicator
          return const Center(
              child:
              CircularProgressIndicator()); // Example placeholder
        }
      }); },
    );
  }

  Widget contentLayout(BuildContext context){
    return GetBuilder(
      init: VideoMainScreenController(),
      builder: (_) {
        return Obx(() => ElevatedCard(
            child: ChapterListWidget(
              chapterData: _.chap.value,
              selectedChapterId: _.selectedTopic.value
                  ?.topic.instituteChapterId,
              selectedTopicId: _.selectedTopic.value?.topic
                  .onlineInstituteTopicId,
            ))); },
    );
  }

  Widget showPlayByUrlDialog(BuildContext context, String flagTitle,
      List<InstituteTopicData> dataList) {
    VideoMainScreenController controller =
    Get.find<VideoMainScreenController>();

    final formKey = GlobalKey<FormState>();

    return
      // DialogWidget(
      //     dialogTitle: "Play by Url", child: SingleChildScrollView(
      //   child: SizedBox(
      //     width: MediaQuery.of(context).size.width * 0.60,
      //     // height: MediaQuery.of(context).size.height * 0.45,
      //     child: Form(
      //       key: formKey,
      //       child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             EditText(
      //               hint: "Paste the link here",
      //               labelText: "Link",
      //               controller: controller.playByUrlController,
      //               onValidate: (value) {
      //                 if (value!.isEmpty) {
      //                   return "Please fill this field";
      //                 }
      //                 return null;
      //               },
      //             ),
      //             EditText(
      //               hint: "Enter the title",
      //               labelText: "Title",
      //               controller: controller.playByUrlTitleController,
      //               onValidate: (value) {
      //                 if (value!.isEmpty) {
      //                   return "Please fill this field";
      //                 }
      //                 return null;
      //               },
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 IconButton(
      //                     onPressed: () {
      //                       if (formKey.currentState!.validate()) {
      //                         controller.openPlayWithUrl.value = true;
      //                         controller.openWhiteBoard.value = false;
      //                         controller.savePlayByUrl();
      //                         Get.back();
      //                       }
      //                     },
      //                     icon: const Icon(Icons.search)),
      //               ],
      //             )
      //           ]),
      //     ),
      //   ),
      // ),);

      AlertDialog(
          backgroundColor: Colors.white,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(
          //       10), // Adjust this value to decrease/increase rounded corners
          // ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EditText(
                      hint: "Paste the link here",
                      labelText: "Link",
                      controller: controller.playByUrlController,
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return "Please fill this field";
                        }
                        return null;
                      },
                    ),
                    EditText(
                      hint: "Enter the title",
                      labelText: "Title",
                      controller: controller.playByUrlTitleController,
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return "Please fill this field";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.openPlayWithUrl.value = true;
                                controller.openWhiteBoard.value = false;
                                controller.savePlayByUrl();
                                Get.back();
                              }
                            },
                            icon: const Icon(Icons.search)),
                      ],
                    )
                  ]),
            ),
          ));
  }

  void _selectColor(BuildContext context, _) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _.selectedColor.value,
              onColorChanged: (color) {
                _.selectedColor.value = color;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
