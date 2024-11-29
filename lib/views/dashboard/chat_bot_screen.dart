import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/controller/dashboard/network_error_controller.dart';
import 'package:mads_cleaning/views/dashboard/network_error_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mads_cleaning/controller/core_controller.dart';
import 'package:mads_cleaning/controller/dashboard/chatbot_controller.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';

class ChatBotScreen extends StatelessWidget {
  final c = Get.put(ChatbotController());
  final coreController = Get.put(CoreController());
  final networkController = Get.put(NetworkErrorController());

  ChatBotScreen({super.key});

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
        title: Text(
          "Chatbot",
          style: CustomTextStyles.f14W700(color: AppColors.textColor),
        ),
      ),
      body: Obx(() {
        if (networkController.isOffline.value) {
          return NetworkErrorScreen();
        }
        return Obx(() {
          if (c.loading.value) {
            return buildShimmerEffect();
          } else if (c.allChats.isEmpty) {
            return Center(
              child: Text(
                "No Chats",
                style: CustomTextStyles.f14W400(
                  color: AppColors.textGreyColor,
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 14, top: 20, right: 14, bottom: 20),
                child: buildChatList(),
              ),
            );
          }
        });
      }),
      bottomNavigationBar: Obx(() {
        // Show bottom navigation bar only when network is online and not loading
        if (networkController.isOffline.value || c.loading.value) {
          return SizedBox.shrink(); // This hides the bottom navigation bar
        } else {
          return Container(
            height: 75,
            decoration: BoxDecoration(
              color: AppColors.extraWhite,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var chat in c.allChats)
                    InkWell(
                      onTap: () {
                        c.selectChat(chat);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            chat.question ?? "",
                            style: CustomTextStyles.f12W400(
                              color: AppColors.extraWhite,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(8, (index) {
          bool isChatbot = index % 2 == 0;

          return Align(
            alignment: isChatbot ? Alignment.centerLeft : Alignment.centerRight,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 60,
                width: isChatbot ? 220 : 170,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12).copyWith(
                    bottomLeft: isChatbot ? Radius.zero : Radius.circular(12),
                    bottomRight: isChatbot ? Radius.circular(12) : Radius.zero,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // Build chat list
  Widget buildChatList() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.unselectedGrey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(ImagePath.chatbot),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 7),
            Container(
              padding: EdgeInsets.all(10),
              width: Get.width / 1.85,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, ${coreController.currentUser.value!.name.toString()} 👋",
                    style:
                        CustomTextStyles.f12W400(color: AppColors.extraWhite),
                  ),
                  Text(
                    "How may I help you today?", // Static message
                    style:
                        CustomTextStyles.f12W400(color: AppColors.extraWhite),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 18),
        for (var selectedQuestion in c.selectedChats)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      selectedQuestion.question ?? "",
                      style: CustomTextStyles.f12W400(
                        color: AppColors.extraWhite,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      fit: BoxFit.cover,
                      height: 35,
                      width: 35,
                      imageUrl: coreController.currentUser.value?.avatar ?? "",
                      errorWidget: (context, url, error) => Image.network(
                        "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                        height: 35,
                        width: 35,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 3, right: 50, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      c.getFormattedTime(selectedQuestion),
                      style: CustomTextStyles.f10W400(
                          color: AppColors.unselectedGrey),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColors.unselectedGrey,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(ImagePath.chatbot),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Container(
                      padding: EdgeInsets.only(left: 14, top: 10, bottom: 10),
                      width: Get.width / 1.6,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        selectedQuestion.answer ?? "",
                        style: CustomTextStyles.f12W400(
                          color: AppColors.extraWhite,
                        ),
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 3, left: 50, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      c.getFormattedTime(selectedQuestion),
                      style: CustomTextStyles.f10W400(
                          color: AppColors.unselectedGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
