import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class HistoryScreenController extends GetxController {
  //RxList<WindowCleaning> windowCleaning = <WindowCleaning>[].obs;

  final loading = RxBool(false);
  @override
  void onInit() {
    //getAllBookedWindowCleaning();
    super.onInit();
  }

  // getAllBookedWindowCleaning() async {
  //   loading.value = true;
  //   await GetBookedWindowCleaningRepo.getbookedWindowCleaningDetails(
  //       onSuccess: (booked) {
  //     loading.value = false;
  //     log("window services: ${booked.length}");
  //     windowCleaning.addAll(booked);
  //   }, onError: ((message) {
  //     loading.value = false;
  //     CustomSnackBar.error(title: "Services", message: message);
  //   }));
  // }

  void showMyDialog(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 7),
          title: Text(
            'Are your sure to delete?',
            style: CustomTextStyles.f16W700(),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Your booked services will be delete from the list",
            style: CustomTextStyles.f12W400(color: AppColors.lGrey),
            textAlign: TextAlign.center,
          ),
          actions: [
            const SizedBox(height: 5),
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
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}
