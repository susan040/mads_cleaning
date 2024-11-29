import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/model/booking_details.dart';
import 'package:mads_cleaning/utils/api.dart';

class BookingDetailsRepo {
  static Future<void> getBookingDetails({
    required Function(List<BookingDetails> bookings) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value!.token.toString();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      log("TOken:${token}");
      var url = Uri.parse(Api.bookingUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      log("Booking ${data.toString()}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<BookingDetails> bookingDetails =
            bookingDetailsFromJson(data["data"]);

        print(bookingDetailsFromJson(data["data"]).toString());
        onSuccess(bookingDetails);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}
