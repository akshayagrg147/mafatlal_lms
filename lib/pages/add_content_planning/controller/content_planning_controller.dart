import 'package:get/get.dart';

import '../../../database/datebase_controller.dart';
import '../../../modals/tbl_institute_topic.dart';
import '../../../modals/tbl_institute_topic_data.dart';
import '../../../modals/tbl_syllabus_planning_2024_2025.dart';
import '../../dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';

class ContentPlanningController extends GetxController {
  final DatabaseController myDataController = Get.find();

  var selectedTopic = Rxn<LocalTopic>();
  var className = RxnString();

  // var subjectName = RxnString();
  var chapterName = RxnString();
  var topicName = RxnString();
  var topics = RxList<InstituteTopicData>().obs;

  var allVideoList = RxList<InstituteTopicData>().obs;
  var allEMaterialList = RxList<InstituteTopicData>().obs;
  var allQuestionList = RxList<InstituteTopicData>().obs;

  var selectedVideoList = RxList<InstituteTopicData>().obs;
  var selectedEMaterialList = RxList<InstituteTopicData>().obs;
  var selectedQuestionList = RxList<InstituteTopicData>().obs;

  var initiallySelectedVideoList = <InstituteTopicData>[];
  var initiallySelectedEMaterialList = <InstituteTopicData>[];

  var videoSelected = true.obs;
  var eMaterialSelected = false.obs;
  var questionSelected = false.obs;

  var englishSelected = false.obs;
  var hindiSelected = false.obs;
  var odiaSelected = false.obs;

  @override
  void onInit() async {
    super.onInit();

    List<dynamic> args = Get.arguments;

    // print("in else");
    selectedTopic.value = args[0];

    className.value =
        await fetchClassName(selectedTopic.value!.topic.instituteCourseId);
    // subjectName.value = await fetchSubjectName(selectedTopic.value!.topic.);
    chapterName.value =
        await fetchChapterName(selectedTopic.value!.topic.instituteChapterId);
    topicName.value = selectedTopic.value!.topic.topicName;
    topics.value.assignAll(selectedTopic.value!.topicData);
    filterTopicData();
    fetchQuestion(selectedTopic.value!.topic);
    fetchExistingSelections();
    // currentTopicData.value = topics.value[1];
    // Now you can use the chapterData as needed
  }

  // void submitPlan(){
  //
  // }

  void toggleSelection(InstituteTopicData data, bool isSelected, bool isVideo,
      bool isEMaterial, bool isQuestion) {
    if (isVideo) {
      isSelected
          ? selectedVideoList.value.add(data)
          : selectedVideoList.value.remove(data);
    } else if (isEMaterial) {
      isSelected
          ? selectedEMaterialList.value.add(data)
          : selectedEMaterialList.value.remove(data);
    } else if (isQuestion) {
      isSelected
          ? selectedQuestionList.value.add(data)
          : selectedQuestionList.value.remove(data);
    }
  }

  bool isSelected(InstituteTopicData data, bool isVideo, bool isEMaterial,
      bool isQuestion) {
    if (isVideo) {
      return selectedVideoList.value.contains(data);
    } else if (isEMaterial) {
      return selectedEMaterialList.value.contains(data);
    } else if (isQuestion) {
      return selectedQuestionList.value.contains(data);
    }
    return false;
  }

  void fetchQuestion(InstituteTopic topic) {}

  Future<void> fetchExistingSelections() async {
    // print(selectedTopic.value!.topic.instituteTopicId.toDouble());

    try {
      final List<Map<String, dynamic>> existingSyllabusData =
          await myDataController.query(
        'tbl_syllabus_planning_2024_2025',
        where: 'institute_topic_id = ?',
        whereArgs: [
          selectedTopic.value!.topic.onlineInstituteTopicId.toDouble()
        ],
      );

      List<double> existingTopicDataIds = existingSyllabusData
          .map((entry) => entry['institute_topic_data_id'] as double)
          .toList();

      print(existingTopicDataIds);

      //for video data
      for (var videoData in allVideoList.value) {
        if (existingTopicDataIds
            .contains(videoData.instituteTopicDataId.toDouble())) {
          selectedVideoList.value.add(videoData);
          initiallySelectedVideoList.add(videoData);
        }
      }

      // for e-material data
      for (var eMaterialData in allEMaterialList.value) {
        if (existingTopicDataIds.contains(eMaterialData.instituteTopicDataId)) {
          selectedEMaterialList.value.add(eMaterialData);
          initiallySelectedEMaterialList.add(eMaterialData);
        }
      }

      //Todo Aditya
      //for questions data
      for (var eMaterialData in allQuestionList.value) {
        if (existingTopicDataIds.contains(eMaterialData.instituteTopicDataId)) {
          selectedEMaterialList.value.add(eMaterialData);
          initiallySelectedEMaterialList.add(eMaterialData);
        }
      }
    } catch (e) {
      print('Error fetching existing selections: $e');
    }
  }

  void filterTopicData() {
    var videoData = topics.value
        .where((topic) =>
            topic.topicDataType == "HTML5" || topic.topicDataType == "MP4")
        .toList();
    // print("filter video dxata :${videoData.length} : ${videoData[videoData.length -1].instituteTopicId}");
    var eMaterialData = topics.value
        .where((topic) => topic.topicDataType == "e-Material")
        .toList();
    // var aiContentData = topics.value.where((topic) => topic.topicDataType == "e-Content (AI)").toList();

    //Todo Aditya
    var questionsData = topics.value
        .where((topic) => topic.topicDataType == "questions")
        .toList();

    allVideoList.value.assignAll(videoData);
    allVideoList.refresh();

    allEMaterialList.value.assignAll(eMaterialData);
    //Todo Aditya
    allQuestionList.value.assignAll(questionsData);
  }

  Future<String> fetchClassName(int courseId) async {
    try {
      final List<Map<String, dynamic>> classDataMaps =
          await myDataController.query(
        'tbl_institute_course',
        where: 'online_institute_course_id = ?',
        whereArgs: [courseId],
      );

      if (classDataMaps.isNotEmpty) {
        final String className =
            classDataMaps.first['institute_course_name'] as String;
        return className;
      } else {
        return ''; // Handle the case where no class name is found
      }
    } catch (e) {
      print('Error fetching class name: $e');
      return ''; // Handle error case
    }
  }

  Future<String> fetchChapterName(int chapterId) async {
    try {
      final List<Map<String, dynamic>> chapterDataMaps =
          await myDataController.query(
        'tbl_institute_chapter',
        where: 'online_institute_chapter_id = ?',
        // Assuming online_institute_chapter_id is the primary key
        whereArgs: [chapterId],
      );

      if (chapterDataMaps.isNotEmpty) {
        final String chapterName =
            chapterDataMaps.first['chapter_name'] as String;
        return chapterName;
      } else {
        return ''; // Handle the case where no chapter name is found
      }
    } catch (e) {
      print('Error fetching chapter name: $e');
      return ''; // Handle error case
    }
  }

  // {
  // syllabus_planning_id: 102.0,
  // online_syllabus_planning_id: null,
  // institute_id: 20.0,
  // institute_course_id: 12.0,
  // institute_course_breakup_id: 5702.0,
  // institute_subject_id: 131.0,
  // institute_chapter_id: 537.0,
  // institute_topic_id: 1955.0,
  // institute_topic_data_id: null,
  // question_bank_id: 25955.0,
  // content_type: Question,
  // start_year: 2024.0,
  // end_year: 2025.0,
  // created_date: 2024-05-09 19:35:46,
  // updated_date: 2024-05-09 19:35:46}

  void submitPlan() async {
    try {
      for (var videoData in selectedVideoList.value) {
        final isInserted = initiallySelectedVideoList.contains(videoData);

        if (!isInserted) {
          Map<String, dynamic> data = {
            'online_syllabus_planning_id': null,
            'institute_id': videoData.instituteId,
            'institute_course_id': selectedTopic.value!.topic.instituteCourseId,
            'institute_course_breakup_id': null,
            'institute_subject_id': null,
            'institute_chapter_id':
                selectedTopic.value!.topic.instituteChapterId,
            'institute_topic_id': videoData.instituteTopicId,
            'institute_topic_data_id': videoData.instituteTopicDataId,
            'question_bank_id': null,
            'content_type': videoData.topicDataType,
            'start_year': 2024,
            'end_year': 2025,
            'created_date': DateTime.now().toIso8601String(),
            'updated_date': DateTime.now().toIso8601String(),
            //Todo Aditya
            'entry_date': null,
            'plan_priority': null
          };

          int id = await myDataController.insert(
              'tbl_syllabus_planning_2024_2025', data);
          print(
              "Plan inserted row id: $id : ${videoData.instituteTopicId} :${videoData.instituteTopicDataId} ");
        }
      }
      for (var eMaterialData in selectedEMaterialList.value) {
        final isInserted =
            initiallySelectedEMaterialList.contains(eMaterialData);
        if (!isInserted) {
          Map<String, dynamic> data = {
            'online_syllabus_planning_id': null,
            'institute_id': eMaterialData.instituteId,
            'institute_course_id': selectedTopic.value!.topic.instituteCourseId,
            'institute_course_breakup_id': null,
            'institute_subject_id': null,
            'institute_chapter_id':
                selectedTopic.value!.topic.instituteChapterId,
            'institute_topic_id': eMaterialData.instituteTopicId,
            'institute_topic_data_id': eMaterialData.instituteTopicDataId,
            'question_bank_id': null,
            'content_type': eMaterialData.topicDataType,
            'start_year': 2024,
            'end_year': 2025,
            'created_date': DateTime.now().toIso8601String(),
            'updated_date': DateTime.now().toIso8601String(),
            //Todo Aditya
            'entry_date': null,
            'named plan_priority': null
          };

          int id = await myDataController.insert(
              'tbl_syllabus_planning_2024_2025', data);
          print(
              "Plan inserted row id: $id : ${eMaterialData.instituteTopicId} :${eMaterialData.instituteTopicDataId} ");
        }
      }

      for (var videoData in initiallySelectedVideoList) {
        if (!selectedVideoList.value.contains(videoData)) {
          await myDataController.delete(
            'tbl_syllabus_planning_2024_2025',
            where: 'institute_topic_data_id = ?',
            whereArgs: [videoData.instituteTopicDataId],
          );
          print(
              "Plan deleted: ${videoData.instituteTopicId} :${videoData.instituteTopicDataId}");
        }
      }

      for (var eMaterialData in initiallySelectedEMaterialList) {
        if (!selectedEMaterialList.value.contains(eMaterialData)) {
          await myDataController.delete(
            'tbl_syllabus_planning_2024_2025',
            where: 'institute_topic_data_id = ?',
            whereArgs: [eMaterialData.instituteTopicDataId],
          );
          print(
              "Plan deleted: ${eMaterialData.instituteTopicId} :${eMaterialData.instituteTopicDataId}");
        }
      }
    } catch (e) {
      print("Error inserting plan data: $e");
    }
  }
}
