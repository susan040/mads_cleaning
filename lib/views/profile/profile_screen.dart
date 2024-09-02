import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dashboard/about_us_screen.dart';
import 'package:mads_cleaning/views/auth/login_screen.dart';
import 'package:mads_cleaning/views/dashboard/change_password_screen.dart';
import 'package:mads_cleaning/views/dashboard/faq_screen.dart';
import 'package:mads_cleaning/views/dashboard/notification_screen.dart';
import 'package:mads_cleaning/views/profile/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        title: Text(
          "Profile",
          style: CustomTextStyles.f14W700(color: AppColors.textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 28),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                    height: 77,
                    width: 77,
                    imageUrl:
                        "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg",
                    errorWidget: (context, url, error) => Image.network(
                      "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                      height: 77,
                      width: 77,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    Text("Hungry Sharma", style: CustomTextStyles.f16W700()),
                    const SizedBox(height: 2),
                    Text("example@gmail.com",
                        style: CustomTextStyles.f14W500()),
                    const SizedBox(height: 2),
                    Text("+613489534340",
                        style:
                            CustomTextStyles.f14W400(color: AppColors.lGrey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 7),
            Padding(
                padding: const EdgeInsets.only(top: 35),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => EditProfileScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(ImagePath.myDetails),
                          const SizedBox(width: 14),
                          Text("My Details", style: CustomTextStyles.f14W600()),
                        ],
                      ),
                      SvgPicture.asset(ImagePath.arrow)
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Get.to(() => const NotificationScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.notification),
                        const SizedBox(width: 14),
                        Text("Notifications",
                            style: CustomTextStyles.f14W600()),
                        const SizedBox(width: 8),
                        Container(
                          height: 18.5,
                          width: 18.5,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "5",
                              style: CustomTextStyles.f10W400(
                                  color: AppColors.extraWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(ImagePath.arrow)
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 35),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => const FaqScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(ImagePath.faq),
                          const SizedBox(width: 14),
                          Text("FAQ", style: CustomTextStyles.f14W600()),
                        ],
                      ),
                      SvgPicture.asset(ImagePath.arrow)
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 35),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => const AboutUsScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(ImagePath.aboutUs),
                          const SizedBox(width: 14),
                          Text("About Us", style: CustomTextStyles.f14W600()),
                        ],
                      ),
                      SvgPicture.asset(ImagePath.arrow)
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 35),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(ImagePath.changePassword),
                          const SizedBox(width: 14),
                          Text("Change Password",
                              style: CustomTextStyles.f14W600()),
                        ],
                      ),
                      SvgPicture.asset(ImagePath.arrow)
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 35),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(ImagePath.logOut,
                          color: AppColors.rejected),
                      const SizedBox(width: 14),
                      Text("Logout",
                          style: CustomTextStyles.f14W600(
                              color: AppColors.rejected)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
