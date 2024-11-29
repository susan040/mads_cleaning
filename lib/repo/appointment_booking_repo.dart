import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mads_cleaning/utils/api.dart';
import 'package:mads_cleaning/utils/http_request.dart';

class AppointmentBookingRepo {
  static Future<void> appointmentBookingRepo({
    required String fullName,
    required String email,
    required String phone,
    required String location,
    required String message,
    required String date,
    required String handymanJobs,
    required String plumbers,
    required String electricians,
    required String builders,
    required String realEstateAgents,
    required String locksmiths,
    required String landscapers,
    required String treeLoopers,
    required String painters,
    required String glassRepairers,
    required String blindsAndCurtainFitters,
    required String flooring,
    required String carpetLayers,
    required String tilers,
    required String eventPlanners,
    required String photographers,
    required String cabinetMaker,
    required String pestControl,
    required String removalists,
    required String cctvInstaller,
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
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
        'message_box': message,
        'service_date': date,
        'location': location,
        'handyman_jobs': handymanJobs,
        'plumbers': plumbers,
        'electricians': electricians,
        'builders': builders,
        'real_estate_agents': realEstateAgents,
        'locksmiths': locksmiths,
        'landscapers': landscapers,
        'tree_loopers': treeLoopers,
        'painters': painters,
        'glass_repairers': glassRepairers,
        'blinds_and_curtain_fitters': blindsAndCurtainFitters,
        'flooring': flooring,
        'carpet_layers': carpetLayers,
        'tilers': tilers,
        'event_planners': eventPlanners,
        'photographers': photographers,
        'cabinet_maker': cabinetMaker,
        'pest_control': pestControl,
        'removalists': removalists,
        'cctv_installer': cctvInstaller,
      };
      http.Response response = await HttpRequestMadsCleaning.post(
          Uri.parse(Api.appointmentBookingUrl),
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
