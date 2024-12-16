import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/dash_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/custom/custom_bottom_nav_icon.dart';

class DashScreen extends StatelessWidget {
  final c = Get.put(DashScreenController());
  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: Obx(() => c.pages[c.currentIndex.value]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        height: 65,
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 3,
                color: AppColors.lGrey,
                offset: Offset(3, 2))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => CustomBottomNavIcon(
                title: "Home",
                svgPath: ImagePath.home,
                height: 18,
                width: 18,
                isActive: c.currentIndex.value == 0,
                onTap: () {
                  c.currentIndex.value = 0;
                },
              ),
            ),
            Obx(
              () => CustomBottomNavIcon(
                title: "History",
                svgPath: ImagePath.history,
                height: 18,
                width: 18,
                isActive: c.currentIndex.value == 1,
                onTap: () {
                  c.currentIndex.value = 1;
                },
              ),
            ),
            Obx(
              () => CustomBottomNavIcon(
                title: "Setting",
                svgPath: ImagePath.setting,
                height: 18,
                width: 18,
                isActive: c.currentIndex.value == 2,
                onTap: () {
                  c.currentIndex.value = 2;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
