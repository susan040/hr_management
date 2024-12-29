import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';

class ShiftSwappingController extends GetxController {
  var selectedIndex = 0.obs;
  RxString selectShiftType = ''.obs;
  RxString selectShiftWith = ''.obs;
  final selectDateController = TextEditingController();
  final selectTimeController = TextEditingController();
  final reasonController = TextEditingController();
  var selectedOption = "Day".obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  final List<String> shiftTypes = ['Day', 'Night'];
  void updateShift(String value) {
    selectShiftType.value = value;
  }

  final List<String> shiftWithName = [
    'Susan Thapa',
    'Seema Thapa',
    'Swostika Bastola'
  ];
  void updateShiftWithName(String value) {
    selectShiftWith.value = value;
  }

  var desireDate = DateTime.now().obs;
  var desireTime = TimeOfDay.now().obs;
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
}
