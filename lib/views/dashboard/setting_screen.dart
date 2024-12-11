import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/views/auth/login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: Column(
          children: [
            Text("setting page"),
            TextButton(
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                },
                child: Text("Log out"))
          ],
        ),
      ),
    );
  }
}
