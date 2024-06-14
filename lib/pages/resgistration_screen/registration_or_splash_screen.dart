import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:teaching_app/core/shared_preferences/shared_preferences.dart';
import 'package:teaching_app/pages/login_screen/login_screen.dart';
import 'package:teaching_app/pages/resgistration_screen/registraction_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return navigateToInitialScreen();
  }

  Widget navigateToInitialScreen() {
    final isRegistrationCompleted =
        SharedPrefHelper().getIsRegistrationCompleted();

    if (!isRegistrationCompleted) {
      return registration();
    } else  {
      return  LoginScreen();
    }
  }

  Widget registration() {
    return GetBuilder(
        init: RegistrationController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Registration'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _.trackingIdController,
                      decoration: const InputDecoration(
                        labelText: 'Tracking ID',
                      ),
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter Tracking ID";
                        }
                        return null;
                      },
                      // onSaved: (value) => _trackingId = value!,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _.serialNoController,
                      decoration: const InputDecoration(
                        labelText: 'Serial Number',
                      ),
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter Serial Number";
                        }
                        return null;
                      },
                      // onSaved: (value) => _serialNumber = value!,
                    ),
                    const SizedBox(height: 20.0),
                    Obx(
                      () => _.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_.formKey.currentState!.validate()) {
                                  // Perform registration logic here (e.g., send data to server)
                                  _.registerDevice();
                                }
                              },
                              child: const Text('Register'),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
