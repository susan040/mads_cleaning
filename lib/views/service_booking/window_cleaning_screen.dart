import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mads_cleaning/controller/service_bookings/window_cleaning_controller.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class WindowCleaningScreen extends StatelessWidget {
  final c = Get.put(WindowBookingController());
  WindowCleaningScreen({super.key, required this.service});
  final Services service;
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 20, bottom: 10),
                  child: Row(
                    children: [
                      Text("Personal details",
                          style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                  child: Row(children: [
                    SizedBox(
                      width: Get.width / 2.35,
                      child: CustomTextField(
                          controller: c.fullNameController,
                          validator: Validators.checkFieldEmpty,
                          hint: "Full Name",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text),
                    ),
                    const SizedBox(width: 18),
                    SizedBox(
                      width: Get.width / 2.35,
                      child: CustomTextField(
                          controller: c.addressController,
                          validator: Validators.checkFieldEmpty,
                          hint: "Address",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text),
                    ),
                  ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      controller: c.emailController,
                      validator: Validators.checkEmailField,
                      hint: "Email",
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: IntlPhoneField(
                    controller: c.phoneNoController,
                    decoration: InputDecoration(
                      hintText: "Phone No",
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
                    style: CustomTextStyles.f14W400(
                      color: (AppColors.textColor),
                    ),
                    dropdownTextStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    initialCountryCode: 'AU',
                    showDropdownIcon: false,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("Select Date", style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      readOnly: true,
                      onTap: () => c.chooseDate(context),
                      controller: c.selectDateController,
                      preIconPath: (Icons.calendar_month),
                      validator: Validators.checkFieldEmpty,
                      hint: "YYYY-MM-DD",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.none),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("Select Time", style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      readOnly: true,
                      onTap: () => c.chooseTime(context),
                      controller: c.selectTimeController,
                      preIconPath: (Icons.timelapse),
                      validator: Validators.checkFieldEmpty,
                      hint: "HH:MM",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.none),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("Where to clean?",
                          style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: AppColors.extraWhite),
                    child: Obx(() => DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          value: c.selectWhereToClean.value.isEmpty
                              ? null
                              : c.selectWhereToClean.value,
                          hint: Text(
                            "Select where to clean",
                            style: CustomTextStyles.f14W400(
                                color: AppColors.secondaryTextColor),
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 18),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.secondaryTextColor,
                                  width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            ),
                          ),
                          items: c.whereToCleanOption
                              .map((option) => DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            c.updateSelectedWhereToClean(value!);
                          },
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("No of Windows", style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      controller: c.noOfWindowsController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of Windows",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("No of Story", style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: CustomTextField(
                      controller: c.noOfStoryController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of Story (House)",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("Windows Tracks and frames",
                          style: CustomTextStyles.f14W700()),
                      Text(
                        '*',
                        style: CustomTextStyles.f18W700(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: AppColors.extraWhite),
                    child: Obx(() => DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          value: c.windowsTrackCleaning.value.isEmpty
                              ? null
                              : c.windowsTrackCleaning.value,
                          hint: Text(
                            "Windows Tracks and frames",
                            style: CustomTextStyles.f14W400(
                                color: AppColors.secondaryTextColor),
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 18),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.secondaryTextColor,
                                  width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            ),
                          ),
                          items: c.windowsTrackCleaningOption
                              .map((option) => DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            c.updateSelectedTrack(value!);
                          },
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Text("Message", style: CustomTextStyles.f14W700()),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                  child: TextFormField(
                    style: CustomTextStyles.f14W400(),
                    maxLines: 6,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Write Message",
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
                      hintStyle: CustomTextStyles.f16W400(
                          color: AppColors.secondaryTextColor),
                    ),
                    controller: c.messageController,
                  ),
                )
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
                if (c.formKey.currentState?.validate() ?? false) {
                  c.bookWindowCleaningService(
                      service.price.toString(), service.name.toString());
                } else {
                  // Form is invalid, show errors
                  print('Form is invalid');
                }
              }),
        ),
      ),
    );
  }
}
