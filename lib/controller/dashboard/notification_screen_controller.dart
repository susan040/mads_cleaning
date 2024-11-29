import 'package:get/get.dart';
import 'package:mads_cleaning/model/notification.dart';
import 'package:mads_cleaning/repo/notification_repo.dart';

class NotificationScreenController extends GetxController {
  RxList<NotificationDetails> allNotifications = <NotificationDetails>[].obs;
  final loading = RxBool(false);

  @override
  void onInit() {
    getAllNotifications();
    super.onInit();
  }

  getAllNotifications() async {
    loading.value = true;
    await AllNotificationRepo.getAllNotification(onSuccess: (notifications) {
      loading.value = false;
      allNotifications.addAll(notifications);
    }, onError: (message) {
      loading.value = false;
      // CustomSnackBar.error(title: "Notification", message: message);
    });
  }
}
