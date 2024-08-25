import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class BookedDetailsScreen extends StatelessWidget {
  const BookedDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("All Services",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SizedBox(
        width: double.infinity,
        //height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          children: [
            // Background Image
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 14),
              child: Image.asset(
                ImagePath.background,
                fit: BoxFit.cover,
                width: double.infinity,
                //height: double.infinity,
              ),
            ),

            // Padding with details
            Padding(
              padding: const EdgeInsets.only(
                  left: 35, right: 40, top: 40, bottom: 25),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 2.8,
                      width: double.infinity,
                      imageUrl:
                          "https://ecoglowcleaning.com/wp-content/uploads/2022/11/Cleaning-service-employees-wit.jpg",
                      errorWidget: (context, url, error) => Image.asset(
                        ImagePath.blankImage, // Replace with your asset path
                        height: MediaQuery.of(context).size.height / 2.7,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service Type:", style: CustomTextStyles.f14W700()),
                      Text("Window Cleaning",
                          style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount:", style: CustomTextStyles.f14W700()),
                      Text("\$50", style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Booked Date:", style: CustomTextStyles.f14W700()),
                      Text("2024-07-28", style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Status:", style: CustomTextStyles.f14W700()),
                      Text("Pending", style: CustomTextStyles.f14W400()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          showMyDialog(context);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.rejected,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text("Cancel",
                  style:
                      CustomTextStyles.f14W600(color: AppColors.extraWhite))),
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          title: Text('Are you sure you want to cancel?',
              style: CustomTextStyles.f16W700()),
          content: Text(
            "Your booked service will be cancelled",
            style: CustomTextStyles.f12W400(color: AppColors.lGrey),
            textAlign: TextAlign.center,
          ),
          actions: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 44,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                      color: AppColors.extraWhite,
                      border: Border.all(width: 0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text('No', style: CustomTextStyles.f14W400())),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 44,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                      color: AppColors.rejected,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('Yes',
                          style: CustomTextStyles.f14W400(
                              color: AppColors.extraWhite)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}
