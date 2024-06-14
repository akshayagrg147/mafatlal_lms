import 'dart:async';
import 'package:get/get.dart';
import 'package:teaching_app/modals/tbl_institute_topic.dart';
import 'package:teaching_app/modals/tbl_institute_topic_data.dart';
import 'package:teaching_app/modals/tbl_intitute_chapter_model.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';
import '../../../../database/datebase_controller.dart';
// import '../../../../modals/tbl_la_plan_execution_2023_2024.dart';
import '../../../../modals/tbl_la_plan_execution_2023_2024.dart';
import '../../../../modals/tbl_syllabus_planning_2024_2025.dart';

class DashboardOpenedSubjectMenuController extends GetxController {

  final DatabaseController myDataController = Get.find();
  RxList<LocalChapter> allChapterList = <LocalChapter>[].obs;
  RxList<LocalChapter> inProgress = <LocalChapter>[].obs;
  RxList<LocalChapter> toDo = <LocalChapter>[].obs;
  RxList<LocalChapter> completed = <LocalChapter>[].obs;

  final int courseId;
  final int subjectId;

  DashboardOpenedSubjectMenuController({required this.courseId, required this.subjectId});

  @override
  void onInit() {
    super.onInit();
    print("fetching data, : ${courseId} : ${subjectId}");
    // fetchData(courseId, subjectId);
  }


  // Future<void> fetchData(int courseId, int subjectId) async {
  //   try {
  //     List<LocalChapter> chapters = await fetchAllChapters(courseId, subjectId);
  //     // print("1 chpaters lenght: ${chapters}");
  //     allChapterList.assignAll(chapters);
  //     // print("2 allchpaterslist lenght: ${allChapterList.value}");
  //
  //     // print("object ff ${allChapterList}");
  //     await filterChaptersByExecution();
  //     await filterChaptersBySyllabusPlanning();
  //   } catch (e) {
  //     // print('Error fetching data: $e');
  //   }
  // }
  //
  // Future<List<InstituteChapter>> fetchChapters(
  //     int courseId, int subjectId) async {
  //   // print("in fetch chapter  maps $courseId  ${subjectId}");
  //   final List<Map<String, dynamic>> chapterDataMaps =  await myDataController.query(
  //     'tbl_institute_chapter',
  //     where: 'institute_course_id = ? AND institute_subject_id = ?',
  //     whereArgs: [courseId, 34],
  //   );
  //   // print("in fetch chapter  maps${chapterDataMaps.length}");
  //   final List<InstituteChapter> chapterData = chapterDataMaps.map((map) => InstituteChapter.fromMap(map)).toList();
  //   // print("in fetch chapter 3");
  //   // print("in fetch chapter data ${chapterData[0].onlineInstituteChapterId} ${chapterData[1].onlineInstituteChapterId} ${chapterData[2].onlineInstituteChapterId} ${chapterData[4].onlineInstituteChapterId} ${chapterData[3].onlineInstituteChapterId} ${chapterData[5].onlineInstituteChapterId} ${chapterData[6].onlineInstituteChapterId} ");
  //
  //   return chapterData;
  // }
  //
  // Future<List<InstituteTopic>> fetchTopics(
  //     int courseId, int chapterId) async {
  //   // print("in fetch topic 1");
  //   // print("in fetch topics  maps $courseId  ${chapterId}");
  //   final List<Map<String, dynamic>> topicsMaps =  await myDataController.query(
  //     'tbl_institute_topic',
  //     where: 'institute_course_id = ? AND institute_chapter_id = ?',
  //     whereArgs: [10, 527],
  //   );
  //   // print("in fetch topics  maps${topicsMaps.length}");
  //   // print("${topicsMaps}");
  //
  //   try {
  //     final List<InstituteTopic> topic = topicsMaps.map((map) {
  //       // print("Mapping topic data: $map");
  //       return InstituteTopic.fromMap(map);
  //     }).toList();
  //
  //     // print("in fetch topics list length: ${topic.length}");
  //     return topic;
  //   } catch (e) {
  //     // print("Error during mapping: $e");
  //     return [];
  //   }
  //   // final List<InstituteTopic> topic = topicsMaps.map((map) => InstituteTopic.fromMap(map)).toList();
  //   // print("here here");
  //   // print("in fetch topics  list${topic.length}");
  //   // return topic;
  // }
  //
  // Future<List<InstituteTopicData>>  fetchTopicData(int topicId) async {
  //   // print("in fetch topic data 1");
  //
  //   final List<Map<String, dynamic>> topicsDataMaps =  await myDataController.query(
  //     'tbl_institute_topic_data',
  //     where: 'institute_topic_id = ?',
  //     whereArgs: [topicId],
  //   );
  //
  //   // print("in fetch topic data 2 ${topicsDataMaps.length}");
  //
  //   // try {
  //   //   final List<InstituteTopicData> topicData = topicsDataMaps.map((map) {
  //   //     print("Mapping topic data topic data: $map");
  //   //     return InstituteTopicData.fromMap(map);
  //   //   }).toList();
  //   // }
  //   //
  //   // catch (e) {
  //   //   print("Error during mapping topic data: $e");
  //   //   return [];
  //   // }
  //   // return [];
  //
  //   // print("in fetch topic data  2");
  //   final List<InstituteTopicData> topicData = topicsDataMaps.map((map) => InstituteTopicData.fromMap(map)).toList();
  //   // print("in fetch topic data  3 ${topicData.length}");
  //   return topicData;
  // }
  //
  //
  // Future<List<LocalChapter>> fetchAllChapters(
  //     int courseId, int subjectId) async {
  //
  //   final List<InstituteChapter> chaptersData =
  //       await fetchChapters(courseId, subjectId);
  //
  //   // print("fetch al lchapter chaptersData length ${chaptersData.length}");
  //
  //   List<LocalChapter> chapters = [];
  //
  //
  //   for (var chapterMap in chaptersData) {
  //     final int chapterId = chapterMap.onlineInstituteChapterId;
  //     // print("fetch all chhapter chatperId: $chapterId");
  //     final List<InstituteTopic> topicsList =
  //         await fetchTopics(courseId, chapterId);
  //     // print("fetch all chapter topics List length ${topicsList.length}");
  //
  //     List<LocalTopic> topicList = [];
  //
  //     for (var topicMap in topicsList) {
  //       final int topicId = topicMap.onlineInstituteTopicId;
  //       // print("fetch all chapter topicListAdd id ${topicId}");
  //       final List<InstituteTopicData> topicDataList =
  //           await fetchTopicData(topicId);
  //
  //       topicList.add(LocalTopic(topic: topicMap, topicData: topicDataList));
  //       // print("fetch all chapter topicListAdd ${topicList.length} and ${topicDataList.length}");
  //       // // print("in chapter ff");
  //     }
  //     chapters.add(LocalChapter(chapter: chapterMap, topics: topicList));
  //     // print("fetch all chapter chaptersAdd ${chapters.length}");
  //
  //   }
  //   // print("fetch all chapter topicListAdd return ${chapters.length}");
  //   return chapters;
  // }
  //
  //
  // Future<void> filterChaptersByExecution() async {
  //   // print("in fetch execution 1");
  //
  //   final List<Map<String, dynamic>> executionDataMaps = await myDataController.query(
  //     'tbl_la_plan_execution_2024_2025',
  //   );
  //   // print("in fetch execution 2");
  //
  //   try {
  //     final List<LaPlanExecution> executionData = executionDataMaps.map((map) {
  //       // print("Mapping topic data: $map");
  //       return LaPlanExecution.fromMap(map);
  //     }).toList();
  //
  //     // print("in fetch topics list length: ${executionData.length}");
  //
  //
  //   // final List<LaPlanExecution> executionData = executionDataMaps.map((map) => LaPlanExecution.fromMap(map)).toList();
  //   // print("in fetch execution 3");
  //
  //   // Filter chapters from allChapterList that match executionData
  //   for (var execution in executionData) {
  //     List<LocalChapter> filteredChapters = allChapterList.where((chapter) =>
  //     chapter.chapter.onlineInstituteChapterId == 535 &&
  //         131 == execution.instituteSubjectId
  //     ).toList();
  //     // print("in dfd ${chapter.chapter.instituteChapterId}");
  //     // print(execution.instituteSubjectId);
  //     // print("in execution aa");
  //     if (filteredChapters.isNotEmpty) {
  //       // print(" in here aa");
  //       inProgress.assignAll(filteredChapters);
  //       // print(" in here if ${inProgress.length}");
  //       // print(" in here if 2 ${inProgress[0].chapter.onlineInstituteChapterId}");
  //       allChapterList.removeWhere((chapter) => filteredChapters.contains(chapter));
  //     }
  //   }
  //   } catch (e) {
  //     // print("Error during mapping: $e");
  //   }
  // }
  //
  // Future<void> filterChaptersBySyllabusPlanning() async {
  //   // print("in fetch syllabus 1");
  //
  //   final List<Map<String, dynamic>> syllabusDataMaps = await myDataController.query(
  //     'tbl_syllabus_planning_2024_2025',
  //   );
  //   // print("in fetch syllabus 2");
  //
  //   final List<SyllabusPlanning> syllabusData = syllabusDataMaps.map((map) => SyllabusPlanning.fromMap(map)).toList();
  //   // print("in syllabus 2 ${syllabusData.length}");
  //   // Filter chapters from allChapterList that match syllabusData
  //   for (var syllabus in syllabusData) {
  //     List<LocalChapter> filteredChapters = allChapterList.where((chapter) =>
  //     chapter.chapter.onlineInstituteChapterId == 536 &&
  //         131.0 == syllabus.instituteSubjectId
  //     ).toList();
  //
  //     if (filteredChapters.isNotEmpty) {
  //       toDo.assignAll(filteredChapters);
  //       allChapterList.removeWhere((chapter) => filteredChapters.contains(chapter));
  //       update();
  //     }
  //   }
  //
  //   // Remaining chapters in allChapterList will be considered as completed
  //   completed.assignAll(allChapterList);
  // }

}
