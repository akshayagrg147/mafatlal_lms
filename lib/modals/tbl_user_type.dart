class UserType {
  final double userTypeId;
  final String userTypeName;
  final double? parentInstituteId;
  final String isTeaching;
  final double rank;
  final String isOtFlag;
  final double? minOtTiming;
  final double? maxOtTiming;
  final String designationFor;
  final DateTime entryDate;
  final DateTime lastUpdateDate;
  final double? oldErpId;

  UserType({
    required this.userTypeId,
    required this.userTypeName,
    this.parentInstituteId,
    required this.isTeaching,
    required this.rank,
    required this.isOtFlag,
    this.minOtTiming,
    this.maxOtTiming,
    required this.designationFor,
    required this.entryDate,
    required this.lastUpdateDate,
    this.oldErpId,
  });

  // Factory method to create an instance from a Map
  factory UserType.fromMap(Map<String, dynamic> map) {
    return UserType(
      userTypeId: map['user_type_id'],
      userTypeName: map['user_type_name'],
      parentInstituteId: map['parent_institute_id'],
      isTeaching: map['is_teaching'],
      rank: map['rank'],
      isOtFlag: map['is_ot_flag'],
      minOtTiming: map['min_ot_timing'],
      maxOtTiming: map['max_ot_timing'],
      designationFor: map['designation_for'],
      entryDate: DateTime.parse(map['entry_date']),
      lastUpdateDate: DateTime.parse(map['last_update_date']),
      oldErpId: map['old_erp_id'],
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'user_type_id': userTypeId,
      'user_type_name': userTypeName,
      'parent_institute_id': parentInstituteId,
      'is_teaching': isTeaching,
      'rank': rank,
      'is_ot_flag': isOtFlag,
      'min_ot_timing': minOtTiming,
      'max_ot_timing': maxOtTiming,
      'designation_for': designationFor,
      'entry_date': entryDate.toIso8601String(),
      'last_update_date': lastUpdateDate.toIso8601String(),
      'old_erp_id': oldErpId,
    };
  }
}
