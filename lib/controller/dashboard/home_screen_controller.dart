import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class HomeScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;
  var moreDetailOpen1 = false.obs;
  var moreDetailOpen2 = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void toggleMoreDetails1() {
    moreDetailOpen1.value = !moreDetailOpen1.value;
  }

  void toggleMoreDetails2() {
    moreDetailOpen2.value = !moreDetailOpen2.value;
  }
}
