import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/auth/login_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/views/auth/register_screen.dart';
import 'package:mads_cleaning/views/dash_screen.dart';
import 'package:mads_cleaning/views/forgot_password/forgot_password_screen.dart';
import 'package:mads_cleaning/widgets/custom/custom_password_fields.dart';
import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("Good to see You!",
                      style: CustomTextStyles.f32W700())),
              Center(
                  child: Text("Let's continue the journey",
                      style: CustomTextStyles.f18W400())),
              const SizedBox(height: 25),
              Text("Email", style: CustomTextStyles.f14W400()),
              const SizedBox(height: 10),
              CustomTextField(
                  validator: Validators.checkEmailField,
                  controller: c.emailController,
                  hint: "email",
                  preIconPath: Icons.email,
                  preIconSize: 14,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              Text("Password", style: CustomTextStyles.f14W400()),
              const SizedBox(height: 5),
              Obx(() => CustomPasswordField(
                  validator: Validators.checkPasswordField,
                  hint: "password",
                  preIconPath: Icons.password,
                  preIconSize: 16,
                  eye: c.passwordObscure.value,
                  onEyeClick: c.onEyeCLick,
                  controller: c.passwordController,
                  textInputAction: TextInputAction.done)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    child: Text(
                      "Forget Password?",
                      style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                  title: "Login",
                  onTap: () {
                    Get.offAll(() => DashScreen());
                  }),
              const SizedBox(height: 28),
              Center(
                  child: Text("Don't have an account?",
                      style: CustomTextStyles.f14W400())),
              InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.offAll(() => RegisterScreen());
                  },
                  child: Center(
                      child:
                          Text("Sign Up", style: CustomTextStyles.f14W700()))),
            ],
          ),
        )),
      ),
    );
  }
}
