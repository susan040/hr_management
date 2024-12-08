import 'dart:async';
import 'package:get/get.dart';
import 'package:hr_management/views/privacy_policy_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () async {
      Get.offAll(() => PrivacyPolicyScreen());
    });
    super.onInit();
  }
}
