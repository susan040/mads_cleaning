import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mads_cleaning/controller/dashboard/booking_details_controller.dart';

import 'package:mads_cleaning/model/booking_details.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/widgets/house_cleaning_widget.dart';
import 'package:mads_cleaning/widgets/lawn_cleaning_widget.dart';
import 'package:mads_cleaning/widgets/rubbish_removal_widget.dart';
import 'package:mads_cleaning/widgets/window_cleaning_widget.dart';


class BookedDetailsScreen extends StatelessWidget {
  BookedDetailsScreen({super.key, required this.bookingDetails});
  final c = Get.put(BookingDetailsController());
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
        title: Text("Booked Details",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (bookingDetails.windowCleaningService?.serviceName ==
                "Window Cleaning")
              buildWindowCleaningWidget(
                serviceName:
                    bookingDetails.windowCleaningService?.serviceName ?? "",
                serviceStatus:
                    bookingDetails.windowCleaningService?.status ?? "",
                serviceDate:
                    bookingDetails.windowCleaningService?.serviceDate ?? "",
                serviceTime:
                    bookingDetails.windowCleaningService?.serviceTime ?? "",
                servicePrice: bookingDetails.windowCleaningService?.price ?? 0,
                userName: bookingDetails.windowCleaningService?.name ?? "",
                email: bookingDetails.windowCleaningService?.email ?? "",
                location: bookingDetails.windowCleaningService?.location ?? "",
                numberOfWindows:
                    bookingDetails.windowCleaningService?.numberOfWindows ?? 0,
                numberOfStory:
                    bookingDetails.windowCleaningService?.numberOfStory ?? 0,
                windowsTrackFrame:
                    bookingDetails.windowCleaningService?.windowsTrackFrame ??
                        "",
              )
            else if (bookingDetails.carpetCleaningService?.serviceName ==
                "Carpet Cleaning")
              buildCarpetCleaningWidget(
                serviceName:
                    bookingDetails.carpetCleaningService?.serviceName ?? "",
                serviceStatus:
                    bookingDetails.carpetCleaningService?.status ?? "",
                serviceDate:
                    bookingDetails.carpetCleaningService?.serviceDate ?? "",
                serviceTime:
                    bookingDetails.carpetCleaningService?.serviceTime ?? "",
                servicePrice: bookingDetails.carpetCleaningService?.price ?? 0,
                userName: bookingDetails.carpetCleaningService?.name ?? "",
                email: bookingDetails.carpetCleaningService?.email ?? "",
                location: bookingDetails.carpetCleaningService?.location ?? "",
                carpetSteamCleaningArea: bookingDetails
                        .carpetCleaningService?.carpetSteamCleaningArea ??
                    0,
                carpetSteamCleaningUnit: bookingDetails
                        .carpetCleaningService?.carpetSteamCleaningUnit ??
                    '',
                carpetStainCleaningArea: bookingDetails
                        .carpetCleaningService?.carpetStainCleaningArea ??
                    0,
                carpetStainCleaningUnit: bookingDetails
                        .carpetCleaningService?.carpetStainCleaningUnit ??
                    "",
              )
            else if (bookingDetails.houseCleaningService?.serviceName ==
                "House Cleaning")
              buildHouseCleaningWidget(
                  serviceName:
                      bookingDetails.houseCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.houseCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.houseCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.houseCleaningService?.serviceTime ?? "",
                  servicePrice: bookingDetails.houseCleaningService?.price ?? 0,
                  userName: bookingDetails.houseCleaningService?.name ?? "",
                  email: bookingDetails.houseCleaningService?.email ?? "",
                  numberOfBedroom:
                      bookingDetails.houseCleaningService?.numberOfBedroom ?? 0,
                  numberOfBathroom:
                      bookingDetails.houseCleaningService?.numberOfBathroom ??
                          0,
                  numberOfStory:
                      bookingDetails.houseCleaningService?.numberOfStory ?? 0,
                  frequency:
                      bookingDetails.houseCleaningService?.frequency ?? "",
                  location: bookingDetails.houseCleaningService?.location ?? "")
            else if (bookingDetails.builderCleaningService?.serviceName ==
                "Builders Cleaning")
              buildBuilderCleaningWidget(
                  serviceName:
                      bookingDetails.builderCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.builderCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.builderCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.builderCleaningService?.serviceTime ?? "",
                  servicePrice:
                      bookingDetails.builderCleaningService?.price ?? 0,
                  userName: bookingDetails.builderCleaningService?.name ?? "",
                  email: bookingDetails.builderCleaningService?.email ?? "",
                  location:
                      bookingDetails.builderCleaningService?.location ?? "",
                  typeOfCommercialSpace: bookingDetails
                          .builderCleaningService?.typeOfCommercialSpace ??
                      "",
                  siteVisitDate:
                      bookingDetails.builderCleaningService?.siteVisitDate ??
                          "")
            else if (bookingDetails.commercialCleaningService?.serviceName ==
                "Commercial Cleaning")
              buildBuilderCleaningWidget(
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
                          "",
                  servicePrice:
                      bookingDetails.commercialCleaningService?.price ?? 0,
                  userName:
                      bookingDetails.commercialCleaningService?.name ?? "",
                  email: bookingDetails.commercialCleaningService?.email ?? "",
                  location:
                      bookingDetails.commercialCleaningService?.location ?? "",
                  typeOfCommercialSpace: bookingDetails
                          .commercialCleaningService?.typeOfCommercialSpace ??
                      "",
                  siteVisitDate:
                      bookingDetails.commercialCleaningService?.siteVisitDate ??
                          "")
            else if (bookingDetails.lawnService?.serviceName == "Lawn Cleaning")
              buildLawnCleaningWidget(
                  serviceName: bookingDetails.lawnService?.serviceName ?? "",
                  serviceStatus: bookingDetails.lawnService?.status ?? "",
                  serviceDate: bookingDetails.lawnService?.serviceDate ?? "",
                  serviceTime: bookingDetails.lawnService?.serviceTime ?? "",
                  servicePrice: bookingDetails.lawnService?.price ?? 0,
                  userName: bookingDetails.lawnService?.name ?? "",
                  email: bookingDetails.lawnService?.email ?? "",
                  typeOfLawnService:
                      bookingDetails.lawnService?.typeOfLawnService ?? "",
                  location: bookingDetails.lawnService?.location ?? "")
            else if (bookingDetails.leaseCleaningService?.serviceName ==
                "End of Lease Cleaning")
              buildLeaseCleaningWidget(
                  serviceName:
                      bookingDetails.leaseCleaningService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.leaseCleaningService?.status ?? "",
                  serviceDate:
                      bookingDetails.leaseCleaningService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.leaseCleaningService?.serviceTime ?? "",
                  servicePrice: bookingDetails.leaseCleaningService?.price ?? 0,
                  userName: bookingDetails.leaseCleaningService?.name ?? "",
                  email: bookingDetails.leaseCleaningService?.email ?? "",
                  numberOfBedrooms:
                      bookingDetails.leaseCleaningService?.numberOfBedrooms ??
                          0,
                  numberOfBathrooms:
                      bookingDetails.leaseCleaningService?.numberOfBathrooms ??
                          0,
                  windowCleaning:
                      bookingDetails.leaseCleaningService?.windowCleaning ?? "",
                  ovenCleaning:
                      bookingDetails.leaseCleaningService?.ovenCleaning ?? 0,
                  stoveCleaning:
                      bookingDetails.leaseCleaningService?.stoveCleaning ?? 0,
                  numberOfWallsCleaned: bookingDetails
                          .leaseCleaningService?.numberOfWallsCleaned ??
                      0,
                  carpetSteamCleaningArea: bookingDetails
                          .leaseCleaningService?.carpetSteamCleaningArea ??
                      "",
                  carpetSteamCleaningUnit: bookingDetails
                          .leaseCleaningService?.carpetSteamCleaningUnit ??
                      "",
                  location: bookingDetails.leaseCleaningService?.location ?? "")
            else if (bookingDetails.rubbishRemovalService?.serviceName ==
                "Rubbish Removal")
              buildRubbishRemovalWidget(
                  serviceName:
                      bookingDetails.rubbishRemovalService?.serviceName ?? "",
                  serviceStatus:
                      bookingDetails.rubbishRemovalService?.status ?? "",
                  serviceDate:
                      bookingDetails.rubbishRemovalService?.serviceDate ?? "",
                  serviceTime:
                      bookingDetails.rubbishRemovalService?.serviceTime ?? "",
                  servicePrice:
                      bookingDetails.rubbishRemovalService?.price ?? 0,
                  userName: bookingDetails.rubbishRemovalService?.name ?? "",
                  email: bookingDetails.rubbishRemovalService?.email ?? "",
                  numberOfTyres:
                      bookingDetails.rubbishRemovalService?.numberOfTyres ?? 0,
                  numberOfFurniture:
                      bookingDetails.rubbishRemovalService?.numberOfFurniture ??
                          0,
                  numberOfMattress:
                      bookingDetails.rubbishRemovalService?.numberOfMattress ??
                          0,
                  location:
                      bookingDetails.rubbishRemovalService?.location ?? "")
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          c.showMyDialog(context);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.rejected,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text("Cancel",
                  style:
                      CustomTextStyles.f14W600(color: AppColors.extraWhite))),
        ),
      ),
    );
  }

  Widget buildCarpetCleaningWidget(
      {required String serviceName,
      required String serviceStatus,
      required String serviceDate,
      required String serviceTime,
      required int servicePrice,
      required String userName,
      required String email,
      required int carpetSteamCleaningArea,
      required String carpetSteamCleaningUnit,
      required int carpetStainCleaningArea,
      required String carpetStainCleaningUnit,
      required String location}) {
    DateTime currentDate = DateTime.now();
    String fullDateTimeString =
        '${currentDate.toIso8601String().split('T')[0]}T$serviceTime';
    DateTime serviceTimeFormatted = DateTime.parse(fullDateTimeString);
    DateFormat timeFormat = DateFormat.jm();
    String formattedTime = timeFormat.format(serviceTimeFormatted);
    return SizedBox(
      width: double.infinity,
      //height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          // Background Image
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 20),
            child: Image.asset(
              ImagePath.background,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 640,
            ),
          ),

          // Padding with details
          Padding(
            padding:
                const EdgeInsets.only(left: 35, right: 40, top: 40, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Summary", style: CustomTextStyles.f16W700()),
                SizedBox(height: 14),
                Row(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        serviceImages[serviceName] ?? ImagePath.blankImage,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(serviceName, style: CustomTextStyles.f16W600()),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImagePath.location,
                              height: 12,
                            ),
                            const SizedBox(width: 5),
                            Text(location,
                                style: CustomTextStyles.f14W400(
                                    color: AppColors.lGrey))
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(children: [
                          SvgPicture.asset(ImagePath.time),
                          const SizedBox(width: 6),
                          Text(
                            '${serviceDate} ${formattedTime}',
                            style: CustomTextStyles.f14W400(),
                          )
                        ]),
                        const SizedBox(height: 2),
                        Text("\$${servicePrice.toString()}",
                            style: CustomTextStyles.f14W600(
                                color: AppColors.secondaryColor))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                    "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name:", style: CustomTextStyles.f14W700()),
                    Text(userName, style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email:", style: CustomTextStyles.f14W700()),
                    Text(email, style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Service Type:", style: CustomTextStyles.f14W700()),
                    Text(serviceName, style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Carpet Steam Cleaning Area:",
                        style: CustomTextStyles.f14W700()),
                    Text("${carpetSteamCleaningArea}",
                        style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Carpet Steam Cleaning Unit:",
                        style: CustomTextStyles.f14W700()),
                    Text("${carpetSteamCleaningUnit}",
                        style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Carpet Stain Cleaning Area:",
                        style: CustomTextStyles.f14W700()),
                    Text("${carpetStainCleaningArea}",
                        style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Carpet Stain Cleaning Unit:",
                        style: CustomTextStyles.f14W700()),
                    Text("${carpetStainCleaningUnit}",
                        style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount:", style: CustomTextStyles.f14W700()),
                    Text("\$${servicePrice}",
                        style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Booked Date:", style: CustomTextStyles.f14W700()),
                    Text(serviceDate, style: CustomTextStyles.f14W400()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Status:", style: CustomTextStyles.f14W700()),
                    Text(
                      serviceStatus,
                      style: CustomTextStyles.f14W600().copyWith(
                        color: serviceStatus == 'Pending'
                            ? AppColors.skyBlue
                            : serviceStatus == 'Approved'
                                ? AppColors.accepted
                                : serviceStatus == 'Cancelled'
                                    ? AppColors.rejected
                                    : AppColors.textColor, // Default color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
