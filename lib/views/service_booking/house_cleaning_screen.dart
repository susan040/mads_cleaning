// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mads_cleaning/controller/dashboard/service_booking_controller.dart';
// import 'package:mads_cleaning/utils/colors.dart';
// import 'package:mads_cleaning/utils/custom_text_style.dart';
// import 'package:mads_cleaning/utils/validator.dart';
// import 'package:mads_cleaning/views/service_booking/service_congratulation.dart';
// import 'package:mads_cleaning/widgets/custom/custom_textfield.dart';
// import 'package:mads_cleaning/widgets/custom/elevated_button.dart';
// import 'package:mads_cleaning/widgets/services_form_widget.dart';

// class HouseCleaingScreen extends StatelessWidget {
//   final c = Get.put(ServiceBookingController());
//   HouseCleaingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         centerTitle: false,
//         backgroundColor: AppColors.extraWhite,
//         leading: InkWell(
//           onTap: () => Get.back(),
//           child: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//         title: Text("House Cleaning Service",
//             style: CustomTextStyles.f14W700(color: AppColors.textColor)),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//             key: c.formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ServiceFormWidget(c: c),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 10),
//                   child:
//                       Text("No of Bedrooms", style: CustomTextStyles.f14W700()),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 22),
//                   child: CustomTextField(
//                       controller: c.noOfBedroomsController,
//                       validator: Validators.checkFieldEmpty,
//                       hint: "No of Bedrooms",
//                       textInputAction: TextInputAction.done,
//                       textInputType: TextInputType.number),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 10),
//                   child: Text("No of Bathrooms",
//                       style: CustomTextStyles.f14W700()),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 22),
//                   child: CustomTextField(
//                       controller: c.noOfBathroomsController,
//                       validator: Validators.checkFieldEmpty,
//                       hint: "No of Bathrooms",
//                       textInputAction: TextInputAction.done,
//                       textInputType: TextInputType.number),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 10),
//                   child: Text("No of Story", style: CustomTextStyles.f14W700()),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 22),
//                   child: CustomTextField(
//                       controller: c.noOfStoryController,
//                       validator: Validators.checkFieldEmpty,
//                       hint: "No of Story (House)",
//                       textInputAction: TextInputAction.done,
//                       textInputType: TextInputType.number),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 10),
//                   child: Text("Frequency of Cleaning",
//                       style: CustomTextStyles.f14W700()),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 18, right: 18, bottom: 10),
//                   child: DropdownButtonFormField(
//                     onChanged: (value) {
//                       c.selectWindowOption.value = value.toString();
//                     },
//                     items: [
//                       DropdownMenuItem(
//                         value: 'Weekly',
//                         child:
//                             Text('Weekly', style: CustomTextStyles.f14W400()),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Fortnightly',
//                         child: Text('Fortnightly',
//                             style: CustomTextStyles.f14W400()),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Monthly',
//                         child:
//                             Text('Monthly', style: CustomTextStyles.f14W400()),
//                       ),
//                     ],
//                     decoration: InputDecoration(
//                       hintText: "Select frequency of Cleaning",
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(
//                             width: 1, color: AppColors.secondaryTextColor),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(
//                             width: 1, color: AppColors.errorColor),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(
//                             width: 1, color: AppColors.primaryColor),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(
//                             width: 1, color: AppColors.errorColor),
//                       ),
//                       hintStyle: CustomTextStyles.f14W400(
//                           color: AppColors.secondaryTextColor),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 18, right: 18, top: 14, bottom: 10),
//                   child: Text("Message", style: CustomTextStyles.f14W700()),
//                 ),
//                 MessageWidget(c: c)
//               ],
//             )),
//       ),
//       bottomNavigationBar: Padding(
//         padding:
//             const EdgeInsets.only(left: 18, right: 18, bottom: 16, top: 10),
//         child: SizedBox(
//           height: 60,
//           child: CustomElevatedButton(
//               title: "Submit",
//               onTap: () {
//                 Get.offAll(() => const ServiceCongratulationScreen());
//               }),
//         ),
//       ),
//     );
//   }
// }
