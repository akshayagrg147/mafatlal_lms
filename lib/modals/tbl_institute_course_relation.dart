class InstituteCourseRelation {
  final double instituteCourseRelationId;
  final double parentInstituteId;
  final double instituteId;
  final double instituteCourseId;
  final DateTime entryDate;
  final DateTime lastUpdateDate;

  InstituteCourseRelation({
    required this.instituteCourseRelationId,
    required this.parentInstituteId,
    required this.instituteId,
    required this.instituteCourseId,
    required this.entryDate,
    required this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteCourseRelation.fromMap(Map<String, dynamic> map) {
    return InstituteCourseRelation(
      instituteCourseRelationId: map['institute_course_relation_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteId: map['institute_id'],
      instituteCourseId: map['institute_course_id'],
      entryDate: DateTime.parse(map['entry_date']),
      lastUpdateDate: DateTime.parse(map['last_update_date']),
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_course_relation_id': instituteCourseRelationId,
      'parent_institute_id': parentInstituteId,
      'institute_id': instituteId,
      'institute_course_id': instituteCourseId,
      'entry_date': entryDate.toIso8601String(),
      'last_update_date': lastUpdateDate.toIso8601String(),
    };
  }
}
