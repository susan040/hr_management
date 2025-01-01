import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';

class PaySlipController extends GetxController {
  final issueFormKey = GlobalKey<FormState>();
  var totalSlip = 58600.obs;
  var chartSections = <PieChartSectionData>[].obs;
  var selectedOption = "High".obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final issueController = TextEditingController();
  final noteController = TextEditingController();

  final grossPay = 58600.0.obs;
  final earnings = 58000.0.obs;
  final deductions = 58000.0.obs;

  final earningsBreakdown = [
    {'label': 'Basic', 'value': 30000.0},
    {'label': 'Leave Encashment', 'value': 13000.0},
    {'label': 'Other Allowance', 'value': 15000.0},
  ].obs;

  final deductionsBreakdown = [
    {'label': 'Employee PF Contribution', 'value': 30000.0},
    {'label': 'Income Tax', 'value': 13000.0},
    {'label': 'Insurance', 'value': 15000.0},
  ].obs;

  void onInit() {
    super.onInit();
    loadChartData();
  }

  void loadChartData() {
    chartSections.value = [
      PieChartSectionData(
        // value: 40,
        // title: '40%',
        color: AppColors.rejected,
        radius: 15,
      ),
      PieChartSectionData(
        // value: 30,
        // title: '30%',
        color: AppColors.primaryColor,
        radius: 15,
      ),
    ];
  }
}
