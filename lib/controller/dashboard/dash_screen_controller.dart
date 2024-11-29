import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashScreenController extends GetxController {
  final dashKey = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    // HomeScreen(),
    // HistoryScreen(),
    // ProfileScreen()
  ]);
  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
