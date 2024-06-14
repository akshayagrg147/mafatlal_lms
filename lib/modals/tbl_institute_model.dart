class TblInstitute {
  final int instituteId;
  final int parentInstituteId;
  final int lmsForId;
  final String instituteName;
  final String? instituteCode;
  final String instituteType;
  final String instituteAddress;
  final String instituteCountry;
  final String instituteState;
  final String? district;
  final String? instituteWebsite;
  final String? instituteEmailId;
  final String? institutePhNum;
  final String? instituteLogo;
  final String? instituteInsideLogo;
  final String? instituteInsideSmallLogo;
  final String? instituteBackground;
  final String status;
  final String licenseKey;
  final DateTime? licenseStartDate;
  final DateTime? licenseEndDate;
  final String? pushServerKey;
  final String? smsUserName;
  final String? smsPassword;
  final String smsGateway;
  final String? smsSenderId;
  final String sendSmsFlag;
  final String? smsEntityId;
  final String? smsAdminPanelUrl;
  final String? indexPageName;
  final String isAndroidApp;
  final String? androidAppUrl;
  final String appToken;
  final String appDashboardType;
  final int? isDefaultId;
  final String timeZone;
  final String? instituteLatitude;
  final String? instituteLongitude;
  final String? emailFrom;
  final String? emailHost;
  final String? emailUsername;
  final String? emailPassword;
  final String? emailFromName;
  final String? emailPort;
  final String? apiAuthToken;
  final int? trackingInstituteId;
  final String trainingStatus;
  final String? trainingCertificate;
  final int? submittedBy;
  final DateTime? submittedDateTime;
  final DateTime lastUpdateDate;
  final DateTime entryDate;

  TblInstitute({
    required this.instituteId,
    required this.parentInstituteId,
    required this.lmsForId,
    required this.instituteName,
    this.instituteCode,
    required this.instituteType,
    required this.instituteAddress,
    required this.instituteCountry,
    required this.instituteState,
    this.district,
    this.instituteWebsite,
    this.instituteEmailId,
    this.institutePhNum,
    this.instituteLogo,
    this.instituteInsideLogo,
    this.instituteInsideSmallLogo,
    this.instituteBackground,
    required this.status,
    required this.licenseKey,
    this.licenseStartDate,
    this.licenseEndDate,
    this.pushServerKey,
    this.smsUserName,
    this.smsPassword,
    required this.smsGateway,
    this.smsSenderId,
    required this.sendSmsFlag,
    this.smsEntityId,
    this.smsAdminPanelUrl,
    this.indexPageName,
    required this.isAndroidApp,
    this.androidAppUrl,
    required this.appToken,
    required this.appDashboardType,
    this.isDefaultId,
    required this.timeZone,
    this.instituteLatitude,
    this.instituteLongitude,
    this.emailFrom,
    this.emailHost,
    this.emailUsername,
    this.emailPassword,
    this.emailFromName,
    this.emailPort,
    this.apiAuthToken,
    this.trackingInstituteId,
    required this.trainingStatus,
    this.trainingCertificate,
    this.submittedBy,
    this.submittedDateTime,
    required this.lastUpdateDate,
    required this.entryDate,
  });
}
