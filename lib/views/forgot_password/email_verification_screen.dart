import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/forgot_password_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/forgot_password/change_password_screen.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  final controller = Get.put(ForgotPasswordController());
  EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Verification",
          style: CustomTextStyles.f14W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 18, right: 18),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Image.asset(
                  ImagePath.emailVerification,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Enter Verification Code',
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 52,
                    height: 54,
                    child: TextField(
                      controller: controller.controllers[index],
                      focusNode: controller.focusNodes[index],
                      onChanged: (value) =>
                          controller.onChanged(value, index, context),
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors.secondaryColor),
                            borderRadius: BorderRadius.circular(6)),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors.errorColor),
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(6)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors.errorColor),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              InkWell(
                splashColor: AppColors.extraWhite,
                onTap: controller.resendCode,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you didn't receive a code!",
                        style: CustomTextStyles.f12W400()),
                    SizedBox(width: 4),
                    Text("Resend",
                        style: CustomTextStyles.f12W400(
                            color: AppColors.primaryColor)),
                  ],
                ),
              ),
              SizedBox(height: 40),
              CustomElevatedButton(
                  title: "Verify",
                  onTap: () {
                    Get.to(() => ChangePasswordScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
