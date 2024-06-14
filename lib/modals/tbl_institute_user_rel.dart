class InstituteUserRel {
  final double instituteUserRelId;
  final double parentInstituteId;
  final String? type;
  final double? instituteId;
  final String? stateName;
  final String? districtName;
  final double? instituteUserId;
  final DateTime entryDate;
  final DateTime lastUpdateDate;

  InstituteUserRel({
    required this.instituteUserRelId,
    required this.parentInstituteId,
    this.type,
    this.instituteId,
    this.stateName,
    this.districtName,
    this.instituteUserId,
    required this.entryDate,
    required this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteUserRel.fromMap(Map<String, dynamic> map) {
    return InstituteUserRel(
      instituteUserRelId: map['institute_user_rel_id'],
      parentInstituteId: map['parent_institute_id'],
      type: map['type'],
      instituteId: map['institute_id'],
      stateName: map['state_name'],
      districtName: map['district_name'],
      instituteUserId: map['institute_user_id'],
      entryDate: DateTime.parse(map['entry_date']),
      lastUpdateDate: DateTime.parse(map['last_update_date']),
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_user_rel_id': instituteUserRelId,
      'parent_institute_id': parentInstituteId,
      'type': type,
      'institute_id': instituteId,
      'state_name': stateName,
      'district_name': districtName,
      'institute_user_id': instituteUserId,
      'entry_date': entryDate.toIso8601String(),
      'last_update_date': lastUpdateDate.toIso8601String(),
    };
  }
}
