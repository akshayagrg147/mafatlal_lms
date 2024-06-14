import 'package:flutter/material.dart';
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

class VideoMainScreen extends StatelessWidget {
  const VideoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoMainScreenController>(
      init: VideoMainScreenController(),
      builder: (_) {
        return AppScaffold(
          showTopRadius: false,
          showAppbar: true,
          bgColor: ThemeColor.scaffoldBgColor,
          showLeading: true,
          body: Obx(
                () => NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                return _.isInteractingWithWhiteboard.value;
              },
              child: SingleChildScrollView(
                physics: _.isInteractingWithWhiteboard.value
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      _.isContinueWatching.value == true
                          ? Obx(
                            () => ElevatedCard(
                            child: AddressHeader(
                              address:
                              "${_.className} / ${_.subjectName} / ${_.chapterName} / ${_.topicName}",
                            )),
                      )
                          : Obx(
                            () => ElevatedCard(
                            child: AddressHeader(
                              address:
                              "${_.className} / ${_.chapterName} / ${_.topicName}",
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 600) {
                            // Wide screen: use Row
                            return Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                        () {
                                      final topics = _.topics.value;
                                      if (topics.isNotEmpty) {
                                        return ElevatedCard(
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.90,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ThemeColor.greyLight,
                                                ),
                                                color: ThemeColor.white,
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                _.openWhiteBoard.value == true
                                                    ? Expanded(
                                                  child: ElevatedCard(
                                                      child: Stack(
                                                        children: [
                                                          GestureDetector(
                                                            onPanStart: (details) {
                                                              _.isInteractingWithWhiteboard.value = true;
                                                            },
                                                            onPanEnd: (details) {
                                                              _.isInteractingWithWhiteboard.value = false;
                                                            },
                                                            child: WhiteBoard(
                                                              controller: _.whiteBoardController,
                                                              isErasing: _.isErasing.value,
                                                              strokeColor: _.selectedColor.value,
                                                            ),
                                                          ),
                                                          Positioned(
                                                              top: 10,
                                                              right: 10,
                                                              child: Column(
                                                                  children: [
                                                                    IconButton(
                                                                      icon: const Icon(
                                                                          Icons.color_lens),
                                                                      onPressed: () =>
                                                                          _selectColor(
                                                                              context, _),
                                                                    ),
                                                                    IconButton(
                                                                      icon: const Icon(
                                                                          Icons.undo),
                                                                      onPressed: () {
                                                                        _.undo();
                                                                      },
                                                                    ),
                                                                    IconButton(
                                                                      icon: const Icon(
                                                                          Icons.redo),
                                                                      onPressed: () {
                                                                        _.redo();
                                                                      },
                                                                    ),
                                                                    Obx(
                                                                          () => _.isErasing.value
                                                                          ? IconButton(
                                                                        icon: const Icon(Icons.cleaning_services_outlined),
                                                                        onPressed: () {
                                                                          _.isErasing.toggle();
                                                                        },
                                                                      )
                                                                          : IconButton(
                                                                        icon: const Icon(Icons.brush),
                                                                        onPressed: () {
                                                                          _.isErasing.toggle();
                                                                        },
                                                                      ),
                                                                    ),
                                                                    IconButton(
                                                                      icon: const Icon(
                                                                          Icons.clear),
                                                                      onPressed: () {
                                                                        _.clear();
                                                                      },
                                                                    ),
                                                                  ])),
                                                        ],
                                                      )),
                                                )
                                                    : _.openPlayWithUrl.value ==
                                                    true
                                                    ? Expanded(
                                                  child: ElevatedCard(
                                                    child:
                                                    VideoPlayByUrlWidget(
                                                      url: _
                                                          .playByUrlController
                                                          .text,
                                                    ),
                                                  ),
                                                )
                                                    : Obx(
                                                      () =>
                                                      ElevatedCard(
                                                        child:
                                                        VideoPlayWidget(
                                                          topic: _
                                                              .currentTopicData
                                                              .value,
                                                        ),
                                                      ),
                                                ),
                                                const SizedBox(),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    height: 40,
                                                    width: 40,
                                                    child: SpeedDial(
                                                      animatedIcon:
                                                      AnimatedIcons
                                                          .add_event,
                                                      backgroundColor:
                                                      Colors.blue,
                                                      overlayColor:
                                                      Colors.white,
                                                      overlayOpacity: 0.5,
                                                      spacing: 10,
                                                      direction:
                                                      SpeedDialDirection.up,
                                                      spaceBetweenChildren: 10,
                                                      children: [
                                                        SpeedDialChild(
                                                          child: const Icon(Icons
                                                              .question_answer_outlined),
                                                          backgroundColor:
                                                          Colors.grey,
                                                          label: 'Questions',
                                                          onTap: () async {
                                                            _.openWhiteBoard
                                                                .value =
                                                            false;
                                                            _.openPlayWithUrl
                                                                .value =
                                                            false;
                                                          },
                                                        ),
                                                        SpeedDialChild(
                                                          child: const Icon(Icons
                                                              .picture_as_pdf),
                                                          backgroundColor:
                                                          Colors.grey,
                                                          label: 'AI Content',
                                                          onTap: () async {
                                                            _.openWhiteBoard
                                                                .value =
                                                            false;
                                                            _.openPlayWithUrl
                                                                .value =
                                                            false;
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
                                                          child: const Icon(Icons
                                                              .picture_as_pdf),
                                                          backgroundColor:
                                                          Colors.grey,
                                                          label: 'Play By Url',
                                                          onTap: () async {
                                                            _.openWhiteBoard
                                                                .value =
                                                            false;
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
                                                          child: const Icon(Icons
                                                              .picture_as_pdf),
                                                          backgroundColor:
                                                          Colors.grey,
                                                          label: 'eMaterial',
                                                          onTap: () async {
                                                            _.openWhiteBoard
                                                                .value =
                                                            false;
                                                            _.openPlayWithUrl
                                                                .value =
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
                                                            _.openWhiteBoard
                                                                .value =
                                                            false;
                                                            _.openPlayWithUrl
                                                                .value =
                                                            false;
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
                                                            _.openWhiteBoard
                                                                .value =
                                                            true;
                                                            _.openPlayWithUrl
                                                                .value =
                                                            false;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                            child:
                                            CircularProgressIndicator()); // Example placeholder
                                      }
                                    },
                                  ),
                                ),
                                Obx(
                                      () => ElevatedCard(
                                    child: ChapterListWidget(
                                      chapterData: _.chap.value,
                                      selectedChapterId: _.selectedTopic.value
                                          ?.topic.instituteChapterId,
                                      selectedTopicId: _.selectedTopic.value
                                          ?.topic.onlineInstituteTopicId,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Obx(
                                      () {
                                    final topics = _.topics.value;
                                    if (topics.isNotEmpty) {
                                      return ElevatedCard(
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.90,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ThemeColor.greyLight,
                                              ),
                                              color: ThemeColor.white,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              _.openWhiteBoard.value == true
                                                  ? Expanded(
                                                child: GestureDetector(
                                                  onPanStart: (details) {
                                                    _.isInteractingWithWhiteboard
                                                        .value =
                                                    true;
                                                  },
                                                  onPanEnd: (details) {
                                                    _.isInteractingWithWhiteboard
                                                        .value =
                                                    false;
                                                  },
                                                  child: WhiteBoard(
                                                    controller: _.whiteBoardController,
                                                    isErasing: _.isErasing.value,
                                                    strokeColor: _.selectedColor.value,
                                                  ),
                                                ),
                                              )
                                                  : _.openPlayWithUrl.value ==
                                                  true
                                                  ? Expanded(
                                                child: ElevatedCard(
                                                  child:
                                                  VideoPlayByUrlWidget(
                                                    url: _
                                                        .playByUrlController
                                                        .text,
                                                  ),
                                                ),
                                              )
                                                  : Obx(
                                                    () => Expanded(
                                                  child:
                                                  ElevatedCard(
                                                    child:
                                                    VideoPlayWidget(
                                                      topic: _
                                                          .currentTopicData
                                                          .value,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: SpeedDial(
                                                    animatedIcon: AnimatedIcons
                                                        .add_event,
                                                    backgroundColor:
                                                    Colors.blue,
                                                    overlayColor: Colors.white,
                                                    overlayOpacity: 0.5,
                                                    spacing: 10,
                                                    direction:
                                                    SpeedDialDirection.up,
                                                    spaceBetweenChildren: 10,
                                                    children: [
                                                      SpeedDialChild(
                                                        child: const Icon(Icons
                                                            .question_answer_outlined),
                                                        backgroundColor:
                                                        Colors.grey,
                                                        label: 'Questions',
                                                        onTap: () async {
                                                          _.openWhiteBoard
                                                              .value =
                                                          false;
                                                          _.openPlayWithUrl
                                                              .value =
                                                          false;
                                                        },
                                                      ),
                                                      SpeedDialChild(
                                                        child: const Icon(Icons
                                                            .picture_as_pdf),
                                                        backgroundColor:
                                                        Colors.grey,
                                                        label: 'AI Content',
                                                        onTap: () async {
                                                          _.openWhiteBoard
                                                              .value =
                                                          false;
                                                          _.openPlayWithUrl
                                                              .value =
                                                          false;
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                            context) {
                                                              return showCustomDialog(
                                                                  context,
                                                                  'AI Content',
                                                                  _
                                                                      .aiContentTopics
                                                                      .value);
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      SpeedDialChild(
                                                        child: const Icon(Icons
                                                            .picture_as_pdf),
                                                        backgroundColor:
                                                        Colors.grey,
                                                        label: 'Play By Url',
                                                        onTap: () async {
                                                          _.openWhiteBoard
                                                              .value =
                                                          false;
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                            context) {
                                                              return showPlayByUrlDialog(
                                                                  context,
                                                                  'Play By Url',
                                                                  _
                                                                      .ematerialtopics
                                                                      .value);
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      SpeedDialChild(
                                                        child: const Icon(Icons
                                                            .picture_as_pdf),
                                                        backgroundColor:
                                                        Colors.grey,
                                                        label: 'eMaterial',
                                                        onTap: () async {
                                                          _.openWhiteBoard
                                                              .value =
                                                          false;
                                                          _.openPlayWithUrl
                                                              .value =
                                                          false;
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                            context) {
                                                              return showCustomDialog(
                                                                  context,
                                                                  'eMaterial',
                                                                  _
                                                                      .ematerialtopics
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
                                                          _.openWhiteBoard
                                                              .value =
                                                          false;
                                                          _.openPlayWithUrl
                                                              .value =
                                                          false;
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                            context) {
                                                              return showCustomDialog(
                                                                  context,
                                                                  'Video',
                                                                  _
                                                                      .videotopics
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
                                                          _.openWhiteBoard
                                                              .toggle();
                                                          _.openPlayWithUrl
                                                              .value =
                                                          false;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                          child:
                                          CircularProgressIndicator()); // Example placeholder
                                    }
                                  },
                                ),
                                Obx(
                                      () => ElevatedCard(
                                    child: ChapterListWidget(
                                      chapterData: _.chap.value,
                                      selectedChapterId: _.selectedTopic.value
                                          ?.topic.instituteChapterId,
                                      selectedTopicId: _.selectedTopic.value
                                          ?.topic.onlineInstituteTopicId,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
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

  Widget showPlayByUrlDialog(BuildContext context, String flagTitle,
      List<InstituteTopicData> dataList) {
    VideoMainScreenController controller =
    Get.find<VideoMainScreenController>();

    final formKey = GlobalKey<FormState>();

    return AlertDialog(
      backgroundColor: Colors.white,
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
      ),
    );
  }

  void _selectColor(BuildContext context, VideoMainScreenController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: controller.selectedColor.value,
              onColorChanged: (color) {
                controller.selectedColor.value = color;
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
