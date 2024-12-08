import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/splash_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  final c = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.logo,
                height: 188,
                width: 188,
              ),
              const SizedBox(height: 75),
              const CircularProgressIndicator(
                backgroundColor: AppColors.secondaryColor,
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
              const SizedBox(height: 75),
            ],
          ),
        ));
  }
}
