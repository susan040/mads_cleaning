import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/repo/windows_cleaning_repo.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/views/service_booking/service_congratulation.dart';

class WindowBookingController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final inside = false.obs;
  final outside = false.obs;

  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final messageController = TextEditingController();
  final noOfWindowsController = TextEditingController();
  final windowsTrackAndFrames = TextEditingController();
  final noOfStoryController = TextEditingController();
  final selectDateController = TextEditingController();
  final selectTimeController = TextEditingController();

  var desireDate = DateTime.now().obs;
  var desireTime = TimeOfDay.now().obs;

  RxString selectWindowOption = ''.obs;

  RxBool loading = RxBool(false);

  void toggleInside(bool value) {
    if (value) {
      outside.value = false; // Unselect Outside when Inside is selected
    }
    inside.value = value;
  }

  void toggleOutside(bool value) {
    if (value) {
      inside.value = false; // Unselect Inside when Outside is selected
    }
    outside.value = value;
  }

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
      selectTimeController.text = desireTime.value.format(context);
      log('Selected Time: ${selectTimeController.text}');
    }
  }

  addBooking(
      String name,
      String email,
      String phone,
      String location,
      int noOfWindows,
      int noOfStory,
      String message,
      String type,
      String windowsTrackFrame,
      String serviceDate,
      String serviceTime) async {
    loading.value = true;

    await WindowsCleaningBookingRepo.windowsCleaningBookRepo(
        fullName: name,
        email: email,
        phone: phone,
        location: location,
        noOfWindows: noOfWindows,
        noOfStory: noOfStory,
        message: message,
        type: type,
        date: serviceDate,
        time: serviceTime,
        windowsTrackFrame: windowsTrackFrame,
        onSuccess: () {
          loading.value = false;
          Get.offAll(() => const ServiceCongratulationScreen());
          CustomSnackBar.success(
              title: "Services", message: "Services Booking is sucessful");
        },
        onError: ((message) {
          loading.value = false;
          CustomSnackBar.error(title: "Appointment", message: message);
        }));
  }
}
