import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/modals/tbl_institute_course.dart';
import 'package:teaching_app/modals/tbl_institute_subject.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/header/header_dashboard_controller.dart';
import 'package:teaching_app/utils/ext_utils.dart';
import 'package:teaching_app/widgets/app_dropDown.dart';
import 'package:teaching_app/widgets/app_rich_text.dart';
import 'package:teaching_app/widgets/text_view.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardHeaderController(),
        builder: (_) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('/contentPlanning');
                    },
                    child: TextView(
                      "See History >",
                      textColor: ThemeColor.commonDarkBlueColor,
                    ),
                  )
                ],
              ),
              Card(
                elevation: 5,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 110,
                      decoration: const BoxDecoration(
                          color: ThemeColor.headerBgColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Obx(() => ColumnAppRichText(
                                    title: "Class *",
                                    titleWidget: const Row(
                                      children: [
                                        Text("Class"),
                                        Text(
                                          " *",
                                          style:
                                              TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    child:  AppDropDown<InstituteCourse>(
                                        onChange: (p0) async{
                                          _.selectedClass.value = p0;
                                          if(p0 !=null){
                                          await _.fetchSubjectsForClass(p0);
                                          await _.fetchDataForAllSubjects();
                                          _.fetchContinueData(p0.onlineInstituteCourseId, null);
                                          }
                                        },

                                        hintText: "Select class",
                                        value: _.selectedClass.value,
                                        items: _.classList.dropDownItem(
                                            (element) => element.instituteCourseName),
                                        height: 40)))),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Obx(() => ColumnAppRichText(
                                    title: "Subject",
                                    titleWidget: const Row(
                                      children: [
                                        Text("Subject"),
                                        Text(
                                          " *",
                                          style:
                                              TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    child: AppDropDown<InstituteSubject>(
                                        onChange: (p0) {
                                          _.selectedSubject.value = p0;
                                          if(p0 !=null){
                                            _.fetchContinueData(_.selectedClass.value!.onlineInstituteCourseId, p0.onlineInstituteSubjectId);
                                            // _.fetchData(_.selectedSubject.value!.instituteSubjectId);
                                          }
                                        },
                                        value: _.selectedSubject.value,
                                        items: _.subjectList.dropDownItem(
                                            (element) => element.subjectName!),
                                        height: 40)))),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: ColumnAppRichText(
                                    title: "Language",
                                    titleWidget: const Row(
                                      children: [
                                        Text("Language"),
                                        Text(
                                          " *",
                                          style:
                                              TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    child: AppDropDown<String>(
                                        onChange: (p0) {
                                          _.selectedLanguage.value = p0;
                                        },
                                        value: _.selectedLanguage.value,
                                        items: _.languageList.dropDownItem(
                                            (element) => element),
                                        height: 40))),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 40,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.blue,
                                    )),
                                SizedBox(height: 15,)

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: 50,
                      right: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            height: 30,
                            width: 200,
                            child: Center(
                              child: TextView(
                                "Home/Content",
                                textColor: ThemeColor.commonDarkBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ],
          );
        });
  }
}
