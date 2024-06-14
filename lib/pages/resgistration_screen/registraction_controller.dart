import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/core/shared_preferences/shared_preferences.dart';
import 'package:teaching_app/database/datebase_controller.dart';
import 'package:teaching_app/modals/sync_data/sync_data_response.dart';
import 'package:teaching_app/pages/resgistration_screen/registration_repository.dart';
import '../../modals/register_device/register_device_response.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController trackingIdController = TextEditingController();
  final TextEditingController serialNoController = TextEditingController();
  Rx<RegisterDeviceResponse> registerDeviceResponse =
      RegisterDeviceResponse().obs;
  RxBool isLoading = false.obs;

  void registerDevice() async {
    //Initial loading start
    isLoading.value = true;
    try {
      final response = await RegistrationRepository.registerDevice(
        trackingId: /*trackingIdController.text*/ 'OCA-Dem-Pan--47820',
        serialNumber: /*serialNoController.text*/ '478268375682424',
        projectId: 54,
      );
      if (response != null && response.success == true) {
        print("RegisterDevice :- $response");
        registerDeviceResponse.value = response;
        //Now sync the data
        if (response.data != null && response.data! > 0) {
          //Save Data in shared Preference and marked as registered
          await SharedPrefHelper().setDeviceId(response.data.toString());
          await SharedPrefHelper().setIsRegistrationCompleted(true);
          Get.offAllNamed("/loginPage");
        } else {
          Get.snackbar("RegisterDeviceError", "Device ID is zero");
        }
      } else {
        Get.snackbar(
            "RegisterDeviceError", " Device registration ${response?.msg}");
      }
      print("RegisterDevice :- $response");
    } catch (e) {
      print("RegisterDeviceError :- $e");
      Get.snackbar("RegisterDeviceError", "$e");
    } finally {
      //Stop the loading or loader
      isLoading.value = false;
    }
  }
}
