import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/api.dart';

class AllServiceRepo {
  static Future<void> getAllServices({
    required Function(List<Services> categories) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value!.token.toString();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(Api.getServicesUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      //log("Service ${data.toString()}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<Services> services = serviceFromJson(data["Services"]);

        //print(serviceFromJson(data["Services"]).toString());
        onSuccess(services);
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
