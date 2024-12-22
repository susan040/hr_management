import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
        centerTitle: false,
        title: Text(
          "Notifications",
          style: CustomTextStyles.f14W600(color: AppColors.backGroundDark),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Mark all as read",
                style: CustomTextStyles.f11W400(color: AppColors.primaryColor),
              ),
            ),
          )
        ],
      ),
      body: Column(
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
          NotificationWidget(
              text: "Reminder for your meetings",
              text2: "Learn more about managing account info and activity",
              time: "6min ago"),
          NotificationWidget(
              text: "Reminder for your meetings",
              text2: "Learn more about managing account info and activity",
              time: "6min ago"),
          SizedBox(height: 18),
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
                width: Get.width / 1.37,
                color: AppColors.shimmerBase,
              )
            ],
          ),
          NotificationWidget(
              text: "Reminder for your meetings",
              text2: "Learn more about managing account info and activity",
              time: "6min ago"),
          NotificationWidget(
              text: "Reminder for your meetings",
              text2: "Learn more about managing account info and activity",
              time: "6min ago")
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.text,
    required this.text2,
    required this.time,
  });
  final String text;
  final String text2;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 15),
      padding: EdgeInsets.only(right: 12, top: 10),
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.extraWhite,
          border: Border.all(width: 1, color: AppColors.lGrey),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.lGrey,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(2, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12, right: 10),
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: SvgPicture.asset(
                  ImagePath.notification,
                  height: 23,
                  width: 20,
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: CustomTextStyles.f12W600(),
                  ),
                  SizedBox(height: 2.5),
                  SizedBox(
                    width: 210,
                    child: Text(
                      text2,
                      style: CustomTextStyles.f10W400(
                          color: AppColors.secondaryTextColor),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            time,
            style:
                CustomTextStyles.f11W400(color: AppColors.secondaryTextColor),
          )
        ],
      ),
    );
  }
}
