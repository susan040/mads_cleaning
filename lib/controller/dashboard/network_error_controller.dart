import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkErrorController extends GetxController {
  var isOffline = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      isOffline.value =
          results.isEmpty || results.contains(ConnectivityResult.none);
    });
  }

  Future<void> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    isOffline.value = result == ConnectivityResult.none;
  }
}
