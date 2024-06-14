class InstituteCourse {
  final int instituteCourseId;
  final int onlineInstituteCourseId;
  final int parentInstituteId;
  final String instituteCourseName;
  final String priority;
  final String courseStatus;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteCourse({
    required this.instituteCourseId,
    required this.onlineInstituteCourseId,
    required this.parentInstituteId,
    required this.instituteCourseName,
    required this.priority,
    required this.courseStatus,
    this.entryDate,
    this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteCourse.fromMap(Map<String, dynamic> map) {
    return InstituteCourse(
      instituteCourseId: map['institute_course_id'],
      onlineInstituteCourseId: map['online_institute_course_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteCourseName: map['institute_course_name'],
      priority: map['priority'],
      courseStatus: map['course_status'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_course_id': instituteCourseId,
      'online_institute_course_id': onlineInstituteCourseId,
      'parent_institute_id': parentInstituteId,
      'institute_course_name': instituteCourseName,
      'priority': priority,
      'course_status': courseStatus,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
