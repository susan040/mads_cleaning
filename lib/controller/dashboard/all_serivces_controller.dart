import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/repo/all_service_repo.dart';

class AllSerivcesController extends GetxController {
  RxList<Services> allServices = <Services>[].obs;

  final loading = RxBool(false);
  @override
  void onInit() {
    getAllServices();
    super.onInit();
  }

  getAllServices() async {
    loading.value = true;
    await AllServiceRepo.getAllServices(onSuccess: (services) {
      loading.value = false;
      log("services: ${services.length}");
      allServices.addAll(services);
    }, onError: ((message) {
      loading.value = false;
      //CustomSnackBar.error(title: "Services", message: message);
    }));
  }
}
