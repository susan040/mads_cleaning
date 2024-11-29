import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';

class BookRubbishRemovalRepo {
  static Future<void> bookRubbishRemovalRepo(
      {required String fullName,
      required String email,
      required String phone,
      required String location,
      required String date,
      required String time,
      required String message,
      required String price,
      required String noOfTyres,
      required String noOfFurniture,
      required String noOfMattress,
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
        'price': price,
        'service_name': serviceName,
        'number_of_tyres': noOfTyres,
        'number_of_furniture': noOfFurniture,
        'number_of_mattress': noOfMattress,
        'message_box': message,
        'status': 'Pending'
      };
      http.Response response = await HttpRequestMadsCleaning.post(
          Uri.parse(Api.rubbishRemovalServiceUrl),
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
