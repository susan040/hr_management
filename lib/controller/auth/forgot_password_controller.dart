import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final keys = GlobalKey<FormState>();
  final confirmPasswordKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  var code = ''.obs;
  RxBool newPasswordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  void passwordOnEyeCLick() {
    newPasswordObscure.value = !newPasswordObscure.value;
  }

  void confirmPasswordOnEyeCLick() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  void verifyCode() {
    if (code.value.length == 4) {
      print("Code Verified: ${code.value}");
    } else {
      Get.snackbar("Error", "Please enter a valid 4-digit code");
    }
  }

  void resendCode() {
    print("Verification code resent");
  }
}
