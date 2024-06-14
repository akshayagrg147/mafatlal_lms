import 'package:dio/dio.dart';
import 'package:teaching_app/core/api_client/api_client.dart';
import 'package:teaching_app/core/route/api_route.dart';
import 'package:teaching_app/modals/register_device/register_device_response.dart';
import 'package:teaching_app/modals/sync_data/sync_data_response.dart';
import 'package:teaching_app/modals/sync_data/update_sync_data_response.dart';

class RegistrationRepository {
  static final _apiClient = ApiClient();

  static Future<RegisterDeviceResponse?> registerDevice(
      {required String trackingId,
      required String serialNumber,
      required int projectId}) async {
    FormData? formData = FormData.fromMap({
      "tracking_id": trackingId,
      "serial_number": serialNumber,
      "project_id": projectId
    });
    final response = await _apiClient.post(
      ApiRoute.getDeviceDetail,
      body: formData,
    );
    if (response != null) {
      return RegisterDeviceResponse.fromJson(response);
    }
    return null;
  }
}
