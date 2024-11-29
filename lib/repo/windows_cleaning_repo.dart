import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';

class WindowsCleaningBookingRepo {
  static Future<void> windowsCleaningBookRepo(
      {required String fullName,
      required String email,
      required String phone,
      required String location,
      required String noOfWindows,
      required String noOfStory,
      required String message,
      required String type,
      required String date,
      required String time,
      required String price,
      required String serviceName,
      required String windowsTrackFrame,
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
        'number_of_windows': noOfWindows,
        'number_of_story': noOfStory,
        'message': message,
        'service_date': date,
        'service_time': time,
        'service_name': serviceName,
        'type': type,
        'windows_track_frame': windowsTrackFrame,
        'location': location,
        'price': price
      };
      http.Response response = await HttpRequestMadsCleaning.post(
          Uri.parse(Api.windowsCleaningServicesUrl),
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
