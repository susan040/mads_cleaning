import 'dart:convert';
import 'dart:developer';
import 'package:mads_cleaning/model/users.dart';
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';
import 'package:http/http.dart' as http;

class RegisterRepo {
  static Future<void> register({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required Function(Users user) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
      http.Response response = await HttpRequestMadsCleaning.post(
          Uri.parse(Api.registerUrl),
          headers: headers,
          body: body);
      dynamic data = jsonDecode(response.body);
      //log(data);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Map the response data to the Users model
        Users user = Users.fromJson(data['data']);
        log(Users.fromJson(data["data"]).toString());
        onSuccess(user); // Pass the user object
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
