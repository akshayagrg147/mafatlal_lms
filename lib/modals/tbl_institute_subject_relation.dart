class InstituteSubjectCourseRel {
  final double instituteSubjectCourseRelId;
  final double? parentInstituteId;
  final double? instituteSubjectId;
  final double? instituteCourseId;
  final DateTime entryDate;
  final DateTime lastUpdateDate;

  InstituteSubjectCourseRel({
    required this.instituteSubjectCourseRelId,
    this.parentInstituteId,
    this.instituteSubjectId,
    this.instituteCourseId,
    required this.entryDate,
    required this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteSubjectCourseRel.fromMap(Map<String, dynamic> map) {
    return InstituteSubjectCourseRel(
      instituteSubjectCourseRelId: map['institute_subject_course_rel_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteSubjectId: map['institute_subject_id'],
      instituteCourseId: map['institute_course_id'],
      entryDate: DateTime.parse(map['entry_date']),
      lastUpdateDate: DateTime.parse(map['last_update_date']),
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_subject_course_rel_id': instituteSubjectCourseRelId,
      'parent_institute_id': parentInstituteId,
      'institute_subject_id': instituteSubjectId,
      'institute_course_id': instituteCourseId,
      'entry_date': entryDate.toIso8601String(),
      'last_update_date': lastUpdateDate.toIso8601String(),
    };
  }
}
