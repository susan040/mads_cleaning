import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Welcome! 👋",
                  style: CustomTextStyles.f18W700(),
                ),
                Text(
                  "Emily Johnson",
                  style: CustomTextStyles.f14W400(),
                ),
              ]),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                  height: 45,
                  width: 45,
                  imageUrl:
                      "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg",
                  errorWidget: (context, url, error) => Image.network(
                    "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                    height: 45,
                    width: 45,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 18),
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("20% off",
                            style: CustomTextStyles.f24W700(
                                color: AppColors.extraWhite)),
                        const SizedBox(height: 2),
                        SizedBox(
                          width: 165,
                          child: Text(
                              "Book Now! Easy, Reliable, and Professional Cleaning Services.",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.extraWhite)),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              width: 100,
                              height: 28,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Center(
                                  child: Text(
                                "Book Now",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.extraWhite),
                              ))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(ImagePath.advertisment, height: 135),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Services", style: CustomTextStyles.f14W700()),
                Text("View all",
                    style: CustomTextStyles.f14W400(
                        color: AppColors.secondaryColor))
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServicesWidget(
                    image: ImagePath.windowCleaning, name: "Window Cleaning"),
                ServicesWidget(
                    image: ImagePath.officeCleaning, name: "Office Cleaning"),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServicesWidget(
                    image: ImagePath.carpetCleaning, name: "Carpet Cleaning"),
                ServicesWidget(
                    image: ImagePath.gardenCleaning, name: "Garden Cleaning"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Container(
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
    );
  }
}
