import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/history_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'package:mads_cleaning/views/dashboard/booked_details_screen.dart';

class HistoryScreen extends StatelessWidget {
  final c = Get.put(HistoryScreenController());
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
      body: ListView(
        children: const [
          ServiceBookedWidget(
            status: "Cancelled",
            bookedDate: "2024, July 28 Sunday . 08:00 AM",
            image: ImagePath.windowCleaning,
            title: 'Window Cleaning',
            price: '\$50',
          ),
          ServiceBookedWidget(
            status: "Pending",
            bookedDate: "2024, July 28 Sunday . 08:00 AM",
            image: ImagePath.gardenCleaning,
            title: 'Garden Cleaning',
            price: '\$60',
          ),
          ServiceBookedWidget(
            status: "Approved",
            bookedDate: "2024, July 28 Sunday . 08:00 AM",
            image: ImagePath.officeCleaning,
            title: 'Office Cleaning',
            price: '\$60',
          ),
        ],
      ),

      // Obx(() => ListView.builder(
      //       itemCount: c.bookedServices.length,
      //       itemBuilder: (context, index) {
      //         final service = c.bookedServices[index];
      //         return Dismissible(
      //           key: Key(service.title), // Ensure each Dismissible has a unique key
      //           direction: DismissDirection.endToStart, // Only allow swipe to the left
      //           onDismissed: (direction) {
      //             c.removeService(index); // Remove service from the list
      //             ScaffoldMessenger.of(context).showSnackBar(
      //               SnackBar(content: Text('${service.title} dismissed')),
      //             );
      //           },
      //           background: Container(
      //             color: Colors.red,
      //             alignment: Alignment.centerRight,
      //             padding: const EdgeInsets.symmetric(horizontal: 20),
      //             child: const Icon(Icons.delete, color: Colors.white),
      //           ),
      //           child: ServiceBookedWidget(
      //             status: service.status,
      //             bookedDate: service.bookedDate,
      //             image: service.image,
      //             title: service.title,
      //             price: service.price,
      //           ),
      //         );
      //       },
      //     )),
    );
  }
}

class ServiceBookedWidget extends StatelessWidget {
  final String status;
  final String bookedDate;
  final String image;
  final String title;
  final String price;

  const ServiceBookedWidget({
    super.key,
    required this.status,
    required this.bookedDate,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    switch (status) {
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
        statusColor = AppColors.lGrey; // Default color
    }

    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // CustomSnackBar.error(
        //     title: "Service Booking", message: "$title dismissed");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     duration: const Duration(seconds: 2),
        //     content: Text('$title dismissed'),
        //     backgroundColor: AppColors.errorColor,
        //   ),
        // );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
        child: InkWell(
          hoverColor: AppColors.accepted,
          highlightColor: AppColors.borderColor,
          onTap: () {
            Get.to(() => const BookedDetailsScreen());
          },
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
                        child: Text(status,
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
                  Text(bookedDate, style: CustomTextStyles.f14W400())
                ]),
                const Divider(thickness: 0.3, color: AppColors.lGrey),
                Row(
                  children: [
                    Image.asset(
                      image,
                      width: 45,
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: CustomTextStyles.f16W700()),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImagePath.location,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text("123 Clean Street, Hobart, TAS 7000",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.lGrey))
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text("Total: ", style: CustomTextStyles.f14W400()),
                            Text(price,
                                style: CustomTextStyles.f14W400(
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
      ),
    );
  }
}
