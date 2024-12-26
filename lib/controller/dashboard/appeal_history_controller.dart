import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class AppealHistoryController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var desireTime = TimeOfDay.now().obs;
  final selectTimeController = TextEditingController();
  final reasonController = TextEditingController();
  DateTime get today => DateTime.now();
  DateTime get yesterday => DateTime.now().subtract(Duration(days: 1));
  DateTime get dayBeforeYesterday => DateTime.now().subtract(Duration(days: 2));
  bool isSelectableDate(DateTime day) {
    return isSameDay(day, today) ||
        isSameDay(day, yesterday) ||
        isSameDay(day, dayBeforeYesterday);
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (isSelectableDate(day)) {
      selectedDay.value = day;
    }
  }

  chooseTime(BuildContext context) async {
    log("choose time");
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            hintColor: AppColors.primaryColor,
            timePickerTheme: const TimePickerThemeData(
              dialHandColor: AppColors.primaryColor,
              hourMinuteTextColor: AppColors.primaryColor,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedTime != null) {
      desireTime.value = pickedTime;
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      selectTimeController.text = formattedTime;
      log('Selected Time: ${selectTimeController.text}');
    }
  }
}
