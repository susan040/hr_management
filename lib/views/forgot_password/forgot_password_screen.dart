import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/forgot_password_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/forgot_password/email_verification_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final c = Get.put(ForgotPasswordController());
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
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
          "Forgot password",
          style: CustomTextStyles.f14W600(color: AppColors.backGroundDark),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: Image.asset(
                    ImagePath.forgotPassword,
                    height: 325,
                    width: 325,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text("Enter Email Address", style: CustomTextStyles.f14W400()),
              SizedBox(height: 14),
              Form(
                  key: c.keys,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: c.emailController,
                          hint: "Enter your Email",
                          validator: Validators.checkEmailField,
                          preIconPath: ImagePath.email,
                          //iconHeight: 18,
                          // iconWidth: 20,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 40),
                      CustomElevatedButton(
                          title: "Send",
                          onTap: () {
                            Get.to(() => EmailVerificationScreen());
                          })
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
