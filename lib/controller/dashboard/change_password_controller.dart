import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();


  final oldPassCon = TextEditingController();
  final newPassCon = TextEditingController();
  final confirmPassCon = TextEditingController();

  FocusNode oldPassNode = FocusNode();
  FocusNode newPassNode = FocusNode();
  FocusNode confirmPassNode = FocusNode();

  RxBool oldPassEye = RxBool(true);
  RxBool newPassEye = RxBool(true);
  RxBool confirmPassEye = RxBool(true);

  void onOldEyeClick() {
    oldPassEye.value = !oldPassEye.value;
  }

  void onNewEyeClick() {
    newPassEye.value = !newPassEye.value;
  }

  void onConfirmEyeClick() {
    confirmPassEye.value = !confirmPassEye.value;
  }
}