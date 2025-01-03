import 'package:flutter/material.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.networkError,
                height: 250,
                width: 244,
              ),
              SizedBox(height: 20),
              Text(
                "No Connection",
                style: CustomTextStyles.f16W600(),
              ),
              SizedBox(height: 10),
              Text(
                "No internet connection found. Check \nyour connection or try again.",
                style: CustomTextStyles.f12W500(
                    color: AppColors.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: 203,
                  child:
                      CustomElevatedButton(title: "TRY AGAIN!", onTap: () {})),
              SizedBox(height: 40),
            ],
          ),
        )));
  }
}
