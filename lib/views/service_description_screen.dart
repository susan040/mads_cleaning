import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/widgets/custom/elevated_button.dart';

class ServiceDescriptionScreen extends StatelessWidget {
  const ServiceDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ClipRRect(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2.75,
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
              Positioned(
                top: 30,
                left: 14,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.textColor,
                    size: 30,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
              child: Text("Window Cleaning Services",
                  style: CustomTextStyles.f18W700()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
              child: Text("\$50/day",
                  style: CustomTextStyles.f16W700(
                      color: AppColors.secondaryColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
              child: Text(
                "We are ruling the cleaning industry for a decade now, and have been the favorite of our clients since then. Be it a monthly cleaning task or once a year task, we are a professional and we know how to execute both. We serve with the most professional services and will be at your doorstep whenever you need our help. We are the most renowned window cleaning services for many years serving our clients with the best cleaning services. Our window cleaning services are the best in the industry, and we try to deliver our best window cleaning services at the most affordable rates. Our well-trained expert team of window cleaners has made us stand among the top window cleaning company.",
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        style:
                            CustomTextStyles.f12W400(color: AppColors.lGrey)),
                    const SizedBox(height: 2),
                    Text("Saturday: 09:00 AM - 07:00 PM",
                        style:
                            CustomTextStyles.f12W400(color: AppColors.lGrey)),
                    const SizedBox(height: 2),
                    Text("Sunday: 09:00 AM - 05:00 PM",
                        style:
                            CustomTextStyles.f12W400(color: AppColors.lGrey)),
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
                    "34 Amy Street, West Moonah , TAS 7009",
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
                  left: 18, right: 18, top: 10, bottom: 25),
              child: InkWell(
                onTap: () {},
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
                      height: 22,
                      width: 22,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(title: "Book Now", onTap: () {}),
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
