import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/repo/lease_cleaning_repo.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/views/service_booking/service_congratulation.dart';

class LeaseCleaningController extends GetxController {
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
  final noOfBedroomController = TextEditingController();
  final noOfBathroomController = TextEditingController();
  final noOfWallsCleaningController = TextEditingController();
  final carpetSteamCleaningArea = TextEditingController();
  final selectDateController = TextEditingController();
  final selectTimeController = TextEditingController();

  var desireDate = DateTime.now().obs;
  var desireTime = TimeOfDay.now().obs;

  var selectWindowCleaning = "".obs;
  var selectOvenCleaning = "".obs;
  var selectStoveCleaning = "".obs;
  var carpetSteamCleaningUnit = "".obs;
  final List<String> windowCleaningOption = ['Inside', 'Outside', 'Both'];
  final List<String> cleaningOption = ['Yes', 'No'];
  final List<String> carpetSteamCleaningUnitOption = ['sqft', 'sqm'];

  void updateSelectWindowCleaning(String value) {
    selectWindowCleaning.value = value;
  }

  void updateSelectOvenCleaning(String value) {
    selectOvenCleaning.value = value;
  }

  void updateSelectStoveCleaning(String value) {
    selectStoveCleaning.value = value;
  }

  void updatecarpetSteamCleaningUnit(String value) {
    carpetSteamCleaningUnit.value = value;
  }

  int get updateSelectedOvenValue {
    return selectOvenCleaning.value == 'Yes' ? 1 : 0;
  }

  int get updateSelectedStoveValue {
    return selectStoveCleaning.value == 'Yes' ? 1 : 0;
  }

  RxBool loading = RxBool(false);

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

  bookLeaseCleaningService(String price, String serviceName) async {
    loading.value = true;

    await BookLeaseCleaningRepo.bookLeaseCleaningRepo(
        fullName: fullNameController.text,
        email: emailController.text,
        phone: phoneNoController.text,
        location: addressController.text,
        date: selectDateController.text,
        time: selectTimeController.text,
        noOfBedroom: noOfBedroomController.text,
        noOfBathroom: noOfBathroomController.text,
        message: messageController.text,
        ovenCleaning: updateSelectedOvenValue.toString(),
        stoveCleaning: updateSelectedStoveValue.toString(),
        noOfWallsToClean: noOfWallsCleaningController.text,
        carpetSteamCleaningUnit: carpetSteamCleaningUnit.value,
        carpetSteamCleaningArea: carpetSteamCleaningArea.text,
        windowCleaning: selectWindowCleaning.value,
        price: price,
        serviceName: serviceName,
        onSuccess: () {
          loading.value = false;
          Get.offAll(() => const ServiceCongratulationScreen());
          CustomSnackBar.success(
              title: "Lease Cleaning Services",
              message: "Lease Cleaning Services successfully booked.");
        },
        onError: ((message) {
          loading.value = false;
          CustomSnackBar.error(
              title: "Lease Cleaning Service Booking", message: message);
        }));
  }
}
