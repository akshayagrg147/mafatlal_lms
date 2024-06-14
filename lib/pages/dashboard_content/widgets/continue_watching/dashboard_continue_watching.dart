import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/continue_watching/dashboard_continue_watching_controller.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/continue_watching/widgets/video_widget.dart';
import 'package:teaching_app/widgets/flag_container.dart';

import '../../../../app_theme.dart';
import '../open_subject_menu_widget/modal/open_subject_model.dart';

class DashboardContinueWatchingWidget extends StatelessWidget {
  final List<Map<String, dynamic>> cData;
  // final Map<int,Map<String, List<LocalChapter>>> chapterData;


  const DashboardContinueWatchingWidget({super.key,required this.cData
    // ,required this.chapterData
  });

  @override
  Widget build(BuildContext context) {
    // print("in continue widget ${chapterData[4]["inProgress"]}");
    return GetBuilder(
        init: DashboardContinueWatchingController()
          // ..fetchData(classId, subjectId)
        ,
    builder: (_) {
    return FlagContainer(
      height: 335,
      flagTitle: "Continue Watching",
      flagTitleColor: ThemeColor.darkBlue4392,
      child: Padding(
        padding: const EdgeInsets.only(top: 35,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                _.scrollToPrevious();
              },
            ),
            Expanded(
              child: ListView.separated(
                controller: _.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: cData.length,
                itemBuilder: (BuildContext context, int index) {
                  // print("creating 2 ${cData.length}");
                  final video = cData[index];
                  return VideoDashboardThumbnailWidget(
                    video: video,
                    // chapterData: chapterData,
                  );
                }, separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                _.scrollToNext();
              },
            ),
          ],
        ),
      ),
    );

  });}
}











