class Syllabus {
  final double syllabusId;
  final double instituteCourseId;
  final double instituteSubjectId;
  final double startYear;
  final double endYear;
  final String? examName;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? chapterId;
  final double? periods;
  final String? topicIds;
  final double? createdBy;
  final DateTime createdDate;
  final DateTime updatedDate;

  Syllabus({
    required this.syllabusId,
    required this.instituteCourseId,
    required this.instituteSubjectId,
    required this.startYear,
    required this.endYear,
    this.examName,
    this.startDate,
    this.endDate,
    this.chapterId,
    this.periods,
    this.topicIds,
    this.createdBy,
    required this.createdDate,
    required this.updatedDate,
  });

  // Factory method to create an instance from a Map
  factory Syllabus.fromMap(Map<String, dynamic> map) {
    return Syllabus(
      syllabusId: map['syllabus_id'],
      instituteCourseId: map['institute_course_id'],
      instituteSubjectId: map['institute_subject_id'],
      startYear: map['start_year'],
      endYear: map['end_year'],
      examName: map['exam_name'],
      startDate: map['start_date'] != null ? DateTime.parse(map['start_date']) : null,
      endDate: map['end_date'] != null ? DateTime.parse(map['end_date']) : null,
      chapterId: map['chapter_id'],
      periods: map['periods'],
      topicIds: map['topic_ids'],
      createdBy: map['created_by'],
      createdDate: DateTime.parse(map['created_date']),
      updatedDate: DateTime.parse(map['updated_date']),
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'syllabus_id': syllabusId,
      'institute_course_id': instituteCourseId,
      'institute_subject_id': instituteSubjectId,
      'start_year': startYear,
      'end_year': endYear,
      'exam_name': examName,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'chapter_id': chapterId,
      'periods': periods,
      'topic_ids': topicIds,
      'created_by': createdBy,
      'created_date': createdDate.toIso8601String(),
      'updated_date': updatedDate.toIso8601String(),
    };
  }
}
