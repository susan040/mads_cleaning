import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mads_cleaning/controller/dashboard/lease_cleaning_controller.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class LeaseCleaningScreen extends StatelessWidget {
  final c = Get.put(LeaseCleaningController());
  final Services service;
  LeaseCleaningScreen({super.key, required this.service});

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
        title: Text("${service.name} Service",
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
                      Text("No of Bedrooms", style: CustomTextStyles.f14W700()),
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
                      controller: c.noOfBedroomController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of Bedrooms",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("No of Bathrooms",
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
                  child: CustomTextField(
                      controller: c.noOfBathroomController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of Bathrooms",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
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
                      Text("Select Where to Cleaning",
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
                          value: c.selectWindowCleaning.value.isEmpty
                              ? null
                              : c.selectWindowCleaning.value,
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
                          items: c.windowCleaningOption
                              .map((option) => DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            c.updateSelectWindowCleaning(value!);
                          },
                        )),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Text("Oven Cleaning",
                          style: CustomTextStyles.f14W700()),
                    ),
                    const SizedBox(width: 47),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Text("Stove Cleaning",
                          style: CustomTextStyles.f14W700()),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18, right: 7, bottom: 22, top: 10),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(canvasColor: AppColors.extraWhite),
                          child: Obx(() => DropdownButtonFormField<String>(
                                value: c.selectOvenCleaning.value.isEmpty
                                    ? null
                                    : c.selectOvenCleaning.value,
                                hint: Text(
                                  "Select",
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
                                        color: AppColors.primaryColor,
                                        width: 1),
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
                                items: c.cleaningOption
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(option),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  c.updateSelectOvenCleaning(value!);
                                },
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 18, bottom: 22, top: 10),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(canvasColor: AppColors.extraWhite),
                          child: Obx(() => DropdownButtonFormField<String>(
                                value: c.selectStoveCleaning.value.isEmpty
                                    ? null
                                    : c.selectStoveCleaning.value,
                                hint: Text(
                                  "Select",
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
                                        color: AppColors.primaryColor,
                                        width: 1),
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
                                items: c.cleaningOption
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(option),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  c.updateSelectStoveCleaning(value!);
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("No of walls to clean",
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
                      const EdgeInsets.only(left: 18, right: 18, bottom: 20),
                  child: CustomTextField(
                      controller: c.noOfWallsCleaningController,
                      validator: Validators.checkFieldEmpty,
                      hint: "No of walls to clean",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("Carpet Steam Cleaning Area",
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
                  child: CustomTextField(
                      controller: c.carpetSteamCleaningArea,
                      validator: Validators.checkFieldEmpty,
                      hint: "Carpet Steam Cleaning Area",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    children: [
                      Text("Carpet Steam Cleaning Unit",
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
                          value: c.carpetSteamCleaningUnit.value.isEmpty
                              ? null
                              : c.carpetSteamCleaningUnit.value,
                          hint: Text(
                            "Select carpet Steam Cleaning Unit",
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
                          items: c.carpetSteamCleaningUnitOption
                              .map((option) => DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            c.updatecarpetSteamCleaningUnit(value!);
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
                    //validator: Validators.checkFieldEmpty,
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
                  c.bookLeaseCleaningService(
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
