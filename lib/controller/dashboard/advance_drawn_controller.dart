import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';

class AdvanceDrawnController extends GetxController {
  final drawnFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  var desireDate = DateTime.now().obs;
  final selectDateController = TextEditingController();

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

  final List<Map<String, dynamic>> users = [
    {'name': 'Seema Thapa', 'role': '(Staff)', 'isChecked': true},
    {'name': 'Susan Thapa', 'role': '(Staff)', 'isChecked': false},
    {'name': 'Kranti Baral', 'role': '', 'isChecked': false},
    {'name': 'Swostika Baral', 'role': '', 'isChecked': false},
    {'name': 'Omraj Paudel', 'role': '(Admin)', 'isChecked': false},
    {'name': 'Sandesh Timilsina', 'role': '(Manager)', 'isChecked': false},
    {'name': 'Ram Thapa', 'role': '', 'isChecked': false},
    {'name': 'Shyam Thapa', 'role': '', 'isChecked': false},
    {'name': 'Gita Adhikari', 'role': '', 'isChecked': false},
    {'name': 'Sita Rana', 'role': '', 'isChecked': false},
    {'name': 'Isha Rana', 'role': '', 'isChecked': false},
  ].obs;

  void selectOnlyOne(int selectedIndex) {
    for (int i = 0; i < users.length; i++) {
      users[i]['isChecked'] = i == selectedIndex;
    }
    update(); 
  }
}
