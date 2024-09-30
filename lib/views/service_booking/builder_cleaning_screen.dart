import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mads_cleaning/controller/service_bookings/builders_cleaning_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class BuildersCleaningScreen extends StatelessWidget {
  final c = Get.put(BuildersCleaningController()); // Create instance

  BuildersCleaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
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
        title: Text("Builder Cleaning Service",
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
                    Text("Personal details", style: CustomTextStyles.f14W700()),
                    Text(
                      '*',
                      style: CustomTextStyles.f18W700(color: Colors.red),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
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
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 22),
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
                    // ignore: avoid_print
                    print(phone.completeNumber);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                child: Text("Select Date", style: CustomTextStyles.f14W700()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                child: CustomTextField(
                    readOnly: true,
                    onTap: () => c.chooseDate(context),
                    controller: c.selectDateController,
                    preIconPath: (Icons.calendar_month),
                    hint: "YYYY-MM-DD",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.none),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                child: Text("Select Time", style: CustomTextStyles.f14W700()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 22),
                child: CustomTextField(
                    readOnly: true,
                    onTap: () => c.chooseTime(context),
                    controller: c.selectTimeController,
                    preIconPath: (Icons.timelapse),
                    hint: "YYYY-MM-DD",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.none),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                child: Row(
                  children: [
                    Text("Type of commercial space",
                        style: CustomTextStyles.f14W700()),
                    Text(
                      '*',
                      style: CustomTextStyles.f18W700(color: Colors.red),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 22),
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
                        value: c.selectTypeOfCommercialSpace.value.isEmpty
                            ? null
                            : c.selectTypeOfCommercialSpace.value,
                        hint: Text(
                          "Select type of commercial space",
                          style: CustomTextStyles.f14W400(
                              color: AppColors.secondaryTextColor),
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.secondaryTextColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                        items: c.typeOfCommericialOption
                            .map((option) => DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                ))
                            .toList(),
                        onChanged: (value) {
                          c.updateTypeOfCommercialSpace(value!);
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Text("Is Site Vist required?",
                    style: CustomTextStyles.f14W700()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 90, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  Colors.black, // Border color
                              checkboxTheme: CheckboxThemeData(
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors
                                          .secondaryColor; // Fill color when selected
                                    }
                                    return AppColors
                                        .extraWhite; // Fill color when not selected
                                  },
                                ),
                                checkColor: WidgetStateProperty.all(
                                    AppColors.extraWhite), // Check color
                              ),
                            ),
                            child: Checkbox(
                              value: c.isSiteVisitRequired.value,
                              onChanged: (bool? newValue) {
                                c.isSiteVisitRequired.value = newValue ?? false;
                                c.isSiteVisitNotRequired.value =
                                    false; // Unselect the other checkbox
                              },
                            ),
                          ),
                          Text(
                            "Yes",
                            style: CustomTextStyles.f14W400(),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  Colors.black, // Border color
                              checkboxTheme: CheckboxThemeData(
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors
                                          .secondaryColor; // Fill color when selected
                                    }
                                    return AppColors
                                        .extraWhite; // Fill color when not selected
                                  },
                                ),
                                checkColor: WidgetStateProperty.all(
                                    AppColors.extraWhite), // Check color
                              ),
                            ),
                            child: Checkbox(
                              value: c.isSiteVisitNotRequired.value,
                              onChanged: (bool? newValue) {
                                c.isSiteVisitNotRequired.value =
                                    newValue ?? false;
                                c.isSiteVisitRequired.value =
                                    false; // Unselect the other checkbox
                              },
                            ),
                          ),
                          Text(
                            "No",
                            style: CustomTextStyles.f14W400(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () {
                  if (c.isSiteVisitRequired.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, bottom: 10),
                          child: Text("Select Site Visit Date",
                              style: CustomTextStyles.f14W700()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, bottom: 15),
                          child: CustomTextField(
                            readOnly: true,
                            onTap: () => c.chooseVisitedDate(context),
                            controller: c.selectSiteVistDateController,
                            preIconPath: (Icons.calendar_month),
                            hint: "YYYY-MM-DD",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.none,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox(); // Return an empty widget when not required
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                child: Row(
                  children: [
                    Text("Price", style: CustomTextStyles.f14W700()),
                    Text(
                      '*',
                      style: CustomTextStyles.f18W700(color: Colors.red),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
                child: CustomTextField(
                    controller: c.priceController,
                    validator: Validators.checkFieldEmpty,
                    hint: "Enter Price",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                child: Text("Message", style: CustomTextStyles.f14W700()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
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
          ),
        ),
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
                  c.bookBuilderCleaningService();
                } else {
                  // ignore: avoid_print
                  print('Form is invalid');
                }
              }),
        ),
      ),
    );
  }
}
