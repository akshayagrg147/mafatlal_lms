import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/dashboard_content/controller/dashboard_controller.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/header/header_dashboard_controller.dart';
import 'package:teaching_app/widgets/address_header.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/continue_watching/dashboard_continue_watching.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/header/header_dashboard.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/open_subject_menu_screen.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardHeaderController(),
        builder: (_) {
          return AppScaffold(
            showTopRadius: false,
            showAppbar: false,
            bgColor: ThemeColor.scaffoldBgColor,
            showLeading: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const DashboardHeaderWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    // Obx(() =>
                    Card(
                      elevation: 5,
                      child: DashboardContinueWatchingWidget(
                        cData: _.cData,
                        // chapterData: _.allSubjectsData,
                      ),
                      // )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (_.selectedSubject.value != null) {
                        // print("in index error: ${_.allSubjectsData.length}");
                        return Column(
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 10,
                              child: AddressHeader(
                                topicNumber: _.selectedClass.value!
                                        .instituteCourseName ??
                                    "",
                                topicTitle:
                                    _.selectedSubject.value!.subjectName,
                                isMenuHeader: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (_.allSubjectsData[_.selectedSubject
                                .value!.onlineInstituteSubjectId]!.isNotEmpty)
                            DashboardOpenedSubjectMenuScreen(
                              selectedSubject: _.selectedSubject.value!.onlineInstituteSubjectId,
                                inProgress: _.allSubjectsData[_.selectedSubject
                                    .value!.onlineInstituteSubjectId]!['inProgress']!,
                                completed: _.allSubjectsData[_.selectedSubject
                                    .value!.onlineInstituteSubjectId]!['completed']!,
                                toDo: _.allSubjectsData[_.selectedSubject.value!
                                    .onlineInstituteSubjectId]!['toDo']!),
                            const SizedBox(height: 20),
                          ],
                        );
                      }
                      if (_.selectedSubject.value == null &&
                          _.selectedClass.value != null && _.allSubjectsData.isNotEmpty) {
                        return Column(
                          children: _.subjectList.map((subject) {
                            // print("in index error: ${_.allSubjectsData.length} :${subject.onlineInstituteSubjectId}: ${_.allSubjectsData[subject.onlineInstituteSubjectId]}");

                            final classNu = _.selectedClass.value!;
                            final data =
                                _.allSubjectsData[subject.onlineInstituteSubjectId] ??
                                    {};

                            final inProgress = data['inProgress'] ?? [];
                            final toDo = data['toDo'] ?? [];
                            final completed = data['completed'] ?? [];

                            // print(
                            //     "dashboard screen id : ${subject.instituteSubjectId} : ${classNu.instituteCourseName}");
                            return Column(
                              children: [
                                Card(
                                  color: Colors.white,
                                  elevation: 10,
                                  child: AddressHeader(
                                    topicNumber: _.selectedClass.value!
                                        .instituteCourseName
                                        .toString(),
                                    topicTitle: subject.subjectName,
                                    isMenuHeader: true,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                DashboardOpenedSubjectMenuScreen(
                                  selectedSubject: subject.onlineInstituteSubjectId,
                                    inProgress: inProgress,
                                    completed: completed,
                                    toDo: toDo
                                ),
                                // DashboardOpenedSubjectMenuScreen(subject: subject, courseId: _.selectedClass.value!.instituteCourseId,),
                                const SizedBox(height: 20),
                              ],
                            );
                          }).toList(),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
