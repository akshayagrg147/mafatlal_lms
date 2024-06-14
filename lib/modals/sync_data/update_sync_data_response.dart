class UpdateSyncDataResponse {
  final bool success;

  UpdateSyncDataResponse({required this.success});

  factory UpdateSyncDataResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSyncDataResponse(
      success: json['success'],
    );
  }
}
