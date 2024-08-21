import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
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
