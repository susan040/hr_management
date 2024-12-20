import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/register_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/auth/all_done_screen.dart';
import 'package:hr_management/views/auth/login_screen.dart';
import 'package:hr_management/widgets/custom/custom_password_fields.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  final c = Get.put(RegisterScreenController());
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Center(
              child: Image.asset(
                ImagePath.logo,
                height: 188,
                width: 188,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "CREATE YOUR ACCOUNT",
              style: CustomTextStyles.f16W600(),
            ),
            Form(
                key: c.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 30, bottom: 80),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: c.fullNameController,
                          hint: "Enter your Full Name",
                          validator: Validators.checkFieldEmpty,
                          preIconPath: ImagePath.person,
                          iconHeight: 18,
                          iconWidth: 24,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text),
                      SizedBox(height: 18),
                      CustomTextField(
                          controller: c.emailController,
                          hint: "Enter your Email",
                          validator: Validators.checkEmailField,
                          preIconPath: ImagePath.email,
                          //iconHeight: 18,
                          // iconWidth: 20,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 18),
                      CustomTextField(
                          controller: c.addressController,
                          hint: "Enter your address",
                          validator: Validators.checkFieldEmpty,
                          preIconPath: ImagePath.address,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 18),
                      CustomTextField(
                          controller: c.phoneController,
                          hint: "Enter your phone",
                          validator: Validators.checkPhoneField,
                          preIconPath: ImagePath.phone,
                          iconHeight: 18,
                          iconWidth: 24,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.phone),
                      SizedBox(height: 18),
                      Obx(() => CustomPasswordField(
                          validator: Validators.checkPasswordField,
                          hint: "Enter password",
                          preIconPath: ImagePath.password,
                          iconHeight: 18,
                          iconWidth: 28,
                          eye: c.passwordObscure.value,
                          onEyeClick: c.passwordOnEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done)),
                      SizedBox(height: 18),
                      Obx(() => CustomPasswordField(
                          validator: Validators.checkPasswordField,
                          hint: "Enter confirm password",
                          preIconPath: ImagePath.password,
                          iconHeight: 18,
                          iconWidth: 28,
                          eye: c.confirmObscure.value,
                          onEyeClick: c.confirmPasswordOnEyeCLick,
                          controller: c.confirmPasswordController,
                          textInputAction: TextInputAction.done)),
                      SizedBox(height: 27),
                      CustomElevatedButton(
                          title: "Sign Up",
                          onTap: () {
                            Get.offAll(() => AllDoneScreen());
                          }),
                      SizedBox(height: 12),
                      Text("or", style: CustomTextStyles.f14W400()),
                      SizedBox(height: 12),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.extraWhite,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 2, color: AppColors.primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagePath.google,
                              height: 28,
                              width: 28,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Login with Google",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Login",
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
