import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/core/shared_preferences/shared_preferences.dart';
import 'package:teaching_app/loading_screen.dart';
import 'package:teaching_app/widgets/edit_text.dart';
import 'package:teaching_app/widgets/text_view.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (_) {
        return Obx(
          () => _.isSyncDataLoading.value
              ? const LoadingScreen()
              : Scaffold(
                  appBar: AppBar(
                    title: const Text('Login'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EditText(
                              onValidate: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Id";
                                } else if (value !=
                                    "akhileshredomud@gmail.com") {
                                  return "Wrong Id";
                                }
                                return null;
                              },
                              controller: _.idController,
                              labelText: "ID",
                            ),
                            const SizedBox(height: 16.0),
                            Obx(
                              () => EditText(
                                controller: _.passwordController,
                                obscureText: _.obscureText.value,
                                onValidate: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (value != "Akki@123") {
                                    return "Wrong Password";
                                  }
                                  return null;
                                },
                                labelText: 'Password',

                                suffix: IconButton(
                                  icon: Icon(
                                    _.obscureText.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _.togglePasswordVisibility,
                                ),
                                // suffixIcon:
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Select Role:',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: 'Department',
                                            groupValue: _.selectedRole.value,
                                            onChanged: (String? value) {
                                              _.selectedRole.value = value!;
                                            },
                                          ),
                                          TextView("Department"),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: 'Principal',
                                            groupValue: _.selectedRole.value,
                                            onChanged: (String? value) {
                                              _.selectedRole.value = value!;
                                            },
                                          ),
                                          TextView("Principal"),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: 'Teacher',
                                            groupValue: _.selectedRole.value,
                                            onChanged: (String? value) {
                                              _.selectedRole.value = value!;
                                            },
                                          ),
                                          TextView("Teacher"),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            const Text(
                              'Caption: Please select your role and enter your credentials',
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                            const SizedBox(height: 24.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (_.formKey.currentState!.validate()) {
                                  //   print("A");
                                  //   print(_.selectedRole.value);
                                  //   if (_.selectedRole.value == "Principal") {
                                  //     print("B");
                                  //     //setting as login successful
                                  //     await SharedPrefHelper()
                                  //         .setIsLoginSuccessful(true);
                                  //     Get.offNamed('/');
                                  //   }
                                  // }
                                  //setting as login successful
                                  await SharedPrefHelper()
                                      .setIsLoginSuccessful(true);
                                  Get.offNamed('/');
                                },
                                child: const Text('Sign In'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
