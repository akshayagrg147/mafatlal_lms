class SyllabusPlanning {
  final double syllabusPlanningId;
  final double instituteId;
  final double instituteCourseId;
  final double? instituteCourseBreakupId;
  final double? instituteSubjectId;
  final double instituteChapterId;
  final double instituteTopicId;
  final double? instituteTopicDataId;
  final double? questionBankId;
  final String? contentType;
  final double startYear;
  final double endYear;
  // final DateTime? createdDate;
  // final DateTime? updatedDate;

  SyllabusPlanning({
    required this.syllabusPlanningId,
    required this.instituteId,
    required this.instituteCourseId,
    this.instituteCourseBreakupId,
    this.instituteSubjectId,
    required this.instituteChapterId,
    required this.instituteTopicId,
    this.instituteTopicDataId,
    this.questionBankId,
    this.contentType,
    required this.startYear,
    required this.endYear,
    // required this.createdDate,
    // required this.updatedDate,
  });

  // Factory method to create an instance from a Map
  factory SyllabusPlanning.fromMap(Map<String, dynamic> map) {
    return SyllabusPlanning(
      syllabusPlanningId: map['syllabus_planning_id'],
      instituteId: map['institute_id'],
      instituteCourseId: map['institute_course_id'],
      instituteCourseBreakupId: map['institute_course_breakup_id'],
      instituteSubjectId: map['institute_subject_id'],
      instituteChapterId: map['institute_chapter_id'],
      instituteTopicId: map['institute_topic_id'],
      instituteTopicDataId: map['institute_topic_data_id'],
      questionBankId: map['question_bank_id'],
      contentType: map['content_type'],
      startYear: map['start_year'],
      endYear: map['end_year'],
      // createdDate: map['created_date'] != null ? DateTime.parse(map['created_date']) : null,
      // updatedDate: map['updated_date'] != null ? DateTime.parse(map['updated_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'syllabus_planning_id': syllabusPlanningId,
      'institute_id': instituteId,
      'institute_course_id': instituteCourseId,
      'institute_course_breakup_id': instituteCourseBreakupId,
      'institute_subject_id': instituteSubjectId,
      'institute_chapter_id': instituteChapterId,
      'institute_topic_id': instituteTopicId,
      'institute_topic_data_id': instituteTopicDataId,
      'question_bank_id': questionBankId,
      'content_type': contentType,
      'start_year': startYear,
      'end_year': endYear,
      // 'created_date': createdDate?.toIso8601String(),
      // 'updated_date': updatedDate?.toIso8601String(),
    };
  }
}
