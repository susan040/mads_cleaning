import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/all_serivces_controller.dart';
import 'package:mads_cleaning/controller/dashboard/network_error_controller.dart';
import 'package:mads_cleaning/views/appointment/appointment_booking_screen.dart';
import 'package:mads_cleaning/views/dashboard/all_services_screen.dart';
import 'package:mads_cleaning/widgets/home_network_error_widget.dart';
import 'package:mads_cleaning/widgets/rating_widget.dart';
import 'package:mads_cleaning/widgets/services_widget.dart';

import 'package:shimmer/shimmer.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class HomeScreen extends StatelessWidget {
  final c = Get.put(AllSerivcesController());
  final coreController = Get.put(CoreController());
  final networkErrorController = Get.put(NetworkErrorController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: Obx(() {
          if (networkErrorController.isOffline.value) {
            return HomeNetworkErrorWidget();
          }

          if (c.loading.value) {
            return buildShimmerEffect();
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWelcomeSection(),
                buildPromotionBanner(),
                buildServicesSection(),
                buildTestimonialSection(),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: Obx(() => c.loading.value
          ? Container()
          : InkWell(
              onTap: () {
                //Get.to(() => ChatBotScreen());
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SvgPicture.asset(ImagePath.message),
                ),
              ),
            )),
    );
  }

  Widget buildShimmerEffect() {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  width: 120,
                  height: 50,
                  color: Colors.grey[300],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              width: double.infinity,
              height: 160,
              color: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 14, bottom: 5),
                  width: 90,
                  height: 30,
                  color: Colors.grey[300],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 14, bottom: 5),
                  width: 70,
                  height: 30,
                  color: Colors.grey[300],
                ),
              ],
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 3 / 2.5,
              ),
              itemCount: 4, // Assuming to show 4 shimmer items
              itemBuilder: (context, index) => Container(
                color: Colors.grey[300],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              width: 100,
              height: 30,
              color: Colors.grey[300],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              height: 165,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Welcome! 👋",
            style: CustomTextStyles.f18W700(),
          ),
          Text(
            coreController.currentUser.value!.name.toString(),
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
            imageUrl: coreController.currentUser.value!.avatar ?? "",
            errorWidget: (context, url, error) => Image.network(
              "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
              height: 45,
              width: 45,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildPromotionBanner() {
    return Container(
      margin: const EdgeInsets.all(14),
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
                    style:
                        CustomTextStyles.f24W700(color: AppColors.extraWhite)),
                const SizedBox(height: 2),
                SizedBox(
                  width: 165,
                  child: Text(
                      "Book Now! Easy, Reliable, and Professional Cleaning Services.",
                      style: CustomTextStyles.f12W400(
                          color: AppColors.extraWhite)),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.to(() => AppointmentBookingScreen());
                  },
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
    );
  }

  Widget buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(() => (c.loading.value)
              ? const Center(child: CircularProgressIndicator())
              : c.allServices.isEmpty
                  ? Center(
                      child: Text(
                      "No services",
                      style: CustomTextStyles.f14W400(
                          color: AppColors.textGreyColor),
                    ))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 3 / 2.5,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          c.allServices.length > 4 ? 4 : c.allServices.length,
                      itemBuilder: (context, index) {
                        return ServicesWidget(services: c.allServices[index]);
                      },
                    )),
        ],
      ),
    );
  }

  // Testimonial section
  Widget buildTestimonialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 10),
          child: Text("Testimonial", style: CustomTextStyles.f14W700()),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 14),
              TestimonialWidget(
                image:
                    "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg",
                name: "— Sarah J.",
                text:
                    "I love the Mads Cleaning and Gardening app! Booking is easy, and the professionals always do an amazing job. Highly recommend!",
                rating: 5.0,
              ),
              TestimonialWidget(
                image:
                    "https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
                name: "— Michael T.",
                text:
                    "The service was exceptional! The team arrived on time and did a thorough job. I'm very satisfied!",
                rating: 4.5,
              ),
              TestimonialWidget(
                image:
                    "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrewpersonaltraining-697509.jpg&fm=jpg",
                name: "— Jessica R.",
                text:
                    "Mads Cleaning made my life so much easier. They are professional, friendly, and the results are fantastic!",
                rating: 5.0,
              ),
              TestimonialWidget(
                image:
                    "https://atd-blog.s3.us-east-2.amazonaws.com/wp-content/uploads/2022/04/16142821/cool-profile-pictures-for-girls-9.webp",
                name: "— David L.",
                text:
                    "I was impressed with the attention to detail. Highly recommend their services for anyone needing a clean home.",
                rating: 4.0,
              ),
            ],
          ),
        ),
      ],
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
      margin: const EdgeInsets.only(right: 10, bottom: 14),
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
                StarWidget(rating: rating),
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
