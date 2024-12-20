import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/services_widgets.dart';

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
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
          "All Services",
          style: CustomTextStyles.f14W600(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServicesWidget(
                  iconContainerColor: AppColors.blue,
                  iconPath: ImagePath.attendanceManagement,
                  title: "Attendance",
                  subtitle: "Management",
                  onTap: () {},
                ),
                ServicesWidget(
                  iconContainerColor: AppColors.purple,
                  iconPath: ImagePath.appeal,
                  title: "Attendance",
                  subtitle: "Appeal",
                  onTap: () {},
                ),
                ServicesWidget(
                  iconContainerColor: AppColors.yellow,
                  iconPath: ImagePath.leaveApplication,
                  title: "Leave",
                  subtitle: "Application",
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 14,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServicesWidget(
                  iconContainerColor: AppColors.lightGreen,
                  iconPath: ImagePath.paySlip,
                  title: "Pay Slip",
                  subtitle: "Management",
                  onTap: () {},
                ),
                ServicesWidget(
                  iconContainerColor: AppColors.darkblue,
                  iconPath: ImagePath.grievance,
                  title: "Grievance",
                  subtitle: "Redressal",
                  onTap: () {},
                ),
                ServicesWidget(
                  iconContainerColor: AppColors.darkRed,
                  iconPath: ImagePath.shift,
                  title: "Shift",
                  subtitle: "Swapping",
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 14, right: 16, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServicesWidget(
                  iconContainerColor: AppColors.darkGreen,
                  iconPath: ImagePath.expense,
                  title: "Expense",
                  subtitle: "Management",
                  onTap: () {},
                ),
                ServicesWidget(
                  iconContainerColor: AppColors.lightblue,
                  iconPath: ImagePath.travel,
                  title: "Travel",
                  subtitle: "visiting",
                  onTap: () {},
                ),
                ServicesWidget(
                  iconContainerColor: AppColors.green,
                  iconPath: ImagePath.cash,
                  title: "Cash",
                  subtitle: "Recipt",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
