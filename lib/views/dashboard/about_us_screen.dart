import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
          title: Text("About Us",
              style: CustomTextStyles.f14W700(color: AppColors.textColor)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 18, right: 16, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Residential & Commercial Cleaning Services",
                    style: CustomTextStyles.f16W700()),
                const SizedBox(height: 8),
                Text(
                  "Our goal is to serve with the best we can and sees the smile and satisfaction when we leaving after completing the job. As we all know the importance of money but we also know the time we have now will not come back again. So, let us do the work for you and you make the moments out of life. We help people to keep their house or working area clean and hygienic. At Mads Cleaning, we decide to do in style. We are the right team with right approach and will definitely provide an idle solution for your issues with cleaning. As an experienced cleaning team, we make sure to serve our customers with an unforgettable sweet cleaning experience.",
                  style: CustomTextStyles.f14W400(),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Text("Company Mission", style: CustomTextStyles.f16W700()),
                const SizedBox(height: 8),
                Text(
                  "At Mads Cleaning and Gardening, our mission is to provide exceptional cleaning and gardening services to the residents and businesses of Hobart. We aim to create clean, beautiful, and sustainable living and working environments while ensuring customer satisfaction and exceeding expectations.",
                  style: CustomTextStyles.f14W400(),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Text("Our Vision", style: CustomTextStyles.f16W700()),
                const SizedBox(height: 8),
                Text(
                  "Our vision is to be the leading cleaning and gardening service provider in Hobart, known for our professionalism, reliability, and commitment to excellence. We strive to enhance the quality of life for our clients by delivering innovative solutions, fostering a clean and green environment, and contributing to the overall well-being of the community.",
                  style: CustomTextStyles.f14W400(),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ));
  }
}
