import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/modals/tbl_institute_topic_data.dart';
import 'package:teaching_app/pages/add_content_planning/controller/content_planning_controller.dart';
import 'package:teaching_app/widgets/action_button.dart';
import 'package:teaching_app/widgets/text_view.dart';

import '../controller/video_main_screen_controller.dart';

class VideoMainScreenTopicDataSelecter extends StatelessWidget {
  final VideoMainScreenController controller;
  final List<InstituteTopicData> dataList;

  const VideoMainScreenTopicDataSelecter({super.key, required this.controller,required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 40,right: 20,bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading Row
          Row(
            children: [
              _buildHeadingItem('#'),
              _buildHeadingItem('Title'),
              _buildHeadingItem('Level'),
              _buildHeadingItem('Language'),
              _buildHeadingItem('Type'),
              _buildHeadingItem('Content Type'),
              _buildHeadingItem('Action'),
            ],
          ),
          SizedBox(height: 15,),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dataList.length, // Number of data rows
            itemBuilder: (context, index) {
              var data = dataList[index];
              return _dataListTile(data, index);
            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },
          ),
        ],
      ),
    );
  }

  Widget _dataListTile(InstituteTopicData data, int index) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: BorderDirectional(top: BorderSide(color: ThemeColor.greyLight), bottom: BorderSide(color: ThemeColor.greyLight),end: BorderSide(color: ThemeColor.greyLight),start: BorderSide(color: ThemeColor.darkBlue4392,width: 10)),
          color: ThemeColor.white),
      child: Row(
        children: [
          Expanded(child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView((index + 1).toString(), fontsize: 14,),
            ],
          ))),
          Expanded(child: Container(height: 50,decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: ThemeColor.greyLight))),child: Center(child: TextView(data.topicDataFileCodeName??"" ,fontsize: 14,)))),
          Expanded(child: Container(height: 50,decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: ThemeColor.greyLight))),child: Center(child: TextView(data.contentLevel ?? "", fontsize: 14,)))),
          Expanded(child: Center(child: TextView(data.contentLang!, fontsize: 14,))),
          Expanded(child: Container(height: 50,decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: ThemeColor.greyLight))),child: Center(child: TextView(data.topicDataKind ?? "", fontsize: 14,)))),
          Expanded(child: Container(height: 50,decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: ThemeColor.greyLight))),child: Center(child: TextView(data.topicDataType ?? "", fontsize: 14,)))),
          Expanded(child: Center(
            child: ActionButtons(
              showEdit: false, showDelete: false, showViewButton: true,
              onViewClick: (){
                controller.currentTopicData.value = data;
                print("topic data 2: ${controller.currentTopicData.value?.instituteTopicDataId}");
                Get.back();
              },
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
