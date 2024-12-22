import 'dart:async';
import 'package:get/get.dart';
import 'package:hr_management/views/auth/agree_accept_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () async {
      Get.offAll(() => AgreeAndAcceptScreen());
    });
    super.onInit();
  }
}
