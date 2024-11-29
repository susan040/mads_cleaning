import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/service_booking/window_cleaning_screen.dart';
// import 'package:mads_cleaning/views/appointment/appointment_booking_screen.dart';
// import 'package:mads_cleaning/views/service_booking/builder_cleaning_screen.dart';
// import 'package:mads_cleaning/views/service_booking/carpet_cleaning_screen.dart';
// import 'package:mads_cleaning/views/service_booking/commercial_cleaning_screen.dart';
// import 'package:mads_cleaning/views/service_booking/house_cleaning_screen.dart';
// import 'package:mads_cleaning/views/service_booking/lawn_cleaning_screen.dart';
// import 'package:mads_cleaning/views/service_booking/lease_cleaning_screen.dart';
// import 'package:mads_cleaning/views/service_booking/rubbish_removal_screen.dart';
// import 'package:mads_cleaning/views/service_booking/window_cleaning_screen.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class ServiceDescriptionScreen extends StatelessWidget {
  const ServiceDescriptionScreen({super.key, required this.service});

  final Services service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
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
        title: Text("${service.name} Service",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  imageUrl: service.imageUrl ?? "",
                  filterQuality: FilterQuality.high,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    ImagePath.blankImage, // Replace with your asset path
                    height: MediaQuery.of(context).size.height / 2.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
                child:
                    Text(service.name ?? "", style: CustomTextStyles.f18W700()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                child: Text("\$${service.price}/day",
                    style: CustomTextStyles.f16W700(
                        color: AppColors.secondaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                child: Text(
                  service.description ?? "",
                  style: CustomTextStyles.f14W400(),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 15),
                child: Text("Working Information",
                    style: CustomTextStyles.f16W600()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 7),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: AppColors.lGrey,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Monday-Friday: 08:00 AM - 05:00 PM",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.lGrey)),
                          const SizedBox(height: 2),
                          Text("Saturday: 09:00 AM - 07:00 PM",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.lGrey)),
                          const SizedBox(height: 2),
                          Text("Sunday: 09:00 AM - 05:00 PM",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.lGrey)),
                        ],
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 3),
                child: Row(
                  children: [
                    SvgPicture.asset(ImagePath.location, height: 18, width: 14),
                    const SizedBox(width: 17),
                    Text(
                      service.location ?? "",
                      style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 10),
                child: Divider(
                  thickness: 0.5,
                  color: AppColors.lGrey,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DescriptionWidget(
                        image: ImagePath.affordable, name: "Affordable Rates"),
                    DescriptionWidget(
                        image: ImagePath.guarantee, name: "Guaranteed"),
                    DescriptionWidget(
                        image: ImagePath.experience, name: "Experienced Staff")
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 10),
                child: Divider(
                  thickness: 0.5,
                  color: AppColors.lGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                child: Text("Want to book appointment?",
                    style: CustomTextStyles.f16W600()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                child: Text(
                  "If you are interested in hiring someone on a contract basis, please click the button below for more information or to proceed with the booking process.",
                  style: CustomTextStyles.f14W400(),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 140, top: 10, bottom: 25),
                child: InkWell(
                  highlightColor: AppColors.shimmerBase,
                  onTap: () {
                    //Get.to(() => AppointmentBookingScreen());
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Proceed for appointment",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: AppColors.secondaryColor,
                            decorationColor: AppColors.secondaryColor),
                      ),
                      const SizedBox(width: 13),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: AppColors.extraWhite,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.borderColor,
                              blurRadius: 2.0,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(ImagePath.arrowRight),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 10),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(
              title: "Book Now",
              onTap: () {
                if (service.name == "Window Cleaning") {
                  Get.to(() => WindowCleaningScreen(service: service));
                } else if (service.name == "House Cleaning") {
                  // Get.to(() => HouseCleaingScreen(
                  //       service: service,
                  //     ));
                } else if (service.name == "End of Lease Cleaning") {
                  // Get.to(() => LeaseCleaningScreen(
                  //       service: service,
                  //     ));
                } else if (service.name == "Carpet Cleaning") {
                  // Get.to(() => CarpetCleaningScreen(
                  //       service: service,
                  //     ));
                } else if (service.name == "Commercial Cleaning") {
                  //Get.to(() => CommercialCleaningScreen(service: service));
                } else if (service.name == "Builders Cleaning") {
                  //Get.to(() => BuildersCleaningScreen(service: service));
                } else if (service.name == "Lawn Cleaning") {
                  // Get.to(() => LawnCleaningScreen(
                  //       service: service,
                  //     ));
                } else if (service.name == "Rubbish Removal") {
                  // Get.to(() => RubbishRemovalScreen(
                  //       service: service,
                  //     ));
                } else {
                  CustomSnackBar.error(
                      title: "Error",
                      message: "Service not available for booking yet.");
                }
              }),
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Image.asset(
              image,
              height: 25,
              width: 25,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: CustomTextStyles.f14W400())
      ],
    );
  }
}
