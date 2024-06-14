import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/database/datebase_controller.dart';

import '../../../../modals/tbl_institite_user_content_access_23_24.dart';
import '../../../../modals/tbl_institute_topic_data.dart';

class DashboardContinueWatchingController extends GetxController{

  final ScrollController scrollController = ScrollController();
  // final DatabaseController myDataController = Get.find();
  // RxList<Map<String, dynamic>> cData  = <Map<String, dynamic>>[].obs;
  //
  // final int? subjectId;
  // final int? classId;
  //
  // DashboardContinueWatchingController({this.subjectId,this.classId});

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchData(classId, subjectId);
  // }






  void scrollToNext() {
    scrollController.animateTo(
      scrollController.offset + 2 * 150, // Assuming each VideoWidget is 160 pixels wide
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToPrevious() {
    scrollController.animateTo(
      scrollController.offset - 2 * 160, // Assuming each VideoWidget is 160 pixels wide
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }



  List<Map<String, String>> videos = [
  {
  'image': 'https://getwallpapers.com/wallpaper/full/a/b/4/891455-wallpaper-of-study-2560x1440-for-hd-1080p.jpg',
  'title': 'Mathematics Lecture 1',
  'class': 'Class 10',
  'subject': 'Mathematics',
  'chapter': 'Algebra',
  'topic': 'Introduction to Algebra',
  },
  {
  'image': 'https://www.homeworkhelpglobal.com/wp-content/uploads/2019/03/studying-student-on-desk.jpg',
  'title': 'Physics Lecture 1',
  'class': 'Class 12',
  'subject': 'Physics',
  'chapter': 'Mechanics',
  'topic': 'Newton\'s Laws of Motion',
  },
  ];


}