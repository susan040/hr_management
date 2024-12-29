import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/auth/forgot_password_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/auth/login_screen.dart';
import 'package:hr_management/widgets/custom/custom_password_fields.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  final c = Get.put(ForgotPasswordController());
  ChangePasswordScreen({super.key});

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
          "New Password",
          style: CustomTextStyles.f14W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.confirmPasswordKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImagePath.changePassword),
                SizedBox(height: 30),
                Text("Enter new password", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                Obx(() => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    hint: "Enter new password",
                    preIconPath: ImagePath.password,
                    iconHeight: 18,
                    iconWidth: 28,
                    eye: c.newPasswordObscure.value,
                    onEyeClick: c.confirmPasswordOnEyeCLick,
                    controller: c.newPasswordController,
                    textInputAction: TextInputAction.next)),
                SizedBox(height: 20),
                Text("Enter confirm password",
                    style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                Obx(() => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    hint: "Enter confirm password",
                    preIconPath: ImagePath.password,
                    iconHeight: 18,
                    iconWidth: 28,
                    eye: c.confirmPasswordObscure.value,
                    onEyeClick: c.confirmPasswordOnEyeCLick,
                    controller: c.confirmPasswordController,
                    textInputAction: TextInputAction.done)),
                SizedBox(height: 35),
                CustomElevatedButton(
                    title: "Submit",
                    onTap: () {
                      Get.to(() => LoginScreen());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
