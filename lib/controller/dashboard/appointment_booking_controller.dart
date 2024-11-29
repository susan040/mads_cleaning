import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/repo/appointment_booking_repo.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/views/appointment/congratulation_screen.dart';

class AppointmentBookingController extends GetxController {
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

  var desireDate = DateTime.now().obs;
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
            primaryColor:
                AppColors.primaryColor, 
            hintColor:
                AppColors.primaryColor, 
            colorScheme: const ColorScheme.light(
              primary:
                  AppColors.primaryColor, 
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
      log('--------->>>>>>>>>>>>${selectDateController.text.toString()}');
    }
  }

  var handymanJobs = false.obs;
  var plumbers = false.obs;
  var electricians = false.obs;
  var builders = false.obs;
  var realEstateAgents = false.obs;
  var locksmiths = false.obs;
  var landscapers = false.obs;
  var treeLoopers = false.obs;
  var painters = false.obs;
  var glassRepairers = false.obs;
  var blindsAndCurtainFitters = false.obs;
  var flooring = false.obs;
  var carpetLayers = false.obs;
  var tilers = false.obs;
  var eventPlanners = false.obs;
  var photographers = false.obs;
  var cabinetMaker = false.obs;
  var pestControl = false.obs;
  var removalists = false.obs;
  var cctvInstaller = false.obs;
  RxBool loading = RxBool(false);

  void appointmentBooking() async {
    loading.value = true;
    await AppointmentBookingRepo.appointmentBookingRepo(
        fullName: fullNameController.text,
        email: emailController.text,
        phone: phoneNoController.text,
        location: addressController.text,
        message: messageController.text,
        date: selectDateController.text,
        handymanJobs: handymanJobs.value ? '1' : '0',
        plumbers: plumbers.value ? '1' : '0',
        electricians: electricians.value ? '1' : '0',
        builders: builders.value ? '1' : '0',
        realEstateAgents: realEstateAgents.value ? '1' : '0',
        locksmiths: locksmiths.value ? '1' : '0',
        landscapers: landscapers.value ? '1' : '0',
        treeLoopers: treeLoopers.value ? '1' : '0',
        painters: painters.value ? '1' : '0',
        glassRepairers: glassRepairers.value ? '1' : '0',
        blindsAndCurtainFitters: blindsAndCurtainFitters.value ? '1' : '0',
        flooring: flooring.value ? '1' : '0',
        carpetLayers: carpetLayers.value ? '1' : '0',
        tilers: tilers.value ? '1' : '0',
        eventPlanners: eventPlanners.value ? '1' : '0',
        photographers: photographers.value ? '1' : '0',
        cabinetMaker: cabinetMaker.value ? '1' : '0',
        pestControl: pestControl.value ? '1' : '0',
        removalists: removalists.value ? '1' : '0',
        cctvInstaller: cctvInstaller.value ? '1' : '0',
        onSuccess: () {
          loading.value = false;
          Get.offAll(() => const CongratulationScreen());
          CustomSnackBar.success(
              title: "Appointment Booking",
              message: "Appointment successfully booked.");
        },
        onError: ((message) {
          loading.value = false;
          CustomSnackBar.error(title: "Appointment Booking", message: message);
        }));
  }
}
