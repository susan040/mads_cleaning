import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mads_cleaning/controller/dashboard/history_screen_controller.dart';
import 'package:mads_cleaning/controller/dashboard/network_error_controller.dart';
import 'package:mads_cleaning/model/booking_details.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dashboard/booked_details_screen.dart';
import 'package:mads_cleaning/views/dashboard/network_error_screen.dart';

class HistoryScreen extends StatelessWidget {
  final c = Get.put(HistoryScreenController());
  final networkController = Get.put(NetworkErrorController());

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        title: Text(
          "All Booked Services",
          style: CustomTextStyles.f14W700(color: AppColors.textColor),
        ),
      ),
      body: Obx(() {
        if (networkController.isOffline.value) {
          return NetworkErrorScreen();
        }
        return RefreshIndicator(
          onRefresh: () async {
            c.bookingDetails.clear();
            c.getAllBookingDetails();
          },
          child: Obx(() => c.loading.value
              ? Center(child: CircularProgressIndicator())
              : c.bookingDetails.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagePath.noService,
                            height: 150,
                          ),
                          Text("No Services were booked",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.lGrey))
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: c.bookingDetails.length,
                      itemBuilder: (context, index) {
                        final booking = c.bookingDetails[index];
                        return ServiceBookedWidget(
                          bookingDetails: booking,
                        );
                      },
                    )),
        );
      }),
    );
  }
}

class ServiceBookedWidget extends StatelessWidget {
  final c = Get.put(HistoryScreenController());
  ServiceBookedWidget({
    super.key,
    required this.bookingDetails,
  });

  final BookingDetails bookingDetails;
  final Map<String, String> serviceImages = {
    'Window Cleaning': ImagePath.windowCleaning,
    'Carpet Cleaning': ImagePath.carpetCleaning,
    'Builders Cleaning': ImagePath.officeCleaning,
    'Lawn Cleaning': ImagePath.gardenCleaning,
    'End of Lease Cleaning': ImagePath.leaseCleaning,
    'House Cleaning': ImagePath.domesticCleaning,
    'Commercial Cleaning': ImagePath.commercialCleaning,
    'Rubbish Removal': ImagePath.rubbishRemoval,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        children: [
          if (bookingDetails.windowCleaningService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                bookingId: bookingDetails.id ?? 0,
                serviceName:
                    bookingDetails.windowCleaningService?.serviceName ?? "",
                serviceStatus:
                    bookingDetails.windowCleaningService?.status ?? "",
                serviceDate:
                    bookingDetails.windowCleaningService?.serviceDate ?? "",
                serviceTime:
                    bookingDetails.windowCleaningService?.serviceTime ??
                        "00:00:00",
                servicePrice: bookingDetails.windowCleaningService?.price ?? 0,
                location: bookingDetails.windowCleaningService?.location ?? "",
              ),
            ),
          if (bookingDetails.houseCleaningService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName:
                      bookingDetails.houseCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.houseCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.houseCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.houseCleaningService?.serviceTime ??
                          "00:00:00",
                  servicePrice: bookingDetails.houseCleaningService?.price ?? 0,
                  location:
                      bookingDetails.windowCleaningService?.location ?? ""),
            ),
          if (bookingDetails.leaseCleaningService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName:
                      bookingDetails.leaseCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.leaseCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.leaseCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.leaseCleaningService?.serviceTime ??
                          "00:00:00",
                  servicePrice: bookingDetails.leaseCleaningService?.price ?? 0,
                  location:
                      bookingDetails.windowCleaningService?.location ?? ""),
            ),
          if (bookingDetails.commercialCleaningService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName:
                      bookingDetails.commercialCleaningService?.serviceName ??
                          "",
                  serviceStatus:
                      bookingDetails.commercialCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.commercialCleaningService?.serviceDate ??
                          "",
                  serviceTime:
                      bookingDetails.commercialCleaningService?.serviceTime ??
                          "00:00:00",
                  servicePrice:
                      bookingDetails.commercialCleaningService?.price ?? 0,
                  location:
                      bookingDetails.commercialCleaningService?.location ?? ""),
            ),
          if (bookingDetails.builderCleaningService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName:
                      bookingDetails.builderCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.builderCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.builderCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.builderCleaningService?.serviceTime ??
                          "00:00:00",
                  servicePrice:
                      bookingDetails.builderCleaningService?.price ?? 0,
                  location:
                      bookingDetails.builderCleaningService?.location ?? ""),
            ),
          if (bookingDetails.lawnService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName: bookingDetails.lawnService?.serviceName ?? "",
                  serviceStatus: bookingDetails.lawnService?.status ?? "",
                  serviceDate: bookingDetails.lawnService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.lawnService?.serviceTime ?? "00:00:00",
                  servicePrice: bookingDetails.lawnService?.price ?? 0,
                  location: bookingDetails.lawnService?.location ?? ""),
            ),
          if (bookingDetails.rubbishRemovalService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName:
                      bookingDetails.rubbishRemovalService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.rubbishRemovalService?.status ?? "",
                  serviceDate:
                      bookingDetails.rubbishRemovalService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.rubbishRemovalService?.serviceTime ??
                          "00:00:00",
                  servicePrice:
                      bookingDetails.rubbishRemovalService?.price ?? 0,
                  location:
                      bookingDetails.rubbishRemovalService?.location ?? ""),
            ),
          if (bookingDetails.carpetCleaningService != null)
            InkWell(
              onTap: () {
                Get.to(
                    () => BookedDetailsScreen(bookingDetails: bookingDetails));
              },
              child: buildServiceWidget(
                  bookingId: bookingDetails.id ?? 0,
                  serviceName:
                      bookingDetails.carpetCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.carpetCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.carpetCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.carpetCleaningService?.serviceTime ??
                          "00:00:00",
                  servicePrice:
                      bookingDetails.carpetCleaningService?.price ?? 0,
                  location:
                      bookingDetails.carpetCleaningService?.location ?? ""),
            ),
        ],
      ),
    );
  }

  Widget buildServiceWidget(
      {required String serviceName,
      required int bookingId,
      required String serviceStatus,
      required String serviceDate,
      required String serviceTime,
      required int servicePrice,
      required String location}) {
    Color statusColor;

    switch (serviceStatus) {
      case "Cancelled":
        statusColor = AppColors.rejected;
        break;
      case "Pending":
        statusColor = AppColors.skyBlue;
        break;
      case "Approved":
        statusColor = AppColors.accepted;
        break;
      default:
        statusColor = AppColors.lGrey;
    }

    // Format the service time
    DateTime currentDate = DateTime.now();
    String fullDateTimeString =
        '${currentDate.toIso8601String().split('T')[0]}T$serviceTime';
    DateTime serviceTimeFormatted = DateTime.parse(fullDateTimeString);
    DateFormat timeFormat = DateFormat.jm();
    String formattedTime = timeFormat.format(serviceTimeFormatted);

    return Slidable(
      key: Key(serviceName),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              c.showMyDialog(context, bookingId);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Container(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
          height: 135,
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
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booked Date",
                    style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                  ),
                  Container(
                    height: 18,
                    width: 72,
                    decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(serviceStatus,
                          style: CustomTextStyles.f10W400(
                              color: AppColors.extraWhite)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(children: [
                SvgPicture.asset(ImagePath.time),
                const SizedBox(width: 6),
                Text(
                  '$serviceDate  $formattedTime',
                  style: CustomTextStyles.f12W400(),
                )
              ]),
              const Divider(thickness: 0.3, color: AppColors.lGrey),
              Row(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      serviceImages[serviceName] ?? ImagePath.blankImage,
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(serviceName, style: CustomTextStyles.f16W700()),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImagePath.location,
                            height: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(location,
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.lGrey))
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Total: ", style: CustomTextStyles.f14W400()),
                          Text("\$${servicePrice.toString()}",
                              style: CustomTextStyles.f14W600(
                                  color: AppColors.secondaryColor)),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
