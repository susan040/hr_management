import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/dash_screen.dart';

class IssueSuccessScreen extends StatelessWidget {
  const IssueSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImagePath.raiseIssue,
              height: 300,
              width: 230,
            ),
          ),
          SizedBox(height: 35),
          Text(
            "Thank you",
            style: CustomTextStyles.f24W600(),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: Text(
              "YOUR ISSUE IS SUBMITTED SUCCESSFULLY!!",
              style:
                  CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              Get.offAll(() => DashScreen());
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
