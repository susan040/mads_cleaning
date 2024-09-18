import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mads_cleaning/controller/core_controller.dart';

class EditProfileController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() {
    var user = Get.find<CoreController>().currentUser.value;
    if (user != null) {
      nameController.text = user.name ?? "";
      addressController.text = user.address ?? "";
      emailController.text = user.email ?? "";
      phoneController.text = user.phone ?? "";
      // if (user.imageUrl != null) {
      //   image.value = File(user.imageUrl!);
      // }
    }
  }

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final picker = ImagePicker();

  Rxn<File> image = Rxn<File>();
  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }
}
