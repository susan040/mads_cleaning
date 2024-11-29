import 'package:flutter/material.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  //final c = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.logo,
                height: 195,
                width: 195,
              ),
              const SizedBox(height: 45),
              const CircularProgressIndicator(
                backgroundColor: AppColors.secondaryColor,
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ));
  }
}
