import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/widgets/opened_menu_item_controller.dart';
import 'package:teaching_app/utils/contants.dart';
import 'package:teaching_app/widgets/elevated_button.dart';
import 'package:teaching_app/widgets/filled_arrow_icon_widget.dart';
import 'package:teaching_app/widgets/text_view.dart';

import '../../../../../database/datebase_controller.dart';

class DashboardOpenedSubjectMenuItemWidget extends StatelessWidget {
  final List<LocalChapter> model;
  final bool isToDo;
  final int selectedSubject;

  const DashboardOpenedSubjectMenuItemWidget(
      {super.key,
      required this.selectedSubject,
      required this.model,
      required this.isToDo});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardOpenMenuItemController(),
        builder: (_) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 15, left: 15, right: 15),
            child: ListView.builder(
              itemCount: model.length,
              itemBuilder: (context, index) {
                // print("in hereee ${model.length}");
                final chapter = model[index].chapter;
                final topics = model[index].topics;
                return Obx(() => Card(
                      elevation: 5,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: ThemeColor.greyLight)),
                          child: ExpansionTile(
                            collapsedBackgroundColor: ThemeColor.white,
                            backgroundColor: ThemeColor.lightBlueF5F9,
                            collapsedTextColor: ThemeColor.darkBlue4392,
                            textColor: ThemeColor.darkBlue4392,
                            onExpansionChanged: (isExpanded) {
                              _.isExpanded.value = isExpanded;
                            },
                            trailing: FilledArrowIcon(
                              direction: _.isExpanded.value
                                  ? Direction.up
                                  : Direction.down,
                            ),
                            title: Text(chapter.chapterName ?? ""),
                            children: [
                              Container(
                                color: ThemeColor
                                    .white, // Set background color for content
                                child: _buildChapterContent(topics),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          );
        });
  }

  Widget _buildChapterContent(List<LocalTopic> localTopic) {
    return Column(
      children: [
        Table(
          columnWidths: {
            0: const FlexColumnWidth(9),
            1: const FlexColumnWidth(3.5),
            2: const FlexColumnWidth(3.5),
            3: const FlexColumnWidth(3.5),
            4: const FlexColumnWidth(3.5),
          },
          border: TableBorder.all(color: ThemeColor.greyLight),
          children: [
            TableRow(
              children: [
                TableCell(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2, top: 8, bottom: 8),
                      child: TextView(
                        'Topics',
                        fontsize: 12,
                      )),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2, top: 8, bottom: 8),
                      child: TextView(
                        'Media',
                        fontsize: 12,
                      )),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 2, top: 8, bottom: 8),
                  child: Center(
                    child: TextView(
                      'E-Material',
                      fontsize: 12,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2, top: 8, bottom: 8),
                      child: TextView(
                        'Questions',
                        fontsize: 12,
                      )),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2.0, right: 2, top: 8, bottom: 8),
                  child: Center(
                    child: TextView(
                      'Quiz',
                      fontsize: 12,
                    ),
                  ),
                )),
              ],
            ),
            ...localTopic.map((topic) {
              return TableRow(
                children: [
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(children: [
                            !isToDo
                                ? const Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                    size: 16,
                                  )
                                : const Icon(
                                    Icons.circle,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                            // const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  topic.topic.topicName ?? "",
                                  fontsize: 13,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          print("outside");
                                          if (isToDo) {
                                            print("inside");

                                            void addToProgress(
                                                {required int courseId,
                                                required int subjectId,
                                                required int chapterId,
                                                required int topicId}) async {
                                              print(
                                                  "in adding : ${courseId} : ${subjectId} : ${chapterId} : ${topicId}");

                                              final DatabaseController
                                                  myDataController = Get.find();

                                              Map<String, dynamic> data = {
                                                // 'institute_user_content_access_id': 4, // Don't include this field for auto-increment
                                                'online_institute_user_content_access_id':
                                                    null,
                                                'parent_institute_id': 17,
                                                'institute_id': 10967,
                                                'institute_user_id': 2,
                                                'user_type': 'Employee',
                                                'institute_course_id':
                                                    chapterId,
                                                'institute_course_breakup_id':
                                                    null,
                                                'institute_subject_id':
                                                    subjectId,
                                                'institute_chapter_id':
                                                    chapterId,
                                                'institute_topic_id': topicId,
                                                'institute_topic_data_id': 6299,
                                                'last_access_start_time':
                                                    '12:28:54',
                                                'last_access_end_time': null,
                                                'total_access_time': 0,
                                                'no_of_views': null,
                                                'is_updated': 0,
                                              };

                                              try {
                                                int id = await myDataController
                                                    .insert(
                                                        'tbl_institute_user_content_access_2023_2024',
                                                        data);
                                                print("Inserted row id: $id");
                                              } catch (e) {
                                                print(
                                                    "Error inserting data: $e");
                                              }
                                            }

                                            // final DashboardOpenMenuItemController controller = Get.find();
                                            addToProgress(
                                                courseId: topic
                                                    .topic.instituteCourseId,
                                                subjectId: selectedSubject,
                                                chapterId: topic
                                                    .topic.instituteChapterId,
                                                topicId: topic.topic
                                                    .onlineInstituteTopicId);
                                          }
                                          Get.toNamed("/videoScreen",
                                              arguments: [false, model, topic]);
                                        },
                                        icon: Icon(
                                          Icons.play_circle_fill_outlined,
                                          color: ThemeColor.green,
                                          size: 20,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          Get.toNamed('/contentPlanning',
                                              arguments: [topic]);
                                        },
                                        icon: Icon(
                                          Icons.queue_play_next_outlined,
                                          color: ThemeColor.green,
                                          size: 20,
                                        )),
                                  ],
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     TextView(
                                //       topic.topic.topicName ?? "",
                                //       fontsize: 13,
                                //     ),
                                //     Row(
                                //       mainAxisSize: MainAxisSize.min,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //
                                //       children: [
                                //         IconButton(
                                //             onPressed: () {
                                //               print("outside");
                                //               if (isToDo) {
                                //                 print("inside");
                                //
                                //                 void addToProgress(
                                //                     {required int courseId,
                                //                     required int subjectId,
                                //                     required int chapterId,
                                //                     required int
                                //                         topicId}) async {
                                //                   print(
                                //                       "in adding : ${courseId} : ${subjectId} : ${chapterId} : ${topicId}");
                                //
                                //                   final DatabaseController
                                //                       myDataController =
                                //                       Get.find();
                                //
                                //                   Map<String, dynamic> data = {
                                //                     // 'institute_user_content_access_id': 4, // Don't include this field for auto-increment
                                //                     'online_institute_user_content_access_id':
                                //                         null,
                                //                     'parent_institute_id': 17,
                                //                     'institute_id': 10967,
                                //                     'institute_user_id': 2,
                                //                     'user_type': 'Employee',
                                //                     'institute_course_id':
                                //                         chapterId,
                                //                     'institute_course_breakup_id':
                                //                         null,
                                //                     'institute_subject_id':
                                //                         subjectId,
                                //                     'institute_chapter_id':
                                //                         chapterId,
                                //                     'institute_topic_id':
                                //                         topicId,
                                //                     'institute_topic_data_id':
                                //                         6299,
                                //                     'last_access_start_time':
                                //                         '12:28:54',
                                //                     'last_access_end_time':
                                //                         null,
                                //                     'total_access_time': 0,
                                //                     'no_of_views': null,
                                //                     'is_updated': 0
                                //                   };
                                //
                                //                   try {
                                //                     int id = await myDataController
                                //                         .insert(
                                //                             'tbl_institute_user_content_access_2023_2024',
                                //                             data);
                                //                     print(
                                //                         "Inserted row id: $id");
                                //                   } catch (e) {
                                //                     print(
                                //                         "Error inserting data: $e");
                                //                   }
                                //                 }
                                //
                                //                 // final DashboardOpenMenuItemController controller = Get.find();
                                //                 addToProgress(
                                //                     courseId: topic.topic
                                //                         .instituteCourseId,
                                //                     subjectId: selectedSubject,
                                //                     chapterId: topic.topic
                                //                         .instituteChapterId,
                                //                     topicId: topic.topic
                                //                         .onlineInstituteTopicId);
                                //               }
                                //               Get.toNamed("/videoScreen",
                                //                   arguments: [
                                //                     false,
                                //                     model,
                                //                     topic
                                //                   ]);
                                //             },
                                //             icon: Icon(
                                //               Icons.play_circle_fill_outlined,
                                //               color: ThemeColor.green,size: 12,
                                //             )),
                                //         IconButton(
                                //             onPressed: () {
                                //               Get.toNamed('/contentPlanning');
                                //             },
                                //             icon: Icon(
                                //               Icons.queue_play_next_outlined,
                                //               color: ThemeColor.green,size: 12,
                                //             )),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                // if (topic.completedDate != null)
                                //   TextView(
                                //     "${topic.completedDate}",
                                //     fontsize: 8,
                                //     textColor: ThemeColor.darkBlue4392,
                                //   )
                              ],
                            ),
                          ]))),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('0/${topic.mediaCount}', fontsize: 13)),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('0/${topic.eMaterialCount}',
                            fontsize: 13)),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('0/100', fontsize: 13)),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('2', fontsize: 13)),
                  )),
                ],
              );
            }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppElevatedButton(
                title: "Quiz",
                showBorder: true,
                onPressed: () {},
              ),
              AppElevatedButton(
                title: "Assignment",
                showBorder: true,
                onPressed: () {},
              ),
              AppElevatedButton(
                title: "Test",
                showBorder: true,
                onPressed: () {},
              ),
              AppElevatedButton(
                title: "Feedback",
                showBorder: true,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
