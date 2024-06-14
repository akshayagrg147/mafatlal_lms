class InstituteTopicData {
  final int instituteTopicDataId;
  final int instituteId;
  final int parentInstituteId;
  final int instituteTopicId;
  final String? topicDataKind;
  final String? topicDataType;
  final String? displayType;
  final String? contentLevel;
  final String? addedType;
  final String? topicDataFileCodeName;
  final String? code;
  final String? fileNameExt;
  final String? html5FileName;
  final String? referenceUrl;
  final String? noOfClicks;

  final String? contentTag;
  final String? contentLang;
  // final String? entryByInstituteUserId;
  final String? isVerified;
  final String? verifiedBy;
  final String? isDeptVerified;
  final String? deptVerifiedByUserId;
  final DateTime? lastUpdateDate;
  final DateTime? entryDate;

  InstituteTopicData({
    required this.instituteTopicDataId,
    required this.instituteId,
    required this.parentInstituteId,
    required this.instituteTopicId,
    required this.topicDataKind,
    required this.topicDataType,
    required this.displayType,
    required this.contentLevel,
    required this.addedType,
    required this.topicDataFileCodeName,
    this.code,
    this.fileNameExt,
    this.html5FileName,
    this.referenceUrl,
    required this.noOfClicks,
    this.contentTag,
    this.contentLang,
    // this.entryByInstituteUserId,
    required this.isVerified,
    this.verifiedBy,
    required this.isDeptVerified,
    this.deptVerifiedByUserId,
    required this.lastUpdateDate,
    required this.entryDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteTopicData.fromMap(Map<String, dynamic> map) {
    return InstituteTopicData(
      instituteTopicDataId: map['institute_topic_data_id'],
      instituteId: map['institute_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteTopicId: map['institute_topic_id'],
      topicDataKind: map['topic_data_kind'],
      topicDataType: map['topic_data_type'],
      displayType: map['display_type'],
      contentLevel: map['content_level'],
      addedType: map['added_type'],
      topicDataFileCodeName: map['topic_data_file_code_name'],
      code: map['code'],
      fileNameExt: map['file_name_ext'],
      html5FileName: map['html5_file_name'],
      referenceUrl: map['reference_url'],
      noOfClicks: map['no_of_clicks'],
      contentTag: map['content_tag'],
      contentLang: map['content_lang'],
      // entryByInstituteUserId: map['entry_by_institute_user_id'],
      isVerified: map['is_verified'],
      verifiedBy: map['verified_by'],
      isDeptVerified: map['is_dept_verified'],
      deptVerifiedByUserId: map['dept_verified_by_user_id'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,

    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_topic_data_id': instituteTopicDataId,
      'institute_id': instituteId,
      'parent_institute_id': parentInstituteId,
      'institute_topic_id': instituteTopicId,
      'topic_data_kind': topicDataKind,
      'topic_data_type': topicDataType,
      'display_type': displayType,
      'content_level': contentLevel,
      'added_type': addedType,
      'topic_data_file_code_name': topicDataFileCodeName,
      'code': code,
      'file_name_ext': fileNameExt,
      'html5_file_name': html5FileName,
      'reference_url': referenceUrl,
      'no_of_clicks': noOfClicks,
      'content_tag': contentTag,
      'content_lang': contentLang,
      // 'entry_by_institute_user_id': entryByInstituteUserId,
      'is_verified': isVerified,
      'verified_by': verifiedBy,
      'is_dept_verified': isDeptVerified,
      'dept_verified_by_user_id': deptVerifiedByUserId,
      'last_update_date': lastUpdateDate?.toIso8601String(),
      'entry_date': entryDate?.toIso8601String(),
    };
  }
}
