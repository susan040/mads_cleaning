import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';

class AppointmentBookingController extends GetxController {
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
                AppColors.primaryColor, // Change this to your desired color
            hintColor:
                AppColors.primaryColor, // Change this to your desired color
            colorScheme: const ColorScheme.light(
              primary:
                  AppColors.primaryColor, // Change this to your desired color
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

  var tardisSelection = <String, bool>{
    "Handyman Jobs": false,
    "Plumbers": false,
    "Electricians": false,
    "Builders": false,
    "Real Estate Agents": false,
    "Locksmiths": false,
    "Landscapers": false,
    "Tree Loopers": false,
    "Painters": false,
    "Glass repairers / replacers (House and Vehicles)": false,
    "Blinds and Curtain Fitters": false,
    "Flooring": false,
    "Carpet Layers": false,
    "Tilers": false,
    "Event Planners": false,
    "Photographers": false,
    "Cabinet Maker": false,
    "Pest control": false,
    "Removalists": false,
    "CCTV installer (Any Premises)": false,
  }.obs;

  // Function to toggle the selection of a tardis
  void toggleSelection(String key) {
    tardisSelection[key] = !tardisSelection[key]!;
  }
}
