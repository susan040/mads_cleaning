import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class HistoryScreenController extends GetxController {
  void showMyDialog(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          title: Text('Are you sure you want to cancel?',
              style: CustomTextStyles.f16W700()),
          content: Text(
            "Your booked service will be cancelled",
            style: CustomTextStyles.f12W400(color: AppColors.lGrey),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 44,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                      color: AppColors.extraWhite,
                      border: Border.all(width: 0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text('No', style: CustomTextStyles.f14W400())),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 44,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                      color: AppColors.rejected,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('Yes',
                          style: CustomTextStyles.f14W400(
                              color: AppColors.extraWhite)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
