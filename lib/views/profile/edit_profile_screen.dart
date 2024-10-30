import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mads_cleaning/controller/dashboard/edit_profile_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class EditProfileScreen extends StatelessWidget {
  final c = Get.put(EditProfileController());
  EditProfileScreen({super.key});

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
        title: Text("My Details",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Column(children: [
            const SizedBox(height: 25),
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: (c.image.value != null)
                    ? Image.file(
                        c.image.value!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      )
                    : CachedNetworkImage(
                        imageUrl: c.avatarUrl.value!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.network(
                          "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                c.pickImage();
              },
              child: Text(
                "Change Avatar",
                style:
                    CustomTextStyles.f14W600(color: AppColors.secondaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
              child: Column(
                children: [
                  CustomTextField(
                      controller: c.nameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Full Name",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.emailController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Email",
                      readOnly: true,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your address",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  IntlPhoneField(
                    controller: c.phoneController,
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
                      hintStyle: CustomTextStyles.f16W400(
                          color: AppColors.secondaryTextColor),
                    ),
                    style: CustomTextStyles.f16W400(
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
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 12, bottom: 12),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 208,
                          208), 
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded,
                            color: AppColors.textColor,
                            size: 18),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text('You cannot change your email',
                              style: CustomTextStyles.f12W400()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(
              title: "Save",
              onTap: () {
                c.submit();
              }),
        ),
      ),
    );
  }
}
