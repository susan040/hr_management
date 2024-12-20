import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final keys = GlobalKey<FormState>();
  final confirmPasswordKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  RxBool newPasswordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  void passwordOnEyeCLick() {
    newPasswordObscure.value = !newPasswordObscure.value;
  }

  void confirmPasswordOnEyeCLick() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  final code = ''.obs;
  final controllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());

  void onChanged(String value, int index, BuildContext context) {
    if (value.isNotEmpty && value.length == 1) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
    updateCode();
  }

  void updateCode() {
    code.value = controllers.map((controller) => controller.text).join();
  }

 final isResendAvailable = false.obs;
  final countdown = 30.obs; 
  Timer? timer;
  void resendCode() {
    if (!isResendAvailable.value) return;
    Get.snackbar(
      "Code Sent",
      "A new code has been sent to your email/phone.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );

    // Reset the timer
    startResendTimer();
  }

  void startResendTimer() {
    isResendAvailable.value = false;
    countdown.value = 30;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        isResendAvailable.value = true;
        timer.cancel();
      }
    });
  }

}
