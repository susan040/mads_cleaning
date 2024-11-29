import 'package:flutter/material.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:shimmer/shimmer.dart';

class HomeNetworkErrorWidget extends StatelessWidget {
  const HomeNetworkErrorWidget({super.key});

  Future<bool> checkNetworkConnection() async {
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkNetworkConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              backgroundColor: AppColors.extraWhite,
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: SingleChildScrollView(
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 5),
                          width: 120,
                          height: 50,
                          color: Colors.grey[300],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
                      width: 100,
                      height: 30,
                      color: Colors.grey[300],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
                      height: 165,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              )))));
        } else if (snapshot.hasError || snapshot.data == false) {
          return Scaffold(
            backgroundColor: AppColors.extraWhite,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImagePath.networkError,
                        height: 170, width: 170),
                    const SizedBox(height: 14),
                    Text("Network Connection Error",
                        style: CustomTextStyles.f14W600()),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: 252,
                      child: Text(
                        "Please check your internet connection and try again",
                        style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text("Connected!")),
          );
        }
      },
    );
  }
}
