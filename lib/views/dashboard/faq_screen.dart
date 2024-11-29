import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
        title: Text("FAQ",
            style: CustomTextStyles.f14W700(color: AppColors.textColor)),
      ),
      body: ListView(
        children: const [
          FaqItem(
            question: 'How do I book a service?',
            answer:
                'You can book a service directly through our app by selecting the desired service and scheduling a time. You can also contact us via phone or email to make a booking.',
          ),
          FaqItem(
            question: 'What should I do to prepare for your visit?',
            answer:
                'To help us provide the best service, please ensure that the areas to be cleaned are accessible and free from clutter. For window cleaning, please remove any fragile items from window sills.',
          ),
          FaqItem(
            question: 'What cleaning products do you use?',
            answer:
                'We use high-quality, eco-friendly cleaning products that are safe for both your property and the environment. If you have specific preferences or requirements, please let us know.',
          ),
          FaqItem(
            question: 'Do you offer any guarantees?',
            answer:
                'Yes, we guarantee the best results and complete customer satisfaction with our services. If you’re not satisfied with our work, please let us know, and we will make it right.',
          ),
          FaqItem(
            question: 'Do you offer emergency cleaning services?',
            answer:
                'Yes, we do offer emergency cleaning services. Please contact us directly via phone for urgent requests.',
          )
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: CustomTextStyles.f14W500(color: AppColors.textColor),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(answer,
              style: CustomTextStyles.f14W400(color: AppColors.textColor)),
        ),
      ],
    );
  }
}
