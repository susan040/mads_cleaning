import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/model/users.dart';
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';

class EditProfileRepo {
  static Future<void> editProfile({
    required String name,
    required String address,
    required String phoneNumber,
    File? image,
    required Function(Users user) onSuccess,
    required Function(String message) onError,
  }) async {
    var coreController = Get.find<CoreController>();
    var token = coreController.currentUser.value!.token.toString();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(Api.editProfileUrl);
    http.MultipartRequest request = http.MultipartRequest("POST", url);
    request.headers.addAll((headers));
    request.fields['name'] = name;
    request.fields['address'] = address;
    request.fields['phone'] = phoneNumber;
    if (image != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          "avatar",
          await image.readAsBytes(),
          filename: "user",
          contentType: MediaType("image", "*"),
        ),
      );
    }
    http.StreamedResponse response =
        await HttpRequestMadsCleaning.multiPart(request);
    var responseData = await response.stream.bytesToString();
    var data = jsonDecode(responseData);
    log("User data:$data");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Users user = Users.fromJson(data["data"]);
      onSuccess(user);
    } else {
      onError(data['message']);
    }
  }
}
