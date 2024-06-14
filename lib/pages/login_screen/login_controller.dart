import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:teaching_app/core/shared_preferences/shared_preferences.dart';
import 'package:teaching_app/database/datebase_controller.dart';
import 'package:teaching_app/modals/sync_data/sync_data_response.dart';
import 'package:teaching_app/pages/login_screen/login_repository.dart';
import '../../modals/register_device/register_device_response.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool obscureText = true.obs;
  RxString selectedRole = RxString('Teacher');
  Rx<RegisterDeviceResponse> registerDeviceResponse =
      RegisterDeviceResponse().obs;
  Rx<SyncDataResponse> syncDataResponse = SyncDataResponse().obs;
  RxBool isLoading = false.obs;
  final DatabaseController myDataController = Get.find();
  RxBool isSyncDataLoading = false.obs;
  final isLoginSuccessful = SharedPrefHelper().getIsLoginSuccessful();
  RxString deviceIds = ''.obs;

  @override
  void onInit() async {
    await syncData();
    super.onInit();
  }

  void togglePasswordVisibility() {
    obscureText.toggle();
  }

  void checkLoginCredentials() {
    if (idController.text == 'akhileshredomud@gmail.com' &&
        passwordController.text == '1234') {
      // Successful login logic here
      print('Login successful');
    } else {
      // Error handling here
      print('Invalid credentials or captcha');
    }
  }

  Future<void> syncData() async {
    try {
      isSyncDataLoading.value = true;
      final response = await LoginRepository.getDeviceInfo(
          deviceId: SharedPrefHelper().getDeviceId());
      if (response != null &&
          response.success == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        print("RegisterDevice :- $response");
        syncDataResponse.value = response;
        //Now sync the data
        await executeAndNotify(syncDataResponse.value.data ?? []);

        final isLoginSuccessful = SharedPrefHelper().getIsLoginSuccessful();

        if (isLoginSuccessful) {
          //move to the dashboard screen
          return Get.offAllNamed("/");
        }
      } else {
        Get.snackbar("SyncDataError", "${response?.msg}");
      }
      // final response = {
      //   "success": true,
      //   "msg": "Success",
      //   "data": [
      //     {
      //       "OFFLINE_DEVICE_SYNC_REL_ID": "10491562",
      //       "OFFLINE_SYNC_QUERY_ID": "9046702",
      //       "QUERY_STATEMENT":
      //           "INSERT INTO tbl_institute(online_institute_id,parent_institute_id,institute_name,institute_code,institute_address,institute_country,institute_state,district,institute_logo,status,license_start_date,license_end_date)VALUES ('9083','17','DASPUR PROJECT U P S','21170500201','BLOCK BHUBANESWAR','India','Odisha','Khordha','','Active','','');"
      //     },
      //     {
      //       "OFFLINE_DEVICE_SYNC_REL_ID": "10491563",
      //       "OFFLINE_SYNC_QUERY_ID": "9046703",
      //       "QUERY_STATEMENT":
      //           "INSERT INTO tbl_institute_course(online_institute_course_id,parent_institute_id,institute_course_name,priority,course_status)VALUES('4','17','I','1','Active'),('5','17','II','2','Active'),('6','17','III','3','Active'),('7','17','IV','4','Active'),('8','17','V','5','Active');"
      //     },
      //     {
      //       "OFFLINE_DEVICE_SYNC_REL_ID": "10491564",
      //       "OFFLINE_SYNC_QUERY_ID": "9046704",
      //       "QUERY_STATEMENT":
      //           "INSERT INTO tbl_institute_course(online_institute_course_id,parent_institute_id,institute_course_name,priority,course_status)VALUES('9','17','VI','6','Active'),('10','17','VII','7','Active'),('11','17','VIII','8','Active'),('12','17','IX','9','Active'),('13','17','X','10','Active');"
      //     },
      //     {
      //       "OFFLINE_DEVICE_SYNC_REL_ID": "10491565",
      //       "OFFLINE_SYNC_QUERY_ID": "9046705",
      //       "QUERY_STATEMENT":
      //           "INSERT INTO tbl_institute_course(online_institute_course_id,parent_institute_id,institute_course_name,priority,course_status)VALUES('14','17','XI (Science)','11','Active'),('15','17','XI (Commerce)','11','Active'),('16','17','XI (Arts)','11','Active'),('17','17','XII (Science)','12','Active'),('18','17','XII (Commerce)','12','Active');"
      //     },
      //     {
      //       "OFFLINE_DEVICE_SYNC_REL_ID": "10491566",
      //       "OFFLINE_SYNC_QUERY_ID": "9046706",
      //       "QUERY_STATEMENT":
      //           "INSERT INTO tbl_institute_course(online_institute_course_id,parent_institute_id,institute_course_name,priority,course_status)VALUES('19','17','XII (Arts)','12','Active'),('2266','17','NIIT','19','Active');"
      //     },
      //     {
      //       "OFFLINE_DEVICE_SYNC_REL_ID": "10491567",
      //       "OFFLINE_SYNC_QUERY_ID": "9046707",
      //       "QUERY_STATEMENT":
      //           "INSERT INTO tbl_institute_course_breakup_session(online_institute_session_id,parent_institute_id,session_start_year,session_end_year,session_start_date,session_end_date,is_current_session)VALUES('7585','17','2023','2024','2023-04-01','2024-03-31','No'),('7587','17','2024','2025','2024-04-01','2025-03-31','Yes'),('7592','17','2022','2023','2022-04-01','2023-03-31','No'),('7595','17','2025','2026','0000-00-00','0000-00-00','');"
      //     }
      //   ]
      // };
      // syncDataResponse.value = SyncDataResponse.fromJson(response);
      //now updating the data on loccal db and run the update query api
      print("SyncData :- $response");
    } catch (e) {
      print("SyncDataError :- $e");
      Get.snackbar("SyncDataError", "$e");
    } finally {
      //Stop the loading or loader
      isSyncDataLoading.value = false;
    }
  }

  Future<void> executeAndNotify(List<Datum> items) async {
    String temp = '';
    for (var item in items) {
      try {
        await myDataController.performTransaction(
            query: item.queryStatement ?? '');
        //add the data in string to send to backend
        temp = '$temp${item.offlineDeviceSyncRelId ?? ''},';
      } catch (e) {
        print('Error executing query: $e');
      }
    }
    // Notify backend
    if (temp.isNotEmpty) {
      await notifyBackend(temp.substring(0, temp.length - 1));
    } else {
      Get.snackbar("UpdateResponseError", "Invalid db query");
    }
  }

  Future<void> notifyBackend(String queryId) async {
    try {
      final response = await LoginRepository.updateSyncData(syncId: queryId);
      print('UpdateResponse: $response');
      if (response == null || response.success == false) {
        Get.snackbar("UpdateResponseError", "Something went wrong");
      }
    } catch (e) {
      Get.snackbar("UpdateResponseError", '$e');
      print('UpdateResponseError: $e');
    }
  }
}
