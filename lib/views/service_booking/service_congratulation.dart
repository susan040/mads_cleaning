import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dash_screen.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class ServiceCongratulationScreen extends StatelessWidget {
  const ServiceCongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height / 2.5,
            width: Get.width / 1.5,
            decoration: const BoxDecoration(
                color: AppColors.extraWhite,
                image: DecorationImage(
                    image: AssetImage(ImagePath.serviceBooked),
                    fit: BoxFit.cover)),
          ),
          Text("Congratulations", style: CustomTextStyles.f24W700()),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 120, right: 120),
            child: Text(
              "Your service has been Booked",
              style: CustomTextStyles.f14W400(color: AppColors.textGreyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 80)
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
