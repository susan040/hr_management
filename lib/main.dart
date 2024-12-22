import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HRM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          indicatorColor: AppColors.extraWhite,
          colorSchemeSeed: AppColors.extraWhite,
          hoverColor: AppColors.extraWhite,
          highlightColor: AppColors.extraWhite,
          focusColor: AppColors.extraWhite,
          splashColor: AppColors.extraWhite),
      home: SplashScreen(),
    );
  }
}
