import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/views/auth/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreenController extends GetxController {
  void launchURL() async {
    final Uri url =
        Uri.parse('https://maps.app.goo.gl/R81cMFLwJ415e1ta6?g_st=ac');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print('Error: Could not launch $url');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void showMyDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          title: Text(
            'Are you sure you want to sign out?',
            textAlign: TextAlign.center,
            style: CustomTextStyles.f12W600(),
          ),
          content: Text(
            "You’re going to edit your account. Please ensure all your work is saved. Would you like to proceed?",
            style:
                CustomTextStyles.f11W400(color: AppColors.secondaryTextColor),
            textAlign: TextAlign.center,
          ),
          actions: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 44,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                      color: AppColors.rejected,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text('No',
                            style: CustomTextStyles.f12W400(
                                color: AppColors.extraWhite))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                    // Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 44,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('Yes',
                          style: CustomTextStyles.f12W400(
                              color: AppColors.extraWhite)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}
