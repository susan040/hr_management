import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/dash_screen.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class AllDoneScreen extends StatelessWidget {
  const AllDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
            child: Column(
              children: [
                Text("All done now", style: CustomTextStyles.f18W600()),
                SizedBox(height: 4),
                Text("It's time for you to explore everything",
                    style: CustomTextStyles.f14W400(
                        color: AppColors.secondaryTextColor)),
                SizedBox(height: 65),
                Center(
                  child: Image.asset(
                    ImagePath.allDone,
                    height: 330,
                    width: 285,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 85),
                CustomElevatedButton(
                    title: "Start exploring the app",
                    onTap: () {
                      Get.offAll(() => DashScreen());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
