import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/chapter_list_widget/controller/chapter_list_controller.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/chapter_list_widget/topic_item.dart';
import 'package:teaching_app/widgets/text_view.dart';

import '../../../dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';

class ChapterListWidget extends StatelessWidget {
  final List<LocalChapter>? chapterData;
  final int? selectedChapterId;
  final int? selectedTopicId;
  const ChapterListWidget({super.key, required this.chapterData,this.selectedChapterId,this.selectedTopicId});

  @override
  Widget build(BuildContext context) {
    print("in videos screen ids : ${selectedChapterId} :${selectedTopicId} ");
    return GetBuilder(
        init: ChapterListWidgetController(),
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeColor.greyLight,
                ),
                color: ThemeColor.white,
                borderRadius: BorderRadius.circular(10)),
            width: 400,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: TextView(
                    "Chapter / Topic List",
                    fontweight: FontWeight.bold,
                    fontsize: 16,
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, right: 15.0, left: 15),
                    child: chapterData != null
                        ? ListView.builder(
                            itemCount: chapterData!.length,
                            itemBuilder: (context, index) {
                              final chapter = chapterData![index].chapter;
                              final isSelected = chapter.onlineInstituteChapterId == selectedChapterId;
                              // print("in videos checking ${chapter.onlineInstituteChapterId} : ${selectedChapterId}");
                              final topic = chapterData![index].topics;
                              return Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  trailing: const SizedBox(),
                                  collapsedBackgroundColor: ThemeColor.white,
                                  backgroundColor: ThemeColor.scaffoldBgColor,
                                  collapsedTextColor: Colors.black,
                                  textColor: ThemeColor.darkBlue4392,
                                  initiallyExpanded: isSelected,
                                  onExpansionChanged: (isExpanded) {
                                    _.isExpanded.value = isExpanded;
                                  },
                                  title: TextView(
                                    "${index + 1}. ${chapter.chapterName}",
                                    fontsize: 14,
                                    fontweight: FontWeight.bold,
                                    textColor: null,
                                  ),
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: topic.length,
                                      itemBuilder: (context, topicIndex) {
                                        final topi = topic[topicIndex];
                                        final isSelected = topi.topic.onlineInstituteTopicId == selectedTopicId;
                                        print("in videos checking ${topi.topic.onlineInstituteTopicId} : ${selectedTopicId}");
                                        return TopicItemWidget(
                                          topic: topi,
                                          topicIndex: topicIndex,
                                          isSelected: isSelected,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        :  Center(child:TextView("No Data Found"),),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
