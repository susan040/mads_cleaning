import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Chat Bot",
          style: CustomTextStyles.f14W700(color: AppColors.textColor),
        ),
      ),
      body: Column(
        children: [
          // Chat messages display
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: 10, // Replace with your message count
              itemBuilder: (context, index) {
                // For demonstration, alternating message types
                bool isUserMessage = index % 2 == 0;
                return Align(
                  alignment:
                      isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isUserMessage
                          ? "User message $index"
                          : "Bot response $index",
                      style: CustomTextStyles.f14W400(
                          color: isUserMessage
                              ? Colors.white
                              : AppColors.textColor),
                    ),
                  ),
                );
              },
            ),
          ),
          // Text input field for sending messages
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add message send logic here
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
