import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/dash_screen.dart';

class GrievanceSuccessScreen extends StatelessWidget {
  const GrievanceSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                ImagePath.grievanceSuccess,
                height: 213,
                width: 280,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "THANK YOU",
              style: CustomTextStyles.f24W600(),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Text(
                "YOUR GRIEVANCE SUBMITTED \n"
                "SUCCESSFULLY!!!",
                style: CustomTextStyles.f12W400(
                    color: AppColors.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                Get.to(() => DashScreen());
              },
              child: Text(
                "GOT IT",
                style: CustomTextStyles.f16W600(color: AppColors.redColor),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      )),
    );
  }
}
