import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/controller/dashboard/profile_screen_controller.dart';
import 'package:mads_cleaning/model/users.dart';
import 'package:mads_cleaning/repo/edit_profile_repo.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/utils/storage_keys.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class EditProfileController extends GetxController {
  final coreController = Get.find<CoreController>();
  final profileController = Get.put(ProfileScreenController());
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
      avatarUrl.value = user.avatar ?? "";
    }
  }

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final picker = ImagePicker();

  Rxn<Users> user = Rxn<Users>();
  Rxn<File> image = Rxn<File>();
  Rxn<String> avatarUrl = Rxn<String>();

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

  String? getImageString() {
    if (image.value == null) return null;

    final bytes = File(image.value!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
    return base64Image;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  void submit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      log("Submitting profile update: Name: ${nameController.text}, Phone: ${phoneController.text}, Address: ${addressController.text}");

      await EditProfileRepo.editProfile(
        image: image.value,
        name: nameController.text,
        address: addressController.text,
        phoneNumber: phoneController.text,
        onSuccess: (user) async {
          loading.hide();
          final box = GetStorage();
          if (user.token == null) {
            user.token = coreController.currentUser.value?.token;
          }
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          coreController.currentUser.value = user;
          profileController.getUserDetails();
          Get.find<CoreController>().loadCurrentUser();
          Get.back();
          CustomSnackBar.success(
              title: "Update Profile", message: "Profile update Successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Profile", message: message);
        },
      );
    }
  }
}
