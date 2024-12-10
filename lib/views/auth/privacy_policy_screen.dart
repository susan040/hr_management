import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/privacy_policy_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/auth/login_screen.dart';
import 'package:hr_management/views/auth/register_screen.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final c = Get.put(PrivacyPolicyController());
  PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        title: Text(
          "Privacy Policy",
          style: CustomTextStyles.f16W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 57),
              child: Center(
                child: Image.asset(
                  ImagePath.privacyPolicy,
                  height: 270,
                  width: 270,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 50),
                  child: Obx(
                    () => Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: c.isPrivacyPolicyAccepted.value,
                            onChanged: (bool? value) {
                              c.togglePrivacyPolicy(value ?? false);
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('I agree and accept',
                            style: CustomTextStyles.f14W400()),
                        Text(' Privacy Policy',
                            style: CustomTextStyles.f14W400(
                                color: AppColors.primaryColor)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, bottom: 14),
                  child: Obx(
                    () => Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: c.isTermsOfUseAccepted.value,
                            onChanged: (bool? value) {
                              c.toggleTermsOfUse(value ?? false);
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('I agree and accept',
                            style: CustomTextStyles.f14W400()),
                        Text(' Terms of Use',
                            style: CustomTextStyles.f14W400(
                                color: AppColors.primaryColor)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        "You can only move forward if you agree",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.secondaryTextColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "to everything above",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.secondaryTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 60, right: 60, top: 48, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                            width: Get.width / 3.2,
                            height: 38,
                            child: CustomElevatedButton(
                                title: "Login",
                                onTap: () {
                                  Get.to(() => LoginScreen());
                                })),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => RegisterScreen());
                          },
                          child: Container(
                            width: Get.width / 3.2,
                            height: 38,
                            decoration: BoxDecoration(
                                color: AppColors.redColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                "Register",
                                style: CustomTextStyles.f14W600(
                                    color: AppColors.extraWhite),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
