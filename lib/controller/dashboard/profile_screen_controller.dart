import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/model/users.dart';

class ProfileScreenController extends GetxController {
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
      avatarUrl.value = user.avatar ?? ""; // Assign the avatar URL here
    }
  }

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final picker = ImagePicker();

  Rxn<Users> user = Rxn<Users>();
  Rxn<File> image = Rxn<File>(); // This is for local image (from gallery)
  Rxn<String> avatarUrl = Rxn<String>(); // This is for the image URL

  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedImage != null) {
      image.value = File(pickedImage.path); // Assign local image
    }
  }
}
