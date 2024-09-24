import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dashboard/service_description_screen.dart';

class ServicesWidget extends StatelessWidget {
  ServicesWidget({
    super.key,
    required this.services,
  });

  final Services services;

  // A static map for your 7 service images
  final Map<String, String> serviceImages = {
    'Window Cleaning': ImagePath.windowCleaning,
    'Carpet Cleaning': ImagePath.carpetCleaning,
    'Builders Cleaning': ImagePath.officeCleaning,
    'Lawn Cleaning': ImagePath.gardenCleaning,
    'End of Lease Cleaning': ImagePath.leaseCleaning,
    'House Cleaning': ImagePath.domesticCleaning,
    'Commercial Cleaning': ImagePath.commercialCleaning,
    'Rubbish Removal': ImagePath.rubbishRemoval,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ServiceDescriptionScreen(
              service: services,
            ));
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
            ClipRRect(
              child: Image.asset(
                serviceImages[services.name] ??
                    ImagePath.blankImage, // Static image for each service
                height: 75,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 9),
            Text(services.name ?? "", style: CustomTextStyles.f14W400())
          ],
        ),
      ),
    );
  }
}
