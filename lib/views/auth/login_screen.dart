import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/login_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/widgets/custom/custom_password_fields.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImagePath.logo,
              height: 188,
              width: 188,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "LOGIN TO YOUR ACCOUNT",
            style: CustomTextStyles.f16W600(),
          ),
          Form(
              key: c.keys,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 30, bottom: 80),
                child: Column(
                  children: [
                    CustomTextField(
                        hint: "Enter your email",
                        validator: Validators.checkEmailField,
                        preIconPath: ImagePath.email,
                        iconHeight: 18,
                        iconWidth: 24,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: 25),
                    Obx(() => CustomPasswordField(
                        validator: Validators.checkPasswordField,
                        hint: "Enter password",
                        preIconPath: ImagePath.password,
                        eye: c.passwordObscure.value,
                        onEyeClick: c.onEyeCLick,
                        controller: c.passwordController,
                        textInputAction: TextInputAction.done)),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password?",
                            style: CustomTextStyles.f12W400()),
                      ],
                    ),
                    SizedBox(height: 40),
                    CustomElevatedButton(title: "Login", onTap: () {})
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
