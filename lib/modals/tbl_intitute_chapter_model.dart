class InstituteChapter {
  final int instituteChapterId;
  final int onlineInstituteChapterId;
  final int parentInstituteId;
  final int instituteCourseId;
  final int instituteSubjectId;
  final String? unitName;
  final String? chapterName;
  final String? chapterDescription;
  final String? priority;
  final String? status;
  final String? marks;
  final String? numberOfPeriods;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteChapter({
    required this.instituteChapterId,
    required this.onlineInstituteChapterId,
    required this.parentInstituteId,
    required this.instituteCourseId,
    required this.instituteSubjectId,
    this.unitName,
    this.chapterName,
    this.chapterDescription,
    this.priority,
   this.status,
    this.marks,
    this.numberOfPeriods,
    required this.entryDate,
    required this.lastUpdateDate,
  });

  // Factory method to create an instance from a map (e.g., from the database)
  factory InstituteChapter.fromMap(Map<String, dynamic> map) {
    return InstituteChapter(
      instituteChapterId: map['institute_chapter_id'],
      onlineInstituteChapterId: map['online_institute_chapter_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteCourseId: map['institute_course_id'],
      instituteSubjectId: map['institute_subject_id'],
      unitName: map['unit_name'],
      chapterName: map['chapter_name'],
      chapterDescription: map['chapter_description'],
      priority: map['priority'],
      status: map['status'],
      marks: map['marks'],
      numberOfPeriods: map['number_of_periods'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert the instance to a map (e.g., for inserting/updating in the database)
  Map<String, dynamic> toMap() {
    return {
      'institute_chapter_id': instituteChapterId,
      'online_institute_chapter_id': onlineInstituteChapterId,
      'parent_institute_id': parentInstituteId,
      'institute_course_id': instituteCourseId,
      'institute_subject_id': instituteSubjectId,
      'unit_name': unitName,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'priority': priority,
      'status': status,
      'marks': marks,
      'number_of_periods': numberOfPeriods,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
