class InstituteCourseBreakupSession {
  final double instituteSessionId;
  final double parentInstituteId;
  final double sessionStartYear;
  final double sessionEndYear;
  final DateTime sessionStartDate;
  final DateTime sessionEndDate;
  final String? isCurrentSession;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteCourseBreakupSession({
    required this.instituteSessionId,
    required this.parentInstituteId,
    required this.sessionStartYear,
    required this.sessionEndYear,
    required this.sessionStartDate,
    required this.sessionEndDate,
    this.isCurrentSession,
    this.entryDate,
    this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteCourseBreakupSession.fromMap(Map<String, dynamic> map) {
    return InstituteCourseBreakupSession(
      instituteSessionId: map['institute_session_id'],
      parentInstituteId: map['parent_institute_id'],
      sessionStartYear: map['session_start_year'],
      sessionEndYear: map['session_end_year'],
      sessionStartDate: DateTime.parse(map['session_start_date']),
      sessionEndDate: DateTime.parse(map['session_end_date']),
      isCurrentSession: map['is_current_session'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_session_id': instituteSessionId,
      'parent_institute_id': parentInstituteId,
      'session_start_year': sessionStartYear,
      'session_end_year': sessionEndYear,
      'session_start_date': sessionStartDate.toIso8601String(),
      'session_end_date': sessionEndDate.toIso8601String(),
      'is_current_session': isCurrentSession,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
