import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Import Slidable
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/history_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class HistoryScreen extends StatelessWidget {
  final c = Get.put(HistoryScreenController());
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: [
          ServiceBookedWidget(
            status: "Cancelled",
            bookedDate: "2024, July 28 Sunday . 08:00 AM",
            image: ImagePath.windowCleaning,
            title: 'Window Cleaning',
            price: '\$50',
            onDismissed: () {
              c.showMyDialog(context, 'Window Cleaning');
            },
          ),
          ServiceBookedWidget(
            status: "Pending",
            bookedDate: "2024, July 28 Sunday . 08:00 AM",
            image: ImagePath.gardenCleaning,
            title: 'Garden Cleaning',
            price: '\$60',
            onDismissed: () {
              c.showMyDialog(context, 'Garden Cleaning');
            },
          ),
          ServiceBookedWidget(
            status: "Approved",
            bookedDate: "2024, July 28 Sunday . 08:00 AM",
            image: ImagePath.officeCleaning,
            title: 'Office Cleaning',
            price: '\$60',
            onDismissed: () {
              c.showMyDialog(context, 'Office Cleaning');
            },
          ),
        ],
      ),
    );
  }
}

class ServiceBookedWidget extends StatelessWidget {
  final c = Get.put(HistoryScreenController());
  ServiceBookedWidget({
    super.key,
    required this.status,
    required this.bookedDate,
    required this.image,
    required this.title,
    required this.price,
    required this.onDismissed, // Add a callback for when the item is dismissed
  });

  final String status;
  final String bookedDate;
  final String image;
  final String title;
  final String price;
  final Function onDismissed; // Define the callback

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

    return Slidable(
      key: Key(title), // Ensure each Slidable has a unique key
      endActionPane: ActionPane(
        motion: const DrawerMotion(), // Controls the motion of the drawer
        children: [
          SlidableAction(
            onPressed: (context) {
              c.showMyDialog(context, title);
            },
            backgroundColor: Colors.red, // Customize the background color
            foregroundColor: Colors.white, // Customize the icon color
            icon: Icons.delete,
            label: 'Delete',
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: 15), // Customize padding
            borderRadius:
                BorderRadius.circular(12), // Optional: Add border radius
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
        margin: const EdgeInsets.only(left: 18, right: 18, top: 18),
        height: 128,
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
                const SizedBox(width: 11),
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
    );
  }
}
