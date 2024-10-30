import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/history_screen_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

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
      // body: Obx(() => (c.loading.value)
      //     ? const Center(child: CircularProgressIndicator())
      //     : c.windowCleaning.isEmpty
      //         ? Center(
      //             child: Text(
      //             "No booking",
      //             style:
      //                 CustomTextStyles.f14W400(color: AppColors.textGreyColor),
      //           ))
      //         : ListView.builder(
      //             itemCount: c.windowCleaning.length,
      //             itemBuilder: (context, index) {
      //               WindowCleaning cleaning = c.windowCleaning[index];
      //               return ServiceBookedWidget(
      //                   onDismissed: () {
      //                     c.showMyDialog(context, "Window Cleaning");
      //                   },
      //                   cleaning: cleaning);
      //             })),
    );
  }
}

// class ServiceBookedWidget extends StatelessWidget {
//   final c = Get.put(HistoryScreenController());
//   ServiceBookedWidget({
//     super.key,
//     required this.onDismissed,
//     required this.cleaning, // Add a callback for when the item is dismissed
//   });

//   final WindowCleaning cleaning;
//   final Function onDismissed; // Define the callback

//   @override
//   Widget build(BuildContext context) {
//     Color statusColor;

//     switch (cleaning.status) {
//       case "Cancelled":
//         statusColor = AppColors.rejected;
//         break;
//       case "Pending":
//         statusColor = AppColors.skyBlue;
//         break;
//       case "Approved":
//         statusColor = AppColors.accepted;
//         break;
//       default:
//         statusColor = AppColors.lGrey; // Default color
//     }

//     return Container(
//       margin: const EdgeInsets.only(top: 14),
//       child: Slidable(
//         key: Key("Window Cleaning"),
//         endActionPane: ActionPane(
//           motion: const DrawerMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (context) {
//                 c.showMyDialog(context, "Window Cleaning");
//               },
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//               icon: Icons.delete,
//               label: 'Delete',
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 14, right: 14),
//           child: InkWell(
//             hoverColor: AppColors.accepted,
//             highlightColor: AppColors.borderColor,
//             onTap: () {
//               Get.to(() => const BookedDetailsScreen());
//             },
//             child: Container(
//               padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
//               height: 135,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: AppColors.extraWhite,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: AppColors.borderColor,
//                     blurRadius: 2.0,
//                     offset: Offset(1, 1),
//                   )
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Booked Date",
//                         style: CustomTextStyles.f12W400(color: AppColors.lGrey),
//                       ),
//                       Container(
//                         height: 18,
//                         width: 72,
//                         decoration: BoxDecoration(
//                             color: statusColor,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Center(
//                           child: Text(cleaning.status ?? "",
//                               style: CustomTextStyles.f10W400(
//                                   color: AppColors.extraWhite)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 2),
//                   Row(children: [
//                     SvgPicture.asset(ImagePath.time),
//                     const SizedBox(width: 6),
//                     Text(cleaning.serviceDate ?? "",
//                         style: CustomTextStyles.f14W400())
//                   ]),
//                   const Divider(thickness: 0.3, color: AppColors.lGrey),
//                   Row(
//                     children: [
//                       Image.asset(
//                         "",
//                         width: 45,
//                       ),
//                       const SizedBox(width: 14),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Window Cleaning",
//                               style: CustomTextStyles.f16W700()),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 ImagePath.location,
//                                 height: 12,
//                               ),
//                               const SizedBox(width: 4),
//                               Text("123 Clean Street, Hobart, TAS 7000",
//                                   style: CustomTextStyles.f12W400(
//                                       color: AppColors.lGrey))
//                             ],
//                           ),
//                           const SizedBox(height: 2),
//                           Row(
//                             children: [
//                               Text("Total: ",
//                                   style: CustomTextStyles.f14W400()),
//                               Text(cleaning.price ?? "",
//                                   style: CustomTextStyles.f14W400(
//                                       color: AppColors.secondaryColor)),
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
