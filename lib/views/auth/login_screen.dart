import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/login_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/auth/all_done_screen.dart';
import 'package:hr_management/views/auth/register_screen.dart';
import 'package:hr_management/views/forgot_password/forgot_password_screen.dart';
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
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Center(
                child: Image.asset(
                  ImagePath.logo,
                  height: 188,
                  width: 188,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "LOGIN TO YOUR ACCOUNT",
              style: CustomTextStyles.f16W600(),
            ),
            Form(
                key: c.keys,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 30, bottom: 50),
                  child: Column(
                    children: [
                      CustomTextField(
                          hint: "Enter your email",
                          validator: Validators.checkEmailField,
                          preIconPath: ImagePath.email,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 18),
                      Obx(() => CustomPasswordField(
                          validator: Validators.checkPasswordField,
                          hint: "Enter password",
                          iconHeight: 18,
                          iconWidth: 28,
                          preIconPath: ImagePath.password,
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done)),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => ForgotPasswordScreen());
                            },
                            child: Text("Forgot Password?",
                                style: CustomTextStyles.f12W400()),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      CustomElevatedButton(
                          title: "Login",
                          onTap: () {
                            Get.offAll(() => AllDoneScreen());
                          }),
                      SizedBox(height: 15),
                      Text(
                        "or",
                        style: CustomTextStyles.f14W400(),
                      ),
                      SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => RegisterScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  decoration: TextDecoration.underline,
                                  color: AppColors.primaryColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
