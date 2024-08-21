import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/dash_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class DashScreen extends StatelessWidget {
  final c = Get.put(DashScreenController());
  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => c.pages[c.currentIndex.value]),
        bottomNavigationBar: Obx(() => Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor,
                  blurRadius: 7.0,
                  offset: Offset(5, 5),
                )
              ]),
              child: BottomNavigationBar(
                elevation: 3,
                backgroundColor: AppColors.extraWhite,
                selectedItemColor: AppColors.primaryColor,
                unselectedIconTheme: const IconThemeData(color: Colors.white),
                unselectedItemColor: AppColors.unselectedGrey,
                type: BottomNavigationBarType.fixed,
                currentIndex: c.currentIndex.value,
                onTap: c.onItemTapped,
                iconSize: 26,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.home,
                        color: c.currentIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 21,
                      ),
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.history,
                        color: c.currentIndex.value == 1
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 21,
                      ),
                    ),
                    label: "History",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.profile,
                        color: c.currentIndex.value == 2
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 20,
                        //width: 17,
                      ),
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            )));
  }
}
