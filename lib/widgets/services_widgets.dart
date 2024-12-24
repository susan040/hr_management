import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/home_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';

class ServicesWidget extends StatelessWidget {
  final Color iconContainerColor;
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ServicesWidget({
    super.key,
    required this.iconContainerColor,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 105,
        width: 110,
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.lGrey),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 3,
              color: AppColors.lGrey,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              height: 105,
              width: 9,
              decoration: BoxDecoration(
                color: iconContainerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 43,
                  width: 43,
                  decoration: BoxDecoration(
                    color: iconContainerColor.withOpacity(0.27),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  title,
                  style: CustomTextStyles.f11W400(),
                ),
                Text(
                  subtitle,
                  style: CustomTextStyles.f11W400(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleMeetingDetailWidget extends StatelessWidget {
  GoogleMeetingDetailWidget({
    super.key,
  });
  final controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 14,
      ),
      padding: EdgeInsets.only(left: 18, right: 18, top: 14),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.lightPink, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meeting with Susan Thapa",
                  style: CustomTextStyles.f14W600(),
                ),
                SizedBox(height: 4),
                Text(
                  "Horizon Shift marketing first meeting.",
                  style: CustomTextStyles.f12W400(color: Colors.pink),
                ),
              ],
            ),
            Obx(() {
              return InkWell(
                onTap: () {
                  if (!controller.moreDetailOpen1.value) {
                    controller.toggleMoreDetails1();
                  } else {
                    controller.toggleMoreDetails2();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.brown,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    controller.moreDetailOpen1.value ||
                            controller.moreDetailOpen2.value
                        ? Icons.keyboard_arrow_down_outlined
                        : Icons.keyboard_arrow_up_outlined,
                    color: AppColors.extraWhite,
                  ),
                ),
              );
            })
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 12, right: 12, top: 9, bottom: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.extraWhite,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateTimeWidget(
                    image: ImagePath.clock, text: "8:00 AM - 9:00 AM"),
                Row(
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: AppColors.extraWhite,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: AppColors.lGrey)),
                      child: Center(
                          child: SvgPicture.asset(
                        ImagePath.attende,
                        height: 13,
                        width: 13,
                      )),
                    ),
                    SizedBox(width: 6),
                    Row(
                      children: [
                        Text(
                          "5 attendee",
                          style: CustomTextStyles.f10W600(),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "(4 Confirmed)",
                          style: CustomTextStyles.f10W400(
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, bottom: 3, left: 25),
                  padding: EdgeInsets.only(top: 2, bottom: 2, left: 2),
                  height: 30,
                  width: Get.width / 4.2,
                  decoration: BoxDecoration(
                      color: AppColors.extraWhite,
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(width: 1, color: AppColors.lGrey)),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
                          ),
                          Positioned(
                              left: 20,
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://xinva.ai/wp-content/uploads/2023/12/99.jpg"))),
                              )),
                          Positioned(
                              left: 41,
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://img.freepik.com/premium-photo/3d-pixar-character-design-jin-with-short-beard-smaller-eyes-glasses_899449-139427.jpg"))),
                              )),
                          Positioned(
                            left: 63,
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text("+4",
                                    style: CustomTextStyles.f10W600()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DateTimeWidget(
                    image: ImagePath.meetingNotification,
                    text: "15 min before"),
                DateTimeWidget(image: ImagePath.laurze, text: "Laura Perez"),
                DateTimeWidget(
                    image: ImagePath.googleMeet, text: "Google Meet"),
                Padding(
                  padding: const EdgeInsets.only(left: 28, bottom: 14),
                  child: Text(
                    "meet.google.com/bsa-ojgn-gms",
                    style: CustomTextStyles.f10W400(
                        color: AppColors.secondaryTextColor),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 33,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Join Meeting",
                        style: CustomTextStyles.f10W400(
                            color: AppColors.extraWhite),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Are you going to attend?",
                    style: CustomTextStyles.f10W600()),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 19,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.pink,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          "No",
                          style: CustomTextStyles.f10W400(color: Colors.pink),
                        )),
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 19,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.pink,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text(
                          "Yes",
                          style: CustomTextStyles.f10W400(color: Colors.pink),
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
                color: AppColors.extraWhite,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: AppColors.lGrey)),
            child: Center(
                child: SvgPicture.asset(
              image,
              height: 13,
              width: 13,
            )),
          ),
          SizedBox(width: 6),
          Text(
            text,
            style: CustomTextStyles.f10W600(),
          ),
        ],
      ),
    );
  }
}
