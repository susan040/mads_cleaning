import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/all_serivces_controller.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dashboard/service_description_screen.dart';

class ServicesWidget extends StatelessWidget {
  final c = Get.put(AllSerivcesController());
  ServicesWidget({
    super.key,
    required this.services,
  });
  final Services services;
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
            // ClipRRect(
            //   child: CachedNetworkImage(
            //     placeholder: (context, url) =>
            //         const Center(child: CircularProgressIndicator()),
            //     fit: BoxFit.cover,
            //     height: 75,
            //     filterQuality: FilterQuality.high,
            //     imageUrl: c.serviceImages[services.name] ?? "",
            //     errorWidget: (context, url, error) => Image.asset(
            //       ImagePath.blankImage,
            //       height: 75,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            ClipRRect(
              child: Image.asset(
                c.serviceImages[services.name] ??
                    ImagePath.blankImage, // Use asset image
                height: 75,
                fit: BoxFit.cover,
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
