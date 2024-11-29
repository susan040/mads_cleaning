import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

Widget buildWindowCleaningWidget(
    {required String serviceName,
    required String serviceStatus,
    required String serviceDate,
    required String serviceTime,
    required int servicePrice,
    required String userName,
    required String email,
    required int numberOfWindows,
    required int numberOfStory,
    required String windowsTrackFrame,
    required String location}) {
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
            height: 550,
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
                  Text("Number of Windows:", style: CustomTextStyles.f14W700()),
                  Text("${numberOfWindows}", style: CustomTextStyles.f14W400()),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Number of Story:", style: CustomTextStyles.f14W700()),
                  Text("${numberOfStory}", style: CustomTextStyles.f14W400()),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Windows Track Frame:",
                      style: CustomTextStyles.f14W700()),
                  Text("${windowsTrackFrame}",
                      style: CustomTextStyles.f14W400()),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount:", style: CustomTextStyles.f14W700()),
                  Text("\$${servicePrice}", style: CustomTextStyles.f14W400()),
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
