import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:teaching_app/core/shared_preferences/shared_preferences.dart';
import 'package:teaching_app/database/datebase_controller.dart';
import 'package:teaching_app/pages/add_content_planning/content_planning_screen.dart';
import 'package:teaching_app/pages/dashboard_content/dashboard_screen.dart';
import 'package:teaching_app/pages/login_screen/login_screen.dart';
import 'package:teaching_app/pages/resgistration_screen/registration_or_splash_screen.dart';
import 'package:teaching_app/pages/video_main_screen/video_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  final databaseController = Get.put(DatabaseController());
  await databaseController.initializeDatabase();
  await SharedPrefHelper().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Teaching App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<DatabaseController>(() => DatabaseController());
      }),
      initialRoute: '/registrationPage',
      getPages: [
        GetPage(name: '/', page: () => const DashboardScreen()),
        GetPage(
            name: '/registrationPage',
            page: () => const RegistrationScreen()),
        GetPage(name: '/loginPage', page: () => const LoginScreen()),
        GetPage(
            name: '/contentPlanning',
            page: () => const ContentPlanningScreen()),
        GetPage(name: '/videoScreen', page: () => const VideoMainScreen()),
      ],
    );
  }
}
