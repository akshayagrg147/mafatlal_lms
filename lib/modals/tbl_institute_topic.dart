class InstituteTopic {
  final int instituteTopicId;
  final int onlineInstituteTopicId;
  final int parentInstituteId;
  final int instituteChapterId;
  final int instituteCourseId;
  final String? topicName;
  final String? topicDescription;
  final String? priority;
  final String? status;
  final String? ext;
  final String? lastClassTopicId;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteTopic({
    required this.instituteTopicId,
    required this.onlineInstituteTopicId,
    required this.parentInstituteId,
    required this.instituteChapterId,
    required this.instituteCourseId,
    this.topicName,
    this.topicDescription,
    this.priority,
    this.status,
    this.ext,
    this.lastClassTopicId,
    this.entryDate,
    this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteTopic.fromMap(Map<String, dynamic> map) {
    return InstituteTopic(
      instituteTopicId: map['institute_topic_id'],
      onlineInstituteTopicId: map['online_institute_topic_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteChapterId: map['institute_chapter_id'],
      instituteCourseId: map['institute_course_id'],
      topicName: map['topic_name'],
      topicDescription: map['topic_description'],
      priority: map['priority'],
      status: map['status'],
      ext: map['ext'],
      lastClassTopicId: map['last_class_topic_id'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,

    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_topic_id': instituteTopicId,
      'online_institute_topic_id': onlineInstituteTopicId,
      'parent_institute_id': parentInstituteId,
      'institute_chapter_id': instituteChapterId,
      'institute_course_id': instituteCourseId,
      'topic_name': topicName,
      'topic_description': topicDescription,
      'priority': priority,
      'status': status,
      'ext': ext,
      'last_class_topic_id': lastClassTopicId,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
