import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/splash_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  final c = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImagePath.logo),
          const CircularProgressIndicator(
            backgroundColor: AppColors.secondaryColor,
            valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
          )
        ],
      ),
    )));
  }
}
