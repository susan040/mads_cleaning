import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dashboard/service_description_screen.dart';
import 'package:mads_cleaning/widgets/rating_widget.dart';

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
                fit: BoxFit.contain,
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

class TestimonialWidget extends StatelessWidget {
  const TestimonialWidget({
    super.key,
    required this.image,
    required this.name,
    required this.text,
    required this.rating,
  });
  final String image;
  final String name;
  final String text;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, bottom: 10),
      height: 165,
      width: 235,
      decoration: BoxDecoration(
          color: AppColors.lightBlue, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
        child: Column(children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                fit: BoxFit.cover,
                height: 45,
                width: 45,
                imageUrl: image,
                errorWidget: (context, url, error) => Image.network(
                  "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                  height: 45,
                  width: 45,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: CustomTextStyles.f12W700()),
                const SizedBox(height: 3),
                StarWidget(
                  rating: rating,
                ),
              ],
            ),
          ]),
          const SizedBox(height: 8),
          Text(
            text,
            style: CustomTextStyles.f12W400(),
            textAlign: TextAlign.justify,
          )
        ]),
      ),
    );
  }
}
