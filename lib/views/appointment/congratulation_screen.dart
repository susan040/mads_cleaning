import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dash_screen.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height / 2.5,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.extraWhite,
                image: DecorationImage(
                    image: AssetImage(ImagePath.appointmentBooked))),
          ),
          Text("Appointment booked", style: CustomTextStyles.f24W700()),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 55),
            child: Text(
              "Thank you for choosing us we will contact you for appointment",
              style: CustomTextStyles.f14W400(color: AppColors.textGreyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 110)
        ],
      )),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 10),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(
              title: "Got It",
              onTap: () {
                Get.offAll(() => DashScreen());
              }),
        ),
      ),
    );
  }
}
