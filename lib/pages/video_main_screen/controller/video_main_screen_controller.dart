import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whiteboard/whiteboard.dart';
import '../../../database/datebase_controller.dart';
import '../../../modals/tbl_institute_topic.dart';
import '../../../modals/tbl_institute_topic_data.dart';
import '../../../modals/tbl_intitute_chapter_model.dart';
import '../../dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';

class VideoMainScreenController extends GetxController {
  final DatabaseController myDataController = Get.find();
  RxBool isContinueWatching = true.obs;

  Map<String, dynamic>? chapterData;
  var chap = RxList<LocalChapter>().obs;
  var topics = RxList<InstituteTopicData>().obs;

  var currentTopicData = Rxn<InstituteTopicData>();
  var videotopics = RxList<InstituteTopicData>().obs;
  var ematerialtopics = RxList<InstituteTopicData>().obs;
  var aiContentTopics = RxList<InstituteTopicData>().obs;

  RxBool openWhiteBoard = false.obs;
  RxBool openPlayWithUrl = false.obs;
  WhiteBoardController whiteBoardController = WhiteBoardController();
  final TextEditingController playByUrlController = TextEditingController();
  final TextEditingController playByUrlTitleController =
      TextEditingController();
  final ScrollController scrollController = ScrollController();
  RxBool isInteractingWithWhiteboard = false.obs;


  var selectedTopic = Rxn<LocalTopic>();

  var className = RxnString();
  var subjectName = RxnString();
  var chapterName = RxnString();
  var topicName = RxnString();

  @override
  void onInit() async {
    super.onInit();

    List<dynamic> args = Get.arguments;

    isContinueWatching.value = args.isNotEmpty ? args[0] : true;

    if (isContinueWatching.value == true) {
      chapterData = isContinueWatching.value == true ? args[1] : null;
      className.value = chapterData!["class"];
      subjectName.value = chapterData!["subject"];
      chapterName.value = chapterData!["chapter"];
      topicName.value = chapterData!["topic"];
      fetchAllChapters(
        chapterData!["courseId"],
        chapterData!["subjectId"],
      );
      fetchOneTopicData(chapterData!["topicDataId"]);
    } else {
      // print("in else");
      chap.value.assignAll(args[1]);
      selectedTopic.value = args[2];
      className.value =
          await fetchClassName(selectedTopic.value!.topic.instituteCourseId);
      // subjectName.value = await fetchSubjectName(selectedTopic.value!.topic.);
      chapterName.value =
          await fetchChapterName(selectedTopic.value!.topic.instituteChapterId);
      topicName.value = selectedTopic.value!.topic.topicName;
      topics.value.assignAll(selectedTopic.value!.topicData);
      filterTopicData();
    }

    currentTopicData.value = topics.value[1];
    // Now you can use the chapterData as needed
  }

  Future<List<LocalChapter>> fetchAllChapters(
      int courseId, int subjectId) async {
    final List<InstituteChapter> chaptersData =
        await fetchChapters(courseId, subjectId);

    // print("fetch al lchapter chaptersData length ${chaptersData.length}");

    List<LocalChapter> chapters = [];

    for (var chapterMap in chaptersData) {
      final int chapterId = chapterMap.onlineInstituteChapterId;
      // print("fetch all chhapter chatperId: $chapterId");
      final List<InstituteTopic> topicsList =
          await fetchTopics(courseId, chapterId);
      // print("fetch all chapter topics List length ${topicsList.length}");

      List<LocalTopic> topicList = [];

      for (var topicMap in topicsList) {
        final int topicId = topicMap.onlineInstituteTopicId;
        // print("fetch all chapter topicListAdd id ${topicId}");
        final List<InstituteTopicData> topicDataList =
            await fetchTopicData(topicId);

        topicList.add(LocalTopic(topic: topicMap, topicData: topicDataList));
        // print("fetch all chapter topicListAdd ${topicList.length} and ${topicDataList.length}");
        // // print("in chapter ff");
      }
      chapters.add(LocalChapter(chapter: chapterMap, topics: topicList));
      // print("fetch all chapter chaptersAdd ${chapters.length}");
    }
    // print("fetch all chapter topicListAdd return ${chapters.length}");
    chap.value.assignAll(chapters);
    update();
    return chapters;
  }

  Future<List<InstituteChapter>> fetchChapters(
      int courseId, int subjectId) async {
    // print("in fetch chapter  maps $courseId  ${subjectId}");
    final List<Map<String, dynamic>> chapterDataMaps =
        await myDataController.query(
      'tbl_institute_chapter',
      where: 'institute_course_id = ? AND institute_subject_id = ?',
      whereArgs: [courseId, 34],
    );
    // print("in fetch chapter  maps${chapterDataMaps.length}");
    final List<InstituteChapter> chapterData =
        chapterDataMaps.map((map) => InstituteChapter.fromMap(map)).toList();
    // print("in fetch chapter 3");
    // print("in fetch chapter data ${chapterData[0].onlineInstituteChapterId} ${chapterData[1].onlineInstituteChapterId} ${chapterData[2].onlineInstituteChapterId} ${chapterData[4].onlineInstituteChapterId} ${chapterData[3].onlineInstituteChapterId} ${chapterData[5].onlineInstituteChapterId} ${chapterData[6].onlineInstituteChapterId} ");

    return chapterData;
  }

  Future<List<InstituteTopic>> fetchTopics(int courseId, int chapterId) async {
    // print("in fetch topic 1");
    // print("in fetch topics  maps $courseId  ${chapterId}");
    final List<Map<String, dynamic>> topicsMaps = await myDataController.query(
      'tbl_institute_topic',
      where: 'institute_course_id = ? AND institute_chapter_id = ?',
      whereArgs: [10, 527],
    );
    // print("in fetch topics  maps${topicsMaps.length}");
    // print("${topicsMaps}");

    try {
      final List<InstituteTopic> topic = topicsMaps.map((map) {
        // print("Mapping topic data: $map");
        return InstituteTopic.fromMap(map);
      }).toList();

      // print("in fetch topics list length: ${topic.length}");
      return topic;
    } catch (e) {
      // print("Error during mapping: $e");
      return [];
    }
    // final List<InstituteTopic> topic = topicsMaps.map((map) => InstituteTopic.fromMap(map)).toList();
    // print("here here");
    // print("in fetch topics  list${topic.length}");
    // return topic;
  }

  Future<List<InstituteTopicData>> fetchTopicData(int topicId) async {
    // print("in fetch topic data 1");

    final List<Map<String, dynamic>> topicsDataMaps =
        await myDataController.query(
      'tbl_institute_topic_data',
      where: 'institute_topic_id = ?',
      whereArgs: [topicId],
    );

    // print("in fetch topic data 2 ${topicsDataMaps.length}");

    // try {
    //   final List<InstituteTopicData> topicData = topicsDataMaps.map((map) {
    //     print("Mapping topic data topic data: $map");
    //     return InstituteTopicData.fromMap(map);
    //   }).toList();
    // }
    //
    // catch (e) {
    //   print("Error during mapping topic data: $e");
    //   return [];
    // }
    // return [];

    // print("in fetch topic data  2");
    final List<InstituteTopicData> topicData =
        topicsDataMaps.map((map) => InstituteTopicData.fromMap(map)).toList();
    // print("in fetch topic data  3 ${topicData.length}");
    // topics.value.assignAll(topicData);
    // print("topppic ${topics.value.length}");
    return topicData;
  }

  Future<List<InstituteTopicData>> fetchOneTopicData(int topicId) async {
    // print("in fetch topic data 1");
    // print("topppic id ${topicId}");
    final List<Map<String, dynamic>> topicsDataMaps =
        await myDataController.query(
      'tbl_institute_topic_data',
      where: 'online_institute_topic_data_id = ?',
      whereArgs: [topicId],
    );

    // print("in fetch topic data 2 ${topicsDataMaps.length}");

    // try {
    //   final List<InstituteTopicData> topicData = topicsDataMaps.map((map) {
    //     print("Mapping topic data topic data: $map");
    //     return InstituteTopicData.fromMap(map);
    //   }).toList();
    // }
    //
    // catch (e) {
    //   print("Error during mapping topic data: $e");
    //   return [];
    // }
    // return [];

    // print("in fetch topic data  2");
    final List<InstituteTopicData> topicData =
        topicsDataMaps.map((map) => InstituteTopicData.fromMap(map)).toList();
    // print("in fetch topic data  3 ${topicData.length}");
    topics.value.assignAll(topicData);
    // print("topppic ${topics.value.length}");
    // print("topppic ${topics.value[0]}");
    return topicData;
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

  Future<String> fetchSubjectName(int subjectId) async {
    try {
      final List<Map<String, dynamic>> subjectDataMaps =
          await myDataController.query(
        'tbl_institute_subject',
        where: 'online_institute_subject_id = ?',
        whereArgs: [subjectId],
      );

      if (subjectDataMaps.isNotEmpty) {
        final String subjectName =
            subjectDataMaps.first['subject_name'] as String;
        return subjectName;
      } else {
        return ''; // Handle the case where no subject name is found
      }
    } catch (e) {
      print('Error fetching subject name: $e');
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

  Future<String> fetchTopicName(int topicId) async {
    try {
      final List<Map<String, dynamic>> topicDataMaps =
          await myDataController.query(
        'tbl_institute_topic',
        where: 'online_institute_topic_id = ?',
        // Assuming online_institute_topic_id is the primary key
        whereArgs: [topicId],
      );

      if (topicDataMaps.isNotEmpty) {
        final String topicName = topicDataMaps.first['topic_name'] as String;
        return topicName;
      } else {
        return ''; // Handle the case where no topic name is found
      }
    } catch (e) {
      print('Error fetching topic name: $e');
      return ''; // Handle error case
    }
  }

  void filterTopicData() async {
    // Filter video type data
    var videoData = topics.value
        .where((topic) =>
            topic.topicDataType == "HTML5" || topic.topicDataType == "MP4")
        .toList();
    // print("filter video data :${videoData.length} : ${videoData[videoData.length -1].instituteTopicId}");
    // Filter ematerial type data
    var ematerialData = topics.value
        .where((topic) => topic.topicDataType == "e-Material")
        .toList();
    var aiContentData = topics.value
        .where((topic) => topic.topicDataType == "e-Content (AI)")
        .toList();

    try {
      final List<Map<String, dynamic>> existingSyllabusData =
          await myDataController.query(
        'tbl_syllabus_planning_2024_2025',
        where: 'institute_topic_id = ?',
        whereArgs: [
          selectedTopic.value!.topic.onlineInstituteTopicId.toDouble()
        ],
      );
      print("fetching syllabus data 1");

      List<double> existingTopicDataIds = existingSyllabusData
          .map((entry) => entry['institute_topic_data_id'] as double)
          .toList();

      print(existingTopicDataIds);

      for (var video in videoData) {
        if (existingTopicDataIds
            .contains(video.instituteTopicDataId.toDouble())) {
          videotopics.value.add(video);
        }
      }

      for (var eMaterialData in ematerialData) {
        if (existingTopicDataIds.contains(eMaterialData.instituteTopicDataId)) {
          ematerialtopics.value.add(eMaterialData);
        }
      }
    } catch (e) {
      print('Error fetching existing selections: $e');
    }
    // videotopics.value.assignAll(videoData);
    // ematerialtopics.value.assignAll(ematerialData);

    // Do something with the filtered data, e.g., update variables or UI
    // For example:
    // videoData.forEach((data) => print("Video data: ${data.topicDataId}"));
    // ematerialData.forEach((data) => print("eMaterial data: ${data.topicDataId}"));
  }

  RxBool isErasing = false.obs;
  Rx<Color> selectedColor = Colors.blue.obs;

  void undo() {
    whiteBoardController.undo();
  }

  void redo() {
    whiteBoardController.redo();
  }

  void clear() {
    whiteBoardController.clear();
  }

  void savePlayByUrl({
    String? displayType = 'Public',
    String? contentLevel = 'Basic',
    String? addedType = 'Manual',
    String? code,
    String? fileNameExt,
    String? html5FileName,
    String? referenceUrl,
    double? noOfClicks = 0,
    String? contentTag,
    String? contentLang = 'English',
    double? entryByInstituteUserId,
    String? isVerified = 'No',
    double? verifiedBy,
    String? isDeptVerified = 'No',
    double? deptVerifiedByUserId,
  }) async {
    final DatabaseController myDataController = Get.find();

    Map<String, dynamic> data = {
      'institute_id': 17,
      'parent_institute_id': 17,
      'institute_topic_id': selectedTopic.value!.topic.onlineInstituteTopicId,
      'topic_data_kind': "Other",
      'topic_data_type': "Embedded",

      'topic_data_file_code_name': playByUrlTitleController.text,
      'code': playByUrlController.text,
      'file_name_ext': fileNameExt,
      'html5_file_name': html5FileName,
      'reference_url': referenceUrl,
      'no_of_clicks': noOfClicks,

      'display_type': displayType,

      'entry_by_institute_user_id': entryByInstituteUserId,

      'content_level': contentLevel,
      'added_type': addedType,

      'content_tag': contentTag,
      'content_lang': contentLang,
      'is_verified': isVerified,
      'verified_by': verifiedBy,
      'is_local_content_available': 0,
      // 'is_dept_verified': isDeptVerified,
      // 'dept_verified_by_user_id': deptVerifiedByUserId,
    };

    try {
      int id = await myDataController.insert('tbl_institute_topic_data', data);
      print("Inserted row id: $id");
    } catch (e) {
      print("Error inserting data: $e");
    }
  }
}
