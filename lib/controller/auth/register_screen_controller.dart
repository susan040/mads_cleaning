import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/repo/register_repo.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/utils/storage_keys.dart';
import 'package:mads_cleaning/views/dash_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class RegisterScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool passwordObscure = false.obs;
  RxBool confirmObscure = false.obs;

  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();

  RxBool isChecked = false.obs;
  void passwordOnEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void confirmPasswordOnEyeCLick() {
    confirmObscure.value = !confirmObscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await RegisterRepo.register(
          name: fullNameController.text,
          address: addressController.text,
          phone: phoneNoController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          onSuccess: (user) async {
            loading.hide();
            final box = GetStorage();
            await box.write(StorageKeys.USER, json.encode(user.toJson()));
            log("Register Success ${user.name}");

            Get.find<CoreController>().loadCurrentUser();
            Get.offAll(() => DashScreen());
            CustomSnackBar.success(
                title: "Register", message: "Register Successful!");
          },
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Register", message: message);
          });
    }
  }
}
