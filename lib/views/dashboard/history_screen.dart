import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Grievance History",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18, top: 16),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Mark all as read",
                style: CustomTextStyles.f12W400(color: AppColors.primaryColor),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Today",
                    style: CustomTextStyles.f12W400(
                        color: AppColors.secondaryTextColor),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.only(
                      top: 3,
                    ),
                    height: 1.2,
                    width: Get.width / 1.27,
                    color: AppColors.shimmerBase,
                  )
                ],
              ),
              SizedBox(height: 10),
              HistoryWidget(
                  containerColor: Colors.lightGreen,
                  name: "M",
                  text1: "To manager, Ralph Edwards",
                  text2: "wants to edit file.",
                  time: "18min ago"),
              SizedBox(height: 16),
              HistoryWidget(
                  containerColor: Colors.orange,
                  name: "M",
                  text1: "To manager, Ralph Edwards",
                  text2: "wants zzzzzs to edit file.",
                  time: "20min ago"),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yesterday",
                    style: CustomTextStyles.f12W400(
                        color: AppColors.secondaryTextColor),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.only(
                      top: 3,
                    ),
                    height: 1.2,
                    width: Get.width / 1.4,
                    color: AppColors.shimmerBase,
                  )
                ],
              ),
              SizedBox(height: 14),
              HistoryWidget(
                  containerColor: Colors.lightGreen,
                  name: "JW",
                  text1: "Jenny Wilson added file to",
                  text2: "Dark mode",
                  time: "23hour ago"),
              SizedBox(height: 16),
              HistoryWidget(
                  containerColor: Colors.orange,
                  name: "JW",
                  text1: "Jenny Wilson added file to",
                  text2: "Dark mode",
                  time: "23hour ago"),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "This week",
                    style: CustomTextStyles.f12W400(
                        color: AppColors.secondaryTextColor),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.only(
                      top: 3,
                    ),
                    height: 1.2,
                    width: Get.width / 1.4,
                    color: AppColors.shimmerBase,
                  )
                ],
              ),
              SizedBox(height: 14),
              HistoryWidget(
                  containerColor: Colors.lightGreen,
                  name: "JW",
                  text1: "Jenny Wilson completed create",
                  text2: "new component",
                  time: "4 days ago"),
              SizedBox(height: 16),
              HistoryWidget(
                  containerColor: Colors.orange,
                  name: "JW",
                  text1: "Jenny Wilson added file to",
                  text2: "Dark mode",
                  time: "6 days ago"),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.containerColor,
    required this.name,
    required this.text1,
    required this.text2,
    required this.time,
  });
  final Color containerColor;
  final String name;
  final String text1;
  final String text2;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.lGrey)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                    color: containerColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    name,
                    style: CustomTextStyles.f14W600(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: CustomTextStyles.f12W600(),
                    ),
                    SizedBox(height: 2),
                    Text(
                      text2,
                      style: CustomTextStyles.f12W400(
                          color: AppColors.secondaryTextColor),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              time,
              style:
                  CustomTextStyles.f11W400(color: AppColors.secondaryTextColor),
            ),
          )
        ],
      ),
    );
  }
}
