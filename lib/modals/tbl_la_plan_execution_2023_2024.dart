class LaPlanExecution {
  final int? laPlanExecutionId;
  final int? onlineLaPlanExecutionId;
  final int? parentInstituteId;
  final int? instituteId;
  final int? instituteCourseId;
  final int? instituteCourseBreakupId;
  final int? instituteSubjectId;
  final int? instituteChapterId;
  final String? periodNum;
  final String? session;
  // final DateTime? executionDate;
  final String? instituteTopicIds;
  final String? laHwCnAssessmentIds;
  final String? executionByTeacherUserId;
  // final DateTime? entryDate;
  // final DateTime? lastUpdateDate;

  LaPlanExecution({
    required this.laPlanExecutionId,
    required this.onlineLaPlanExecutionId,
    required this.parentInstituteId,
    required this.instituteId,
    required this.instituteCourseId,
    required this.instituteCourseBreakupId,
    required this.instituteSubjectId,
    required this.instituteChapterId,
    required this.periodNum,
    this.session,
    // this.executionDate,
    this.instituteTopicIds,
    this.laHwCnAssessmentIds,
    this.executionByTeacherUserId,
    // this.entryDate,
    // this.lastUpdateDate,
  });

  // Factory method to create an instance from a Map
  factory LaPlanExecution.fromMap(Map<String, dynamic> map) {
    return LaPlanExecution(
      laPlanExecutionId: map['la_plan_execution_id'],
      onlineLaPlanExecutionId: map['online_la_plan_execution_id'],
      parentInstituteId: map['parent_institute_id'],
      instituteId: map['institute_id'],
      instituteCourseId: map['institute_course_id'],
      instituteCourseBreakupId: map['institute_course_breakup_id'],
      instituteSubjectId: map['institute_subject_id'],
      instituteChapterId: map['institute_chapter_id'],
      periodNum: map['period_num'],
      session: map['session'],
      // executionDate: map['execution_date'] != null
      //     ? DateTime.parse(map['execution_date'])
      //     : null,
      instituteTopicIds: map['institute_topic_ids'],
      laHwCnAssessmentIds: map['la_hw_cn_assessment_ids'],
      executionByTeacherUserId: map['execution_by_teacher_user_id'],
      // entryDate: map['entry_date'] != null ? DateTime.parse(map['entry_date']) : null,
      // lastUpdateDate: map['last_update_date'] != null ? DateTime.parse(map['last_update_date']) : null,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'la_plan_execution_id': laPlanExecutionId,
      'online_la_plan_execution_id': onlineLaPlanExecutionId,
      'parent_institute_id': parentInstituteId,
      'institute_id': instituteId,
      'institute_course_id': instituteCourseId,
      'institute_course_breakup_id': instituteCourseBreakupId,
      'institute_subject_id': instituteSubjectId,
      'institute_chapter_id': instituteChapterId,
      'period_num': periodNum,
      'session': session,
      // 'execution_date': executionDate?.toIso8601String(),
      'institute_topic_ids': instituteTopicIds,
      'la_hw_cn_assessment_ids': laHwCnAssessmentIds,
      'execution_by_teacher_user_id': executionByTeacherUserId,
      // 'entry_date': entryDate?.toIso8601String(),
      // 'last_update_date': lastUpdateDate?.toIso8601String(),
    };
  }
}
