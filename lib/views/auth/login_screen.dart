import 'package:flutter/material.dart';
import 'package:mads_cleaning/utils/custom_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(child: Text("Good to see You!", style: CustomTextStyles.f32W700())),
          Center(child: Text("Let's continue the journey", style: CustomTextStyles.f18W400())),
        ],
      )),
    );
  }
}
