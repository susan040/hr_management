import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/appeal_history_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AddAppealScreen extends StatelessWidget {
  final c = Get.put(AppealHistoryController());
  AddAppealScreen({super.key});

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
          "Add Attendance Appeal",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 18),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, bottom: 14, top: 4),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Obx(() {
                    return TableCalendar(
                      firstDay: DateTime(2020, 1, 1),
                      lastDay: DateTime(2030, 12, 31),
                      focusedDay: c.selectedDay.value,
                      selectedDayPredicate: (day) =>
                          isSameDay(day, c.selectedDay.value),
                      onDaySelected: c.onDaySelected,
                      daysOfWeekHeight: 22,
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: CustomTextStyles.f14W600(
                              color: AppColors.errorColor),
                          weekdayStyle: CustomTextStyles.f14W600(
                              color: AppColors.extraWhite)),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        titleTextStyle: CustomTextStyles.f14W600(
                            color: AppColors.extraWhite),
                        leftChevronIcon:
                            Icon(Icons.chevron_left, color: Colors.white),
                        rightChevronIcon:
                            Icon(Icons.chevron_right, color: Colors.white),
                        formatButtonVisible: false,
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.brown,
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: CustomTextStyles.f12W400(
                            color: AppColors.extraWhite),
                        todayTextStyle: CustomTextStyles.f12W400(
                            color: AppColors.extraWhite),
                        selectedTextStyle: TextStyle(color: Colors.white),
                      ),
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      enabledDayPredicate: (day) => c.isSelectableDate(day),
                    );
                  }),
                ),
                SizedBox(height: 16),
                Text("Selected Date:", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                Obx(() {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.extraWhite,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            width: 1, color: AppColors.secondaryColor)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Container(
                          height: 63,
                          width: 1,
                          decoration:
                              BoxDecoration(color: AppColors.secondaryColor),
                        ),
                        SizedBox(width: 14),
                        Text(
                          '${DateFormat('yyyy-MM-dd').format(c.selectedDay.value)}',
                          style: CustomTextStyles.f12W400(),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(height: 18),
                Text("Time:", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                CustomTextField(
                    controller: c.selectTimeController,
                    readOnly: true,
                    onTap: () => c.chooseTime(context),
                    hint: "select time",
                    preIconPath: ImagePath.time,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
                SizedBox(height: 18),
                Text("Reason:", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                TextFormField(
                  style:
                      CustomTextStyles.f12W400(color: AppColors.backGroundDark),
                  maxLines: 6,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Write Message",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.secondaryColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.errorColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.primaryColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.errorColor),
                    ),
                    hintStyle: CustomTextStyles.f12W400(
                        color: AppColors.secondaryTextColor),
                  ),
                  controller: c.reasonController,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: CustomElevatedButton(title: "Submit", onTap: () {}),
      ),
    );
  }
}
