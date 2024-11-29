import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/model/notification.dart';
import 'package:mads_cleaning/utils/api.dart';

class AllNotificationRepo {
  static Future<void> getAllNotification({
    required Function(List<NotificationDetails> notifications) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value!.token.toString();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(Api.getNotificationUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      log("Notification ${data.toString()}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<NotificationDetails> notification =
            notificationFromJson(data["data"]);
        onSuccess(notification);
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
