import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/leave_history_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/views/leave_application/add_leave_application_screen.dart';

class LeaveHistoryScreen extends StatelessWidget {
  final c = Get.put(LeaveHistoryController());
  LeaveHistoryScreen({super.key});

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
          "Leave Application History",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Center(
            child: Text(
              "Rem.Leave",
              style: CustomTextStyles.f14W400(color: AppColors.primaryColor),
            ),
          ),
        ),
        Center(
          child: Text(
            "0",
            style: CustomTextStyles.f14W400(color: AppColors.primaryColor),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 55, right: 55, top: 14, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Remaining Leave",
                style: CustomTextStyles.f12W400(),
              ),
              Text(
                "Leave Used",
                style: CustomTextStyles.f12W400(),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 22,
            right: 22,
          ),
          decoration: BoxDecoration(
              color: AppColors.lGrey, borderRadius: BorderRadius.circular(3.5)),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTab(
                    label: 'All',
                    isSelected: c.selectedIndex.value == 0,
                    onTap: () => c.changeTab(0),
                  ),
                  buildTab(
                    label: 'Casual Leave',
                    isSelected: c.selectedIndex.value == 1,
                    onTap: () => c.changeTab(1),
                    hasIcon: true,
                  ),
                  buildTab(
                    label: 'Sick Leave',
                    isSelected: c.selectedIndex.value == 2,
                    onTap: () => c.changeTab(2),
                    hasIcon: true,
                  ),
                ],
              )),
        ),
        // Tab Content
        Expanded(
          child: Obx(() {
            switch (c.selectedIndex.value) {
              case 1:
                return ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return LeaveApplicationWidget(status: "Pending");
                    });
              case 2:
                return ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return LeaveApplicationWidget(status: "Rejected");
                    });

              default:
                return ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return LeaveApplicationWidget(status: "Approved");
                    });
            }
          }),
        ),
      ]),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => AddLeaveApplicationScreen());
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 38,
          width: 130,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  Icons.add,
                  color: AppColors.backGroundDark,
                  size: 19,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "App Leave",
                style: CustomTextStyles.f14W400(color: AppColors.extraWhite),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool hasIcon = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: Get.width / 3.5,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon)
              Icon(
                Icons.circle,
                size: 8.0,
                color:
                    isSelected ? AppColors.extraWhite : AppColors.primaryColor,
              ),
            if (hasIcon) SizedBox(width: 4),
            Text(
              label,
              style: CustomTextStyles.f12W500(
                color:
                    isSelected ? AppColors.extraWhite : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaveApplicationWidget extends StatelessWidget {
  final String status;

  const LeaveApplicationWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case "approved":
        statusColor = AppColors.accepted;
        break;
      case "rejected":
        statusColor = AppColors.rejected;
        break;
      case "pending":
        statusColor = AppColors.skyBlue;
        break;
      default:
        statusColor = AppColors.secondaryTextColor;
    }

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 6),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.extraWhite,
        border: Border.all(width: 1, color: AppColors.lGrey),
        boxShadow: [
          BoxShadow(
            color: AppColors.lGrey,
            blurRadius: 3,
            spreadRadius: 2,
            offset: const Offset(2, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.cover,
                  height: 45,
                  width: 45,
                  imageUrl:
                      "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUjE0Lifi2vFDlbtFjgQSwfMB3rfknaKL838HwGlNWPHMyDU2E",
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/blank_profile.jpg",
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Susan Thapa",
                    style: CustomTextStyles.f12W600(),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "11/05/2024 - 14/03/2024",
                    style: CustomTextStyles.f11W400(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "Sick Leave",
                    style: CustomTextStyles.f11W600(
                      color: AppColors.redColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 18,
            width: 72,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                status,
                style: CustomTextStyles.f10W400(
                  color: AppColors.extraWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
