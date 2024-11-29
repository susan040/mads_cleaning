import 'dart:async';

import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/views/auth/login_screen.dart';
import 'package:mads_cleaning/views/dash_screen.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());

  @override
  // void onInit() {
  //   Timer(const Duration(seconds: 5), () async {
  //     //Get.offAll(() => LoginScreen());
  //   });
  //   super.onInit();
  // }

  void onInit() {
    Timer(const Duration(seconds: 2), () async {
      if (c.isUserLoggendIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
    super.onInit();
  }
}
