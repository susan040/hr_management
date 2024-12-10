import 'package:flutter/material.dart';
import 'package:hr_management/utils/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,

      body: SafeArea(
        child: Column(
          children: [Text("History")],
        ),
      ),
    );
  }
}
