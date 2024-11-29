import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/views/dashboard/history_screen.dart';
import 'package:mads_cleaning/views/dashboard/home_screen.dart';
import 'package:mads_cleaning/views/profile/profile_screen.dart';

class DashScreenController extends GetxController {
  final dashKey = GlobalKey<ScaffoldState>();
  RxList<Widget> pages =
      RxList([HomeScreen(), HistoryScreen(), ProfileScreen()]);
  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
