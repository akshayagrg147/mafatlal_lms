class InstituteCourseBreakup {
  final double instituteCourseBreakupId;
  final double instituteId;
  final double parentInstituteId;
  final double instituteCourseId;
  final String instituteCourseBreakupName;
  final int priority;
  final String courseBreakStatus;
  final double? primaryClassTeacherUserId;
  final double? secondaryClassTeacherUserId;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteCourseBreakup({
    required this.instituteCourseBreakupId,
    required this.instituteId,
    required this.parentInstituteId,
    required this.instituteCourseId,
    required this.instituteCourseBreakupName,
    required this.priority,
    required this.courseBreakStatus,
    this.primaryClassTeacherUserId,
    this.secondaryClassTeacherUserId,
    this.entryDate,
    this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteCourseBreakup.fromMap(Map<String, dynamic> map) {
    return InstituteCourseBreakup(
      instituteCourseBreakupId: map['institute_course_breakup_id'],
      instituteId: map['institute_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteCourseId: map['institute_course_id'],
      instituteCourseBreakupName: map['institute_course_breakup_name'],
      priority: map['priority'],
      courseBreakStatus: map['course_break_status'],
      primaryClassTeacherUserId: map['primary_class_teacher_user_id'],
      secondaryClassTeacherUserId: map['secondary_class_teacher_user_id'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_course_breakup_id': instituteCourseBreakupId,
      'institute_id': instituteId,
      'parent_institute_id': parentInstituteId,
      'institute_course_id': instituteCourseId,
      'institute_course_breakup_name': instituteCourseBreakupName,
      'priority': priority,
      'course_break_status': courseBreakStatus,
      'primary_class_teacher_user_id': primaryClassTeacherUserId,
      'secondary_class_teacher_user_id': secondaryClassTeacherUserId,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
