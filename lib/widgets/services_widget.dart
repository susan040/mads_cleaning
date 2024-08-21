import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/views/dashboard/service_description_screen.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ServiceDescriptionScreen());
      },
      child: Container(
        height: 135,
        width: Get.width / 2.32,
        decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.borderColor,
                blurRadius: 2.0,
                offset: Offset(1, 1),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              filterQuality: FilterQuality.high,
              height: 75,
            ),
            const SizedBox(height: 9),
            Text(name, style: CustomTextStyles.f14W400())
          ],
        ),
      ),
    );
  }
}
