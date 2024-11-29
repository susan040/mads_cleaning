import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/auth/forgot_password_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/views/forgot_password/email_verification_screen.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final c = Get.put(ForgotPasswordController());
  ForgotPasswordScreen({super.key});

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
        title: Text("Forgot Password",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
          child: Column(children: [
            const SizedBox(height: 50),
            Image.asset(ImagePath.forgotPassword),
            SizedBox(
              width: 278,
              child: Text(
                  "Please Enter Your Email Address To Recieve a Verification Card",
                  style: CustomTextStyles.f14W600(),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            CustomTextField(
                validator: Validators.checkEmailField,
                controller: c.emailController,
                hint: "email",
                preIconPath: Icons.email,
                preIconSize: 14,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(
              title: "Send",
              onTap: () {
                Get.to(() => const EmailVerificationScreen());
              }),
        ),
      ),
    );
  }
}
