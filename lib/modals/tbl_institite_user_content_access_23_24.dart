class InstituteUserContentAccess {
  final int instituteUserContentAccessId;
  final int parentInstituteId;
  final int instituteId;
  final int instituteUserId;
  final String? userType;
  final int instituteCourseId;
  final int instituteSubjectId;
  final int instituteChapterId;
  final int instituteTopicId;
  final int instituteTopicDataId;
  final String? lastAccessStartTime;
  final String? lastAccessEndTime;
  final int? totalAccessTime;
  final String? noOfViews;
  final DateTime? entryDate;
  final DateTime? lastUpdateDate;

  InstituteUserContentAccess({
    required this.instituteUserContentAccessId,
    required this.parentInstituteId,
    required this.instituteId,
    required this.instituteUserId,
    required this.userType,
    required this.instituteCourseId,
    required this.instituteSubjectId,
    required this.instituteChapterId,
    required this.instituteTopicId,
    required this.instituteTopicDataId,
    required this.lastAccessStartTime,
    this.lastAccessEndTime,
    required this.totalAccessTime,
    required this.noOfViews,
    required this.entryDate,
    required this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory InstituteUserContentAccess.fromMap(Map<String, dynamic> map) {
    return InstituteUserContentAccess(
      instituteUserContentAccessId: map['institute_user_content_access_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteId: map['institute_id'],
      instituteUserId: map['institute_user_id'],
      userType: map['user_type'],
      instituteCourseId: map['institute_course_id'],
      instituteSubjectId: map['institute_subject_id'],
      instituteChapterId: map['institute_chapter_id'],
      instituteTopicId: map['institute_topic_id'],
      instituteTopicDataId: map['institute_topic_data_id'],
      lastAccessStartTime: map['last_access_start_time'],
      lastAccessEndTime: map['last_access_end_time'],
      totalAccessTime: map['total_access_time'],
      noOfViews: map['no_of_views'],
      entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'institute_user_content_access_id': instituteUserContentAccessId,
      'parent_institute_id': parentInstituteId,
      'institute_id': instituteId,
      'institute_user_id': instituteUserId,
      'user_type': userType,
      'institute_course_id': instituteCourseId,
      'institute_subject_id': instituteSubjectId,
      'institute_chapter_id': instituteChapterId,
      'institute_topic_id': instituteTopicId,
      'institute_topic_data_id': instituteTopicDataId,
      'last_access_start_time': lastAccessStartTime,
      'last_access_end_time':
      lastAccessEndTime,
      'total_access_time': totalAccessTime,
      'no_of_views': noOfViews,
      'entry_date': entryDate?.toIso8601String(),
      'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
