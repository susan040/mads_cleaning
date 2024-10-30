import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/change_password_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/validator.dart';
import 'package:mads_cleaning/widgets/custom/custom_password_fields.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  final c = Get.put(ChangePasswordController());
  ChangePasswordScreen({super.key});

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
        title: Text("Change Password",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CustomPasswordField(
                      hint: "Old Password",
                      eye: c.oldPassEye.value,
                      preIconPath: Icons.password,
                      onEyeClick: c.onOldEyeClick,
                      controller: c.oldPassCon,
                      textInputAction: TextInputAction.next),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => CustomPasswordField(
                      hint: "New Password",
                      eye: c.newPassEye.value,
                      preIconPath: Icons.password,
                      onEyeClick: c.onNewEyeClick,
                      controller: c.newPassCon,
                      textInputAction: TextInputAction.next),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => CustomPasswordField(
                      hint: "Confirm Password",
                      eye: c.confirmPassEye.value,
                      preIconPath: Icons.password,
                      onEyeClick: c.onConfirmEyeClick,
                      controller: c.confirmPassCon,
                      validator: (fieldContent) {
                        return Validators.checkConfirmPassword(
                            c.newPassCon.text, fieldContent);
                      },
                      textInputAction: TextInputAction.done),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 10),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(title: "Change Password", onTap: () {}),
        ),
      ),
    );
  }
}
