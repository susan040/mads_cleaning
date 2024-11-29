import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/model/booking_details.dart';
import 'package:mads_cleaning/repo/booking_details_repo.dart';
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:http/http.dart' as http;

class HistoryScreenController extends GetxController {
  RxList<BookingDetails> bookingDetails = <BookingDetails>[].obs;

  final loading = RxBool(false);
  @override
  void onInit() {
    super.onInit();
    getAllBookingDetails();
  }

  void getAllBookingDetails() async {
    loading.value = true;
    await BookingDetailsRepo.getBookingDetails(
      onSuccess: (fetchedBookings) {
        loading.value = false;
        log("Booking count: ${fetchedBookings.length}");
        bookingDetails.addAll(fetchedBookings);
      },
      onError: (message) {
        loading.value = false;
        //CustomSnackBar.error(title: "Booking Details", message: message);
      },
    );
  }

  void showMyDialog(BuildContext context, int bookingId) {
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
                    deleteBooking(bookingId);
                    Navigator.of(context).pop();
                    bookingDetails.clear();
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

  Future<void> deleteBooking(int bookingId) async {
    final url = Uri.parse('${Api.deleteBookingUrl}/$bookingId');
    var coreController = Get.find<CoreController>();
    var token = coreController.currentUser.value!.token.toString();
    try {
      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        bookingDetails.removeWhere((booking) => booking.id == bookingId);
        CustomSnackBar.success(
          title: "Booking",
          message: "Booking Delete successful",
        );
        log("Booking Delete successful");
      } else {
        CustomSnackBar.error(
          title: "Deletion Failed",
          message: "Failed to delete booking: ${response.statusCode}",
        );
      }
    } catch (e, s) {
      print('Error: $e');
      log(e.toString());
      log(s.toString());
    }
  }
}
