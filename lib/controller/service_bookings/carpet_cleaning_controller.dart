import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/repo/carpet_cleaning_repo.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/views/service_booking/service_congratulation.dart';

class CarpetCleaningController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    populateUserDetails();
  }

  void populateUserDetails() {
    var user = Get.find<CoreController>().currentUser.value;
    if (user != null) {
      fullNameController.text = user.name ?? "";
      addressController.text = user.address ?? "";
      emailController.text = user.email ?? "";
      phoneNoController.text = user.phone ?? "";
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final messageController = TextEditingController();
  final selectDateController = TextEditingController();
  final selectTimeController = TextEditingController();
  final carpetSteamCleaningArea = TextEditingController();
  final carpetStainCleaningArea = TextEditingController();
  RxString carpetSteamCleaningUnit = ''.obs;
  RxString carpetStainCleaningUnit = ''.obs;
  final List<String> carpetCleaningUnitOption = ['sqft', 'sqm'];
  void updatecarpetSteamCleaningUnit(String value) {
    carpetSteamCleaningUnit.value = value;
  }

  void updatecarpetStainCleaningUnit(String value) {
    carpetStainCleaningUnit.value = value;
  }

  var desireDate = DateTime.now().obs;
  var desireTime = TimeOfDay.now().obs;
  chooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            hintColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      desireDate.value = pickedDate;
      selectDateController.text = desireDate.value.toString().split(" ")[0];
      log('Selected Date: ${selectDateController.text}');
    }
  }

  chooseTime(BuildContext context) async {
    log("choose time");
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            hintColor: AppColors.primaryColor,
            timePickerTheme: const TimePickerThemeData(
              dialHandColor: AppColors.primaryColor,
              hourMinuteTextColor: AppColors.primaryColor,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedTime != null) {
      desireTime.value = pickedTime;
      // Format the time as H:i
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      selectTimeController.text = formattedTime;
      log('Selected Time: ${selectTimeController.text}');
    }
  }

  RxBool loading = RxBool(false);

  bookCarpetCleaningService(String price, String serviceName) async {
    loading.value = true;
    await BookCarpetCleaningRepo.bookCarpetCleaningRepo(
        fullName: fullNameController.text,
        email: emailController.text,
        phone: phoneNoController.text,
        location: addressController.text,
        date: selectDateController.text,
        time: selectTimeController.text,
        message: messageController.text,
        carpetSteamCleaningUnit: carpetSteamCleaningUnit.value,
        carpetSteamCleaningArea: carpetSteamCleaningArea.text,
        carpetStainCleaningUnit: carpetStainCleaningUnit.value,
        carpetStainCleaningArea: carpetStainCleaningArea.text,
        price: price,
        serviceName: serviceName,
        onSuccess: () {
          loading.value = false;
          Get.offAll(() => const ServiceCongratulationScreen());
          CustomSnackBar.success(
              title: "Carpet Cleaning Services",
              message: "Carpet Cleaning Services successfully booked.");
        },
        onError: ((message) {
          loading.value = false;
          CustomSnackBar.error(
              title: "Carpet Cleaning Service Booking", message: message);
        }));
  }
}
