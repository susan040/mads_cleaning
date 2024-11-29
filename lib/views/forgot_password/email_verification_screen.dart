import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/forgot_password/new_password_screen.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatelessWidget {
  static String routeName = "/email-verification_screen";
  const EmailVerificationScreen({super.key});

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
        title: Text("Verify your Email",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
          child: SafeArea(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset(ImagePath.verifyEmail, width: 200),
                const SizedBox(height: 18),
                SizedBox(
                  width: 278,
                  child: Text(
                    "Please Enter The 4 Digit Code Sent to example@gmail.com",
                    style: CustomTextStyles.f14W400(),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    length: 4, // Number of input fields
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: CustomTextStyles.f14W400(),
                      decoration: BoxDecoration(
                        color: AppColors.shimmerBase,
        
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: CustomTextStyles.f14W400(),
                      decoration: BoxDecoration(
                        color: AppColors.extraWhite,
                        border: Border.all(
                          width: 1.5,
                          color: AppColors.secondaryColor, // Focused border color
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
        
                    onChanged: (pin) {
                      print('Entered PIN: $pin');
                    },
                  ),
                ),
                const SizedBox(height: 20), // Space between Pinput and button
                InkWell(
                  onTap: () {
                    print('Resend code tapped');
                    // Add your resend code logic here
                  },
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: AppColors.secondaryColor,
                        decorationColor: AppColors.secondaryColor),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
        child: SizedBox(
          height: 55,
          child: CustomElevatedButton(
              title: "Verify",
              onTap: () {
                Get.to(() => NewPasswordScreen());
              }),
        ),
      ),
    );
  }
}
