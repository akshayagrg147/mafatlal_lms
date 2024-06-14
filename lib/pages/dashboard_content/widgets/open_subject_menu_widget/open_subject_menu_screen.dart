import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/modals/tbl_institute_subject.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/widgets/opened_menu_item_widget.dart';
import 'package:teaching_app/widgets/flag_container.dart';
import 'package:teaching_app/widgets/text_view.dart';

import 'modal/open_subject_model.dart';
import 'open_subject_controller.dart';

class DashboardOpenedSubjectMenuScreen extends StatelessWidget {
  final int selectedSubject;
  final List<LocalChapter>? inProgress;
  final List<LocalChapter>? toDo;
  final List<LocalChapter>? completed;
  const DashboardOpenedSubjectMenuScreen({super.key, required this.inProgress, required this.selectedSubject,required this.completed,required this.toDo});

  @override
  Widget build(BuildContext context) {
    // print("IN opened subject: ${inProgress[0].chapter.toMap()} ");
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1000)
      {return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            child: FlagContainer(
              flagTitleColor: ThemeColor.darkBlue4392,
              flagTitle: "In Progress",
              height: 400,
              child: inProgress != null && inProgress!.isNotEmpty
                  ? DashboardOpenedSubjectMenuItemWidget(model: inProgress!, isToDo: false,selectedSubject: selectedSubject,)
                  : Center(child: TextView("No data Found!"),)),
            ),
          ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Card(
            elevation: 5,
            child: FlagContainer(
              flagTitleColor: ThemeColor.darkRed0000,
              flagTitle: "To Do",
              height: 400,
              child:  toDo != null && toDo!.isNotEmpty
                  ? DashboardOpenedSubjectMenuItemWidget(model: toDo!, isToDo: true,selectedSubject: selectedSubject)
                  : Center(child: TextView("No data Found!"),)),

          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Card(
            elevation: 5,
            child: FlagContainer(
              flagTitleColor: ThemeColor.darkGreen8326,
              flagTitle: "Completed",
              height: 400,
              child: completed != null && completed!.isNotEmpty
                  ? DashboardOpenedSubjectMenuItemWidget(model: completed!, isToDo: false,selectedSubject: selectedSubject)
                  : Center(child: TextView("No data Found!"),)),

          ),
        ),
      ],
    );}
      else {
        return Column(
          children: [
            Card(
              elevation: 5,
              child: FlagContainer(
                  flagTitleColor: ThemeColor.darkBlue4392,
                  flagTitle: "In Progress",
                  height: 400,
                  child: inProgress != null && inProgress!.isNotEmpty
                      ? DashboardOpenedSubjectMenuItemWidget(model: inProgress!, isToDo: false,selectedSubject: selectedSubject,)
                      : Center(child: TextView("No data Found!"),)),
            ),
            const SizedBox(
              width: 20,
            ),
            Card(
              elevation: 5,
              child: FlagContainer(
                  flagTitleColor: ThemeColor.darkRed0000,
                  flagTitle: "To Do",
                  height: 400,
                  child:  toDo != null && toDo!.isNotEmpty
                      ? DashboardOpenedSubjectMenuItemWidget(model: toDo!, isToDo: true,selectedSubject: selectedSubject)
                      : Center(child: TextView("No data Found!"),)),

            ),
            const SizedBox(
              width: 20,
            ),
            Card(
              elevation: 5,
              child: FlagContainer(
                  flagTitleColor: ThemeColor.darkGreen8326,
                  flagTitle: "Completed",
                  height: 400,
                  child: completed != null && completed!.isNotEmpty
                      ? DashboardOpenedSubjectMenuItemWidget(model: completed!, isToDo: false,selectedSubject: selectedSubject)
                      : Center(child: TextView("No data Found!"),)),

            ),
          ],
        );
      }
    });
  }
}
