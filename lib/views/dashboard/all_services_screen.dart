import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/all_serivces_controller.dart';
import 'package:mads_cleaning/model/all_services.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/widgets/services_widget.dart';

class AllServicesScreen extends StatelessWidget {
  AllServicesScreen({super.key});
  final c = Get.put(AllSerivcesController());
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
          title: Text("All Services",
              style: CustomTextStyles.f14W700(color: AppColors.textColor)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => (c.loading.value)
                    ? const Center(child: CircularProgressIndicator())
                    : c.allServices.isEmpty
                        ? Center(
                            child: Text(
                            "No services",
                            style: CustomTextStyles.f14W400(
                                color: AppColors.textGreyColor),
                          ))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              childAspectRatio: 3 / 2.7,
                            ),
                            shrinkWrap: true,
                            //physics: const NeverScrollableScrollPhysics(),
                            itemCount: c.allServices.length,
                            itemBuilder: (context, index) {
                              Services services = c.allServices[index];
                              return ServicesWidget(services: services);
                            },
                          ),
              ),
            ],
          ),
        ));
  }
}
