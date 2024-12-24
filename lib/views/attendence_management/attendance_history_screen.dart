import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/attendance_screen_controller.dart';
import 'package:hr_management/models/attendance.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  AttendanceHistoryScreen({super.key});
  final c = Get.put(AttendanceScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Attendance History",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 0.7,
            color: AppColors.shadowColor,
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => c.changeMonth(-1),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    Text(
                      "${DateFormat('MMMM').format(DateTime(c.selectedYear.value, c.selectedMonth.value))} ${c.selectedYear.value}",
                      style: CustomTextStyles.f14W600(
                          color: AppColors.primaryColor),
                    ),
                    IconButton(
                      onPressed: () => c.changeMonth(1),
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: c.attendanceList.length,
                  itemBuilder: (context, index) {
                    final attendance = c.attendanceList[index];
                    return AttendanceTile(attendance: attendance);
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class AttendanceTile extends StatelessWidget {
  final Attendance attendance;

  const AttendanceTile({Key? key, required this.attendance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 6),
      padding: EdgeInsets.only(left: 10, right: 29, top: 10, bottom: 10),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: attendance.isAbsent
            ? AppColors.rejected
            : attendance.isToday
                ? AppColors.extraWhite
                : AppColors.extraWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 1,
              color: AppColors.lGrey,
              offset: Offset(1, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 66,
            decoration: BoxDecoration(
              color: AppColors.extraWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 0.5, color: AppColors.borderColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  attendance.date,
                  style: CustomTextStyles.f12W500(
                    color: attendance.isAbsent
                        ? AppColors.rejected
                        : AppColors.primaryColor,
                  ),
                ),
                Text(
                  attendance.day,
                  style: CustomTextStyles.f12W500(
                    color: attendance.isAbsent
                        ? AppColors.rejected
                        : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Check in",
                  style: CustomTextStyles.f14W500(
                    color: attendance.isAbsent
                        ? AppColors.extraWhite
                        : AppColors.primaryColor,
                  )),
              SizedBox(height: 3.5),
              Text(attendance.checkIn,
                  style: CustomTextStyles.f12W400(
                    color: attendance.isAbsent
                        ? AppColors.extraWhite
                        : AppColors.secondaryTextColor,
                  )),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Check Out",
                  style: CustomTextStyles.f14W500(
                    color: attendance.isAbsent
                        ? AppColors.extraWhite
                        : AppColors.rejected,
                  )),
              SizedBox(height: 3.5),
              Text(attendance.checkOut,
                  style: CustomTextStyles.f12W400(
                    color: attendance.isAbsent
                        ? AppColors.extraWhite
                        : AppColors.secondaryTextColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
