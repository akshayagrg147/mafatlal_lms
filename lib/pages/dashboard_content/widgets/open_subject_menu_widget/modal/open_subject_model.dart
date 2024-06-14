



import 'package:teaching_app/modals/tbl_institute_topic.dart';
import 'package:teaching_app/modals/tbl_institute_topic_data.dart';
import 'package:teaching_app/modals/tbl_intitute_chapter_model.dart';

class LocalChapter {
  final InstituteChapter chapter;
  final List<LocalTopic> topics;

  LocalChapter({
    required this.chapter,
    required this.topics,
  });
}

class LocalTopic{
  final InstituteTopic topic;
  final List<InstituteTopicData> topicData;

  LocalTopic({
  required this.topic,
  required this.topicData,
});

  int get mediaCount {
    return topicData.where((data) =>
    data.topicDataType == 'HTML5' ||
        data.topicDataType == 'MP3' ||
        data.topicDataType == 'MP4'
    ).length;
  }

  int get eMaterialCount {
    return topicData.where((data) =>
    data.topicDataType == 'Embedded'
    ).length;
  }

}

