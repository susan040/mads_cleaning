import 'dart:developer';
import 'package:get/get.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/repo/all_service_repo.dart';
import 'package:mads_cleaning/utils/custom_snackbar.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class AllSerivcesController extends GetxController {
  RxList<Services> allServices = <Services>[].obs;
  Map<String, String> serviceImages = {
    "Window Cleaning": ImagePath.windowCleaning,
    "Carpet Cleaning": ImagePath.carpetCleaning,
    "Office Cleaning": ImagePath.officeCleaning,
    "Graden Cleaning": ImagePath.gardenCleaning,
    "Lease Cleaning": ImagePath.leaseCleaning,
    "Domestic Cleaning": ImagePath.domesticCleaning,
    "Commercial Cleaning": ImagePath.commercialCleaning,
  };

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
      CustomSnackBar.error(title: "Services", message: message);
    }));
  }
}
