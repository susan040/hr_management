import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Privacy Policy",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This Privacy Policy describes Our policies and procedures on the collection, use, and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f14W400(),
              ),
              SizedBox(height: 15),
              Text(
                "Information We Collect:",
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 6),
              Text(
                "We collect the following data:\n"
                "- Email address\n"
                "- Name\n"
                "- Phone number\n"
                "- Address\n"
                "- Usage data\n\n"
                "We may also collect automatically generated data when you use the service, such as IP address and browser type.",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f14W400(),
              ),
              SizedBox(height: 16),
              Text(
                "Use of Your Data:",
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 6),
              Text(
                "We use your personal data to:\n"
                "- Provide and maintain the service\n"
                "- Contact you for service-related purposes\n"
                "- Manage your account\n"
                "- Improve the service\n\n"
                "We may also share your data with third parties to improve our service or to comply with legal requirements.",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f14W400(),
              ),
              SizedBox(height: 20),
              Text(
                "Security of Your Data:",
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 6),
              Text(
                "We take reasonable steps to secure your personal data, but we cannot guarantee absolute security.",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f14W400(),
              ),
              SizedBox(height: 20),
              Text(
                "Contact Us:",
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 6),
              Text(
                "If you have any questions about this Privacy Policy, You can contact us:\n"
                "By email: able.innovation23@gmail.com",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f14W400(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
