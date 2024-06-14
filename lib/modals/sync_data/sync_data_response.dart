class SyncDataResponse {
  final bool? success;
  final String? msg;
  final List<Datum>? data;

  SyncDataResponse({
    this.success,
    this.msg,
    this.data,
  });

  factory SyncDataResponse.fromJson(Map<String, dynamic> json) =>
      SyncDataResponse(
        success: json["success"],
        msg: json["msg"],
        data: json.containsKey('data') &&
                json['data'] is List &&
                json["data"] != null
            ? (json['data'] as List)
                .map((item) => Datum.fromJson(item))
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? offlineDeviceSyncRelId;
  final String? offlineSyncQueryId;
  final String? queryStatement;

  Datum({
    this.offlineDeviceSyncRelId,
    this.offlineSyncQueryId,
    this.queryStatement,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        offlineDeviceSyncRelId: json["OFFLINE_DEVICE_SYNC_REL_ID"],
        offlineSyncQueryId: json["OFFLINE_SYNC_QUERY_ID"],
        queryStatement: json["QUERY_STATEMENT"],
      );

  Map<String, dynamic> toJson() => {
        "OFFLINE_DEVICE_SYNC_REL_ID": offlineDeviceSyncRelId,
        "OFFLINE_SYNC_QUERY_ID": offlineSyncQueryId,
        "QUERY_STATEMENT": queryStatement,
      };
}
