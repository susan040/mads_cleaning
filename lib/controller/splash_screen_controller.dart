import 'dart:async';

import 'package:get/get.dart';
import 'package:mads_cleaning/views/auth/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () async {
      Get.offAll(() => LoginScreen());
    });
    super.onInit();
  }
}
