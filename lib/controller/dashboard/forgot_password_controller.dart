import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool newPasswordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;


  void onEyeCLickNewPassword() {
    newPasswordObscure.value = !newPasswordObscure.value;
  }
  void onEyeCLickConfirmPassword() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }
}