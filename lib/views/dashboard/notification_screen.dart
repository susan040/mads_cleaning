import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mads_cleaning/controller/dashboard/network_error_controller.dart';
import 'package:mads_cleaning/views/dashboard/network_error_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mads_cleaning/controller/dashboard/notification_screen_controller.dart';
import 'package:mads_cleaning/model/notification.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final c = Get.put(NotificationScreenController());
  final networkController = Get.put(NetworkErrorController());

  String formatDate(DateTime date) {
    final today = DateTime.now();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return "Today";
    } else if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.subtract(const Duration(days: 1)).day) {
      return "Yesterday";
    } else {
      return DateFormat('MMM dd, yyyy').format(date);
    }
  }

  Map<String, List<NotificationDetails>> groupNotifications(
      List<NotificationDetails> notifications) {
    final Map<String, List<NotificationDetails>> groupedNotifications = {};
    for (var notification in notifications) {
      final createdAt = notification.createdAt;
      if (createdAt != null) {
        final dateKey = formatDate(DateTime.parse(createdAt));
        groupedNotifications.putIfAbsent(dateKey, () => []).add(notification);
      }
    }
    return groupedNotifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          backgroundColor: AppColors.extraWhite,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text("Notification",
              style: CustomTextStyles.f14W700(color: AppColors.textColor)),
        ),
        body: Obx(() {
          if (networkController.isOffline.value) {
            return NetworkErrorScreen();
          }
          return RefreshIndicator(
            onRefresh: () async {
              c.allNotifications.clear();
              c.getAllNotifications();
            },
            child: Obx(() {
              if (c.loading.value) {
                return ShimmerNotificationList();
              } else if (c.allNotifications.isEmpty) {
                return Center(
                  child: Text(
                    "No Notification",
                    style: CustomTextStyles.f14W400(
                        color: AppColors.textGreyColor),
                  ),
                );
              } else {
                final groupedNotifications =
                    groupNotifications(c.allNotifications.toList());
                return ListView.builder(
                  itemCount: groupedNotifications.keys.length,
                  itemBuilder: (context, index) {
                    final dateKey = groupedNotifications.keys.toList()[index];
                    final notifications = groupedNotifications[dateKey]!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 10, bottom: 10),
                          child: Text(
                            dateKey,
                            style: CustomTextStyles.f14W600(),
                          ),
                        ),
                        ...notifications.map((notification) {
                          return NotificationWidget(
                              notificationDetails: notification);
                        }).toList(),
                      ],
                    );
                  },
                );
              }
            }),
          );
        }));
  }
}

class NotificationWidget extends StatelessWidget {
  NotificationWidget({
    super.key,
    required this.notificationDetails,
  });
  final NotificationDetails notificationDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding:
            const EdgeInsets.only(left: 14, right: 14, top: 13, bottom: 14),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.borderColor,
                blurRadius: 2.0,
                offset: Offset(1, 1),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Appointment",
                  style: CustomTextStyles.f14W400(color: AppColors.lGrey),
                ),
                Text(
                  notificationDetails.createdAt ?? "",
                  style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Text(
              "${notificationDetails.data?.message}",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerNotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: Get.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
