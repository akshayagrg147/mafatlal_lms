class InstituteSubject {
  final int instituteSubjectId;
  final int onlineInstituteSubjectId;
  final int parentInstituteId;
  final String subjectName;
  final String? subjectCredit;
  final String? subjectDescription;
  final String? isSubInTimetable;
  final String priority;
  final String subjectStatus;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteSubject({
    required this.instituteSubjectId,
    required this.onlineInstituteSubjectId,
    required this.parentInstituteId,
    required this.subjectName,
    this.subjectCredit,
    this.subjectDescription,
    this.isSubInTimetable,
    required this.priority,
    required this.subjectStatus,
    this.entryDate,
    this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteSubject.fromMap(Map<String, dynamic> map) {
    return InstituteSubject(
      instituteSubjectId: map['institute_subject_id'],
      onlineInstituteSubjectId: map['online_institute_subject_id'],
      parentInstituteId: map['parent_institute_id'],
      subjectName: map['subject_name'],
      subjectCredit: map['subject_credit'],
      subjectDescription: map['subject_description'],
      isSubInTimetable: map['is_sub_in_timetable'],
      priority: map['priority'],
      subjectStatus: map['subject_status'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_subject_id': instituteSubjectId,
      'online_institute_subject_id': onlineInstituteSubjectId,
      'parent_institute_id': parentInstituteId,
      'subject_name': subjectName,
      'subject_credit': subjectCredit,
      'subject_description': subjectDescription,
      'is_sub_in_timetable': isSubInTimetable,
      'priority': priority,
      'subject_status': subjectStatus,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
