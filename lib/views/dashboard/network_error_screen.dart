import 'package:flutter/material.dart';
import 'package:mads_cleaning/utils/colors.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';
import 'package:mads_cleaning/utils/image_path.dart';
import 'dart:async';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({super.key});

  Future<bool> checkNetworkConnection() async {
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkNetworkConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColors.extraWhite,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey[300],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey[300],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey[300],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey[300],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey[300],
                  ),
                ],
              )),
            )),
          );
        } else if (snapshot.hasError || snapshot.data == false) {
          return Scaffold(
            backgroundColor: AppColors.extraWhite,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImagePath.networkError,
                        height: 170, width: 170),
                    const SizedBox(height: 14),
                    Text("Network Connection Error",
                        style: CustomTextStyles.f14W600()),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: 252,
                      child: Text(
                        "Please check your internet connection and try again",
                        style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text("Connected!")),
          );
        }
      },
    );
  }
}

class NetworkErrorChatScreen extends StatelessWidget {
  const NetworkErrorChatScreen({super.key});

  Future<bool> checkNetworkConnection() async {
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkNetworkConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              backgroundColor: AppColors.extraWhite,
              body: SafeArea(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  width: 120,
                  height: 50,
                  color: Colors.grey[300],
                ),
              ));
        } else if (snapshot.hasError || snapshot.data == false) {
          return Scaffold(
              backgroundColor: AppColors.extraWhite, body: SizedBox());
        } else {
          return Scaffold(
            body: Center(child: Text("Connected!")),
          );
        }
      },
    );
  }
}
