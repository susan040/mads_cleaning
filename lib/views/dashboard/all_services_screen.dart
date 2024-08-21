import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/widgets/services_widget.dart';

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesWidget(
                        image: ImagePath.windowCleaning,
                        name: "Window Cleaning"),
                    ServicesWidget(
                        image: ImagePath.officeCleaning,
                        name: "Office Cleaning"),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesWidget(
                        image: ImagePath.carpetCleaning,
                        name: "Carpet Cleaning"),
                    ServicesWidget(
                        image: ImagePath.gardenCleaning,
                        name: "Garden Cleaning"),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesWidget(
                        image: ImagePath.leaseCleaning, name: "Lease CLeaning"),
                    ServicesWidget(
                        image: ImagePath.domesticCleaning,
                        name: "Domestic Cleaning"),
                  ],
                ),
                SizedBox(height: 18),
                ServicesWidget(
                    image: ImagePath.commercialCleaning,
                    name: "Commercial Cleaning"),
              ],
            ),
          ),
        ));
  }
}
