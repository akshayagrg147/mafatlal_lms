import 'package:dio/dio.dart';
import 'package:teaching_app/core/api_client/api_client.dart';
import 'package:teaching_app/core/route/api_route.dart';
import 'package:teaching_app/modals/register_device/register_device_response.dart';
import 'package:teaching_app/modals/sync_data/sync_data_response.dart';
import 'package:teaching_app/modals/sync_data/update_sync_data_response.dart';

class LoginRepository {
  static final _apiClient = ApiClient();

  static Future<SyncDataResponse?> getDeviceInfo(
      {required String deviceId}) async {
    FormData? formData = FormData.fromMap({
      "device_id": deviceId,
    });
    final response = await _apiClient.post(
      ApiRoute.getSyncData,
      body: formData,
    );
    if (response != null) {
      return SyncDataResponse.fromJson(response);
    }
    return null;
  }

  static Future<UpdateSyncDataResponse?> updateSyncData(
      {required String syncId}) async {
    FormData? formData = FormData.fromMap({
      "sync_ids": syncId,
    });
    final response = await _apiClient.post(
      ApiRoute.updateSyncData,
      body: formData,
    );
    if (response != null) {
      return UpdateSyncDataResponse.fromJson(response);
    }
    return null;
  }
}
