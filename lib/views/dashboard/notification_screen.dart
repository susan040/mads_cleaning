import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
        title: Text("Notification",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today", style: CustomTextStyles.f16W700()),
              const SizedBox(height: 10),
              const NotificationWidget(time: "2 mins", text: "booked"),
              const NotificationWidget(time: "3h", text: "cancelled"),
              Text("25th Aug", style: CustomTextStyles.f16W700()),
              const SizedBox(height: 10),
              const NotificationWidget(time: "2 mins", text: "booked"),
              const NotificationWidget(time: "3h", text: "cancelled"),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.time,
    required this.text,
  });
  final String time;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.only(left: 14, right: 14, top: 13, bottom: 10),
      height: 70,
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Appointment",
                style: CustomTextStyles.f14W400(color: AppColors.lGrey),
              ),
              Text(
                "$time ago",
                style: CustomTextStyles.f14W400(color: AppColors.lGrey),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            "Your appointment is $text.",
            style: CustomTextStyles.f14W500(),
          )
        ],
      ),
    );
  }
}
