import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/add_content_planning/controller/content_planning_controller.dart';
import 'package:teaching_app/widgets/action_button.dart';
import 'package:teaching_app/widgets/text_view.dart';

import '../../../modals/tbl_institute_topic_data.dart';

class VideoMaterialSelectionWidget extends StatelessWidget {
  final bool? isVideo;
  final bool? isEMaterial;
  final bool? isQuestion;
  final ContentPlanningController controller;
  final List<InstituteTopicData> dataList;

  const VideoMaterialSelectionWidget(
      {super.key,
      required this.controller,
      required this.dataList,
      required this.isEMaterial,
      required this.isQuestion,
      required this.isVideo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, top: 40, right: 20, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading Row
          Row(
            children: [
              _buildHeadingItem('#'),
              _buildHeadingItem('Level'),
              _buildHeadingItem('Language'),
              _buildHeadingItem('Type'),
              _buildHeadingItem('Action'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          dataList.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: dataList.length, // Number of data rows
                    itemBuilder: (context, index) {
                      var data = dataList[index];
                      return _dataListTile(data, index);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                )
              : Center(child: TextView("No Data Found")),
        ],
      ),
    );
  }

  Widget _dataListTile(InstituteTopicData data, int index) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(color: ThemeColor.greyLight),
              bottom: BorderSide(color: ThemeColor.greyLight),
              end: BorderSide(color: ThemeColor.greyLight),
              start: BorderSide(color: ThemeColor.darkBlue4392, width: 10)),
          color: ThemeColor.white),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                color: Colors.green,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Obx(() {
                bool isSelected = controller.isSelected(data, isVideo ?? false,
                    isEMaterial ?? false, isQuestion ?? false);
                return Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    if (value != null) {
                      controller.toggleSelection(data, value, isVideo ?? false,
                          isEMaterial ?? false, isQuestion ?? false);
                    }
                  },
                );
              }),
              // Checkbox(value: false, onChanged: (value) {if(value != null);}),
              const SizedBox(
                width: 5,
              ),
              TextView(
                (index + 1).toString(),
                fontsize: 14,
              ),
            ],
          ))),
          Expanded(
              child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          vertical: BorderSide(color: ThemeColor.greyLight))),
                  child: Center(
                      child: TextView(
                    data.contentLevel ?? "",
                    fontsize: 14,
                  )))),
          Expanded(
              child: Center(
                  child: TextView(
            data.contentLang ?? "",
            fontsize: 14,
          ))),
          Expanded(
              child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          vertical: BorderSide(color: ThemeColor.greyLight))),
                  child: Center(
                      child: TextView(
                    data.topicDataKind!,
                    fontsize: 14,
                  )))),
          Expanded(
              child: Center(
            child: ActionButtons(
              showEdit: false,
              showDelete: false,
              showViewButton: true,
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildHeadingItem(String text) {
    return Expanded(
      child: Center(
        child: TextView(
          text,
          fontsize: 14,
          fontweight: FontWeight.bold,
        ),
      ),
    );
  }
}
