import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/views/attendence_appeal/add_appeal_screen.dart';

class AppealHistoryScreen extends StatelessWidget {
  const AppealHistoryScreen({super.key});

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
          "Attendance Appeal History",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (contex, index) {
            return AppealHistoryWidget(
                name: "Susan Thapa",
                reason:
                    "Feeling unwell, migraines, or other sudden health concerns.",
                time: "09:42 AM",
                date: "(11/10/24)");
          }),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Image.asset(
      //         ImagePath.attendanceAppeal,
      //         height: 260,
      //         width: 165,
      //       ),
      //     ),
      //     SizedBox(height: 30),
      //     Text(
      //       "No attendance appeal history found \n"
      //       "at the moment. Pull down to refresh.",
      //       style:
      //           CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
      //     ),
      //     SizedBox(
      //       height: 140,
      //     )
      //   ],
      // ),

      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => AddAppealScreen());
        },
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.add,
            color: AppColors.extraWhite,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class AppealHistoryWidget extends StatelessWidget {
  const AppealHistoryWidget({
    super.key,
    required this.name,
    required this.reason,
    required this.time,
    required this.date,
  });
  final String name;
  final String reason;
  final String time;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 4),
      padding: EdgeInsets.only(left: 14, right: 14, top: 15, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColors.secondaryColor),
          boxShadow: [
            BoxShadow(
                color: AppColors.lGrey,
                spreadRadius: 3,
                blurRadius: 2,
                offset: Offset(2, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                  height: 55,
                  width: 55,
                  imageUrl:
                      "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUjE0Lifi2vFDlbtFjgQSwfMB3rfknaKL838HwGlNWPHMyDU2E",
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/blank_profile.jpg",
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: CustomTextStyles.f14W600(),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 170,
                    child: Text(
                      reason,
                      style: CustomTextStyles.f10W400(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: CustomTextStyles.f12W500(),
              ),
              SizedBox(height: 6),
              Text(
                date,
                style: CustomTextStyles.f10W400(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
