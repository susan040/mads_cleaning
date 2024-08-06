import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/all_services_screen.dart';
import 'package:mads_cleaning/widgets/rating_widget.dart';
import 'package:mads_cleaning/widgets/services_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 16, bottom: 18, left: 18, right: 18),
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
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Services", style: CustomTextStyles.f14W700()),
                    InkWell(
                      onTap: () {
                        Get.to(() => AllServicesScreen());
                      },
                      child: Text("View all",
                          style: CustomTextStyles.f14W400(
                              color: AppColors.secondaryColor)),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 13),
                child: Row(
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
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, top: 18, right: 18),
                child: Row(
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 20, bottom: 10),
                child: Text("Testimonial", style: CustomTextStyles.f14W700()),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  TestimonialWidget(
                      image:
                          "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg",
                      name: "— Sarah J.",
                      text:
                          "I love the Mads Cleaning and Gardening app! Booking is easy, and the professionals always do an amazing job. Highly recommend!"),
                  TestimonialWidget(
                      image:
                          "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg",
                      name: "— Sarah J.",
                      text:
                          "I love the Mads Cleaning and Gardening app! Booking is easy, and the professionals always do an amazing job. Highly recommend!"),
                  TestimonialWidget(
                      image:
                          "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg",
                      name: "— Sarah J.",
                      text:
                          "I love the Mads Cleaning and Gardening app! Booking is easy, and the professionals always do an amazing job. Highly recommend!")
                ]),
              )
            ],
          ),
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
  });
  final String image;
  final String name;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, bottom: 20),
      height: 148,
      width: 235,
      decoration: BoxDecoration(
          color: AppColors.lightBlue, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 14, top: 14, right: 14, bottom: 10),
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
                const StarWidget(),
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
