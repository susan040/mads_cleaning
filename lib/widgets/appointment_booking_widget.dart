import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/appointment_booking_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class AppointmentBookingWidget extends StatelessWidget {
  const AppointmentBookingWidget({
    super.key,
    required this.c,
  });

  final AppointmentBookingController c;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: c.handymanJobs.value,
                    onChanged: (value) {
                      c.handymanJobs.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Handyman Jobs",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.plumbers.value,
                    onChanged: (value) {
                      c.plumbers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Plumbers",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.electricians.value,
                    onChanged: (value) {
                      c.electricians.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Electricians",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.builders.value,
                    onChanged: (value) {
                      c.builders.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Builders",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.realEstateAgents.value,
                    onChanged: (value) {
                      c.realEstateAgents.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Real Estate Agents",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.locksmiths.value,
                    onChanged: (value) {
                      c.locksmiths.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Locksmiths",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.landscapers.value,
                    onChanged: (value) {
                      c.landscapers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Landscapers",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.treeLoopers.value,
                    onChanged: (value) {
                      c.treeLoopers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Tree Loopers",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.painters.value,
                    onChanged: (value) {
                      c.painters.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Painters",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.glassRepairers.value,
                    onChanged: (value) {
                      c.glassRepairers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Glass repairers/replacers(House and Vehicles)",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.blindsAndCurtainFitters.value,
                    onChanged: (value) {
                      c.blindsAndCurtainFitters.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Blinds and Curtain Fitters",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.flooring.value,
                    onChanged: (value) {
                      c.flooring.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Flooring",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.carpetLayers.value,
                    onChanged: (value) {
                      c.carpetLayers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Carpet Layers",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.tilers.value,
                    onChanged: (value) {
                      c.tilers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Tilers",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.eventPlanners.value,
                    onChanged: (value) {
                      c.eventPlanners.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Event Planners",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.photographers.value,
                    onChanged: (value) {
                      c.photographers.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Photographers",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.cabinetMaker.value,
                    onChanged: (value) {
                      c.cabinetMaker.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Cabinet Maker",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.pestControl.value,
                    onChanged: (value) {
                      c.pestControl.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Pest control",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.removalists.value,
                    onChanged: (value) {
                      c.removalists.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("Removalists",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: c.cctvInstaller.value,
                    onChanged: (value) {
                      c.cctvInstaller.value = value!;
                    },
                    activeColor: AppColors.secondaryColor,
                    checkColor: AppColors.extraWhite,
                  ),
                  Text("CCTV installer (Any Premises)",
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor))
                ],
              ),
            ],
          ),
        ));
  }
}
