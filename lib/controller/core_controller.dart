import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mads_cleaning/model/users.dart';
import 'package:mads_cleaning/utils/storage_keys.dart';
import 'package:mads_cleaning/views/auth/login_screen.dart';

class CoreController extends GetxController {
  Rx<Users?> currentUser = Rxn<Users>();
  Rx<String> userToken = "".obs;

  @override
  void onInit() async {
    //log("dsfsdfsdfdsfdsfsdf");
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
    log("User token--${currentUser.value?.token}--");
    //log("email-${currentUser.value?.email}--");
  }

  bool isUserLoggendIn() {
    log("dsfsdfsdfdsfdsfsdfsadas jksdhk");

    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    await box.write(StorageKeys.ACCESS_TOKEN, null);
    Get.offAll(() => LoginScreen());
  }
}
