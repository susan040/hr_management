import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/dash_screen.dart';

class ApplicationSuccessfulScreen extends StatelessWidget {
  const ApplicationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImagePath.leaveApplicationSuccess,
              height: 300,
              width: 230,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Thank you",
            style: CustomTextStyles.f24W600(),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: Text(
              "YOUR LEAVE APPLICATION SUBMITTED SUCCESSFULLY!!",
              style:
                  CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 4),
          InkWell(
            onTap: () {
              Get.to(() => DashScreen());
            },
            child: Text(
              "GOT IT",
              style: CustomTextStyles.f16W600(color: AppColors.rejected),
            ),
          ),
          SizedBox(height: 50),
        ],
      )),
    );
  }
}
