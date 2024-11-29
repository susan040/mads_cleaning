import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';

class BookLeaseCleaningRepo {
  static Future<void> bookLeaseCleaningRepo(
      {required String fullName,
      required String email,
      required String phone,
      required String location,
      required String date,
      required String time,
      required String noOfBedroom,
      required String noOfBathroom,
      required String message,
      required String ovenCleaning,
      required String stoveCleaning,
      required String noOfWallsToClean,
      required String carpetSteamCleaningUnit,
      required String carpetSteamCleaningArea,
      required String price,
      required String windowCleaning,
      required String serviceName,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value!.token.toString();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var body = {
        'name': fullName,
        'email': email,
        'phone': phone,
        'location': location,
        'service_date': date,
        'service_time': time,
        'service_name': serviceName,
        'number_of_bedrooms': noOfBedroom,
        'number_of_bathrooms': noOfBathroom,
        'oven_cleaning': ovenCleaning,
        'stove_cleaning': stoveCleaning,
        'number_of_walls_cleaned': noOfWallsToClean,
        'carpet_steam_cleaning_unit': carpetSteamCleaningUnit,
        'carpet_steam_cleaning_area': carpetSteamCleaningArea,
        'window_cleaning': windowCleaning,
        'message': message,
        'price': price
      };
      http.Response response = await HttpRequestMadsCleaning.post(
          Uri.parse(Api.leaseCleaningServiceUrl),
          headers: headers,
          body: body);

      log(json.encode(body));
      log(response.body);

      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
