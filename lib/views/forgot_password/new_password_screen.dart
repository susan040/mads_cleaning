import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/auth/forgot_password_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/views/auth/login_screen.dart';
import 'package:mads_cleaning/widgets/custom/custom_password_fields.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class NewPasswordScreen extends StatelessWidget {
  final c = Get.put(ForgotPasswordController());
  NewPasswordScreen({super.key});

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
        title: Text("Create New Password",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
          child: Column(children: [
            const SizedBox(height: 70),
            Image.asset(ImagePath.newPassword, width: 250),
            const SizedBox(height: 30),
            SizedBox(
              width: 278,
              child: Text(
                  "Your New Password Must be Different from Previously Used Password",
                  style: CustomTextStyles.f14W600(),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            Obx(() => CustomPasswordField(
                validator: Validators.checkPasswordField,
                hint: "New Password",
                preIconPath: Icons.password,
                preIconSize: 16,
                eye: c.newPasswordObscure.value,
                onEyeClick: c.onEyeCLickNewPassword,
                controller: c.newPasswordController,
                textInputAction: TextInputAction.done)),
            const SizedBox(height: 20),
            Obx(() => CustomPasswordField(
                validator: Validators.checkPasswordField,
                hint: "Confirm New Password",
                preIconPath: Icons.password,
                preIconSize: 16,
                eye: c.confirmPasswordObscure.value,
                onEyeClick: c.onEyeCLickConfirmPassword,
                controller: c.confirmPasswordController,
                textInputAction: TextInputAction.done)),
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
                Get.to(() => LoginScreen());
              }),
        ),
      ),
    );
  }
}
