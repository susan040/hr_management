import 'package:flutter/material.dart';
import 'package:hr_management/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,

      body: SafeArea(child: Text("Home Page")),
    );
  }
}