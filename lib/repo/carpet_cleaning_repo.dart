import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';

class BookCarpetCleaningRepo {
  static Future<void> bookCarpetCleaningRepo(
      {required String fullName,
      required String email,
      required String phone,
      required String location,
      required String date,
      required String time,
      required String message,
      required String carpetSteamCleaningUnit,
      required String carpetSteamCleaningArea,
      required String carpetStainCleaningUnit,
      required String carpetStainCleaningArea,
      required String price,
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
        'carpet_steam_cleaning_unit': carpetSteamCleaningUnit,
        'carpet_steam_cleaning_area': carpetSteamCleaningArea,
        'carpet_stain_cleaning_unit': carpetStainCleaningUnit,
        'carpet_stain_cleaning_area': carpetStainCleaningArea,
        'message': message,
        'price': price
      };
      http.Response response = await HttpRequestMadsCleaning.post(
          Uri.parse(Api.carpetCleaningServiceUrl),
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
