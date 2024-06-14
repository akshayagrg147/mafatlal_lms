class RegisterDeviceResponse {
  final bool? success;
  final int? data;
  final DateTime? expiryDate;
  final String? msg;

  RegisterDeviceResponse({
    this.success,
    this.data,
    this.expiryDate,
    this.msg,
  });

  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) =>
      RegisterDeviceResponse(
        success: json["success"],
        data: json["data"],
        expiryDate: json["expiry_date"] == null || json["expiry_date"] == ""
            ? null
            : DateTime.parse(json["expiry_date"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "expiry_date":
            "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
        "msg": msg,
      };
}
