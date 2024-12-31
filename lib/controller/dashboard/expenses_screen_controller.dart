import 'dart:developer';
import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class ExpensesScreenController extends GetxController {
  var totalExpenses = 12.obs;
  final categoryFormKey = GlobalKey<FormState>();
  var chartSections = <PieChartSectionData>[].obs;
  var desireDate = DateTime.now().obs;
  final selectDateController = TextEditingController();
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  var expenses = [
    {
      "title": "T.A",
      "amount": 2800.00,
      "date": "20 NOV, 2024 | 11:00 am",
      "icon": Icons.directions_bus,
      "color": Colors.red,
    },
    {
      "title": "D.A",
      "amount": 1900.00,
      "date": "20 NOV, 2024 | 1:30 pm",
      "icon": Icons.shopping_cart,
      "color": Colors.blue,
    },
    {
      "title": "Misc. Expenditure",
      "amount": 900.00,
      "date": "20 NOV, 2024 | 3:00 pm",
      "icon": Icons.miscellaneous_services,
      "color": Colors.purple,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadChartData();
  }

  void loadChartData() {
    chartSections.value = [
      PieChartSectionData(
        value: 40,
        title: '40%',
        color: Colors.red,
        radius: 60,
      ),
      PieChartSectionData(
        value: 30,
        title: '30%',
        color: Colors.blue,
        radius: 60,
      ),
      PieChartSectionData(
        value: 30,
        title: '30%',
        color: Colors.purple,
        radius: 60,
      ),
    ];
  }

  chooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            hintColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      desireDate.value = pickedDate;
      selectDateController.text = desireDate.value.toString().split(" ")[0];
      log('Selected Date: ${selectDateController.text}');
    }
  }

  final picker = ImagePicker();
  Rxn<File> image = Rxn<File>();

  void pickImage(ImageSource source) async {
    log("Picking image from $source");
    final pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 100,
      maxHeight: 500,
      maxWidth: 500,
    );

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }
}
