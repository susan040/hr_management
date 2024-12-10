import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/views/dashboard/history_screen.dart';
import 'package:hr_management/views/dashboard/home_screen.dart';
import 'package:hr_management/views/dashboard/setting_screen.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();

  RxList<Widget> pages =
      RxList([HomeScreen(), HistoryScreen(), SettingScreen()]);

  RxInt currentIndex = RxInt(0);
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
