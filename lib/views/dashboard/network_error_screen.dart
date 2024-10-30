import 'package:flutter/material.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.networkError, height: 240, width: 240),
            const SizedBox(height: 14),
            Text("Network Connection Error", style: CustomTextStyles.f16W600()),
            const SizedBox(height: 7),
            SizedBox(
              width: 252,
              child: Text(
                "Please check your internet connection and try again",
                style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}
