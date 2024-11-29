import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mads_cleaning/controller/auth/register_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/views/auth/login_screen.dart';
import 'package:mads_cleaning/widgets/custom/custom_password_fields.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  final c = Get.put(RegisterScreenController());
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: c.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child:
                          Text("Welcome!", style: CustomTextStyles.f32W700())),
                  const SizedBox(height: 3),
                  Center(
                    child: Text("Signup to get started",
                        style: CustomTextStyles.f18W400()),
                  ),
                  const SizedBox(height: 30),
                  Text("Full Name", style: CustomTextStyles.f14W400()),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: c.fullNameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Full Name",
                      preIconPath: Icons.person,
                      preIconSize: 22,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 18),
                  Text("Email", style: CustomTextStyles.f14W400()),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: c.emailController,
                      validator: Validators.checkEmailField,
                      hint: "Email",
                      preIconPath: Icons.email,
                      preIconSize: 18,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 18),
                  Text("Address", style: CustomTextStyles.f14W400()),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Address",
                      preIconPath: Icons.house_sharp,
                      preIconSize: 21,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 18),
                  Text("Phone No", style: CustomTextStyles.f14W400()),
                  const SizedBox(height: 10),
                  IntlPhoneField(
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
                  Text("Password", style: CustomTextStyles.f14W400()),
                  const SizedBox(height: 5),
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Password",
                      eye: c.passwordObscure.value,
                      preIconSize: 17,
                      preIconPath: Icons.password,
                      onEyeClick: c.passwordOnEyeCLick,
                      controller: c.passwordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Confirm Password", style: CustomTextStyles.f14W400()),
                  const SizedBox(height: 5),
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Confirm Password",
                      eye: c.confirmObscure.value,
                      preIconPath: Icons.password,
                      preIconSize: 17,
                      onEyeClick: c.confirmPasswordOnEyeCLick,
                      controller: c.confirmPasswordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 35),
                  CustomElevatedButton(
                      title: "Sign Up",
                      onTap: () {
                        c.onSubmit();
                      }),
                  const SizedBox(height: 27),
                  Center(
                      child: Text("Already have an account?",
                          style: CustomTextStyles.f14W400())),
                  Center(
                    child: InkWell(
                        onTap: () {
                          Get.offAll(() => LoginScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, top: 2, bottom: 2),
                          child:
                              Text("Login", style: CustomTextStyles.f14W700()),
                        )),
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
