import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/service_booking_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/views/service_booking/service_congratulation.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';
import 'package:mads_cleaning/widgets/services_form_widget.dart';

class WindowCleaningScreen extends StatelessWidget {
  final c = Get.put(ServiceBookingController());
  WindowCleaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Window Cleaning Service",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: c.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServiceFormWidget(c: c),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child:
                      Text("No of Windows", style: CustomTextStyles.f14W700()),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      controller: c.noOfWindowsController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of Windows",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Text("No of Story", style: CustomTextStyles.f14W700()),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      controller: c.noOfStoryController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of Story (House)",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child:
                      Text("Select Options", style: CustomTextStyles.f14W700()),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      c.selectWindowOption.value = value.toString();
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'Inside',
                        child:
                            Text('Inside', style: CustomTextStyles.f14W400()),
                      ),
                      DropdownMenuItem(
                        value: 'Outside',
                        child:
                            Text('Outside', style: CustomTextStyles.f14W400()),
                      ),
                      DropdownMenuItem(
                        value: 'Windows Tracks and Frames',
                        child: Text('Windows Tracks and Frames',
                            style: CustomTextStyles.f14W400()),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: "Select cleaning option",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.secondaryTextColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.errorColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.errorColor),
                      ),
                      hintStyle: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor),
                    ),
                  ),
                ),
                MessageWidget(c: c)
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 10),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(
              title: "Submit",
              onTap: () {
                Get.offAll(() => const ServiceCongratulationScreen());
              }),
        ),
      ),
    );
  }
}
