import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/home_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/services_widgets.dart';
import 'package:hr_management/widgets/tab_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final c = Get.put(HomeScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 14, bottom: 8),
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                          imageUrl: "",
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/profile.jpeg",
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome! 👋",
                              style: CustomTextStyles.f18W600(),
                            ),
                            Text(
                              "Emily Johnson",
                              style: CustomTextStyles.f14W400(),
                            ),
                          ]),
                    ]),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 14,
                          right: 20,
                        ),
                        child: SvgPicture.asset(
                          ImagePath.notification,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 10,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              color: AppColors.rejected,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              "3",
                              style: CustomTextStyles.f10W400(
                                  color: AppColors.extraWhite),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
                height: 129,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: AppColors.lGrey,
                          offset: Offset(2, 2))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Content Manager",
                          style: CustomTextStyles.f16W600(),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: SvgPicture.asset(ImagePath.calender)),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "11 November | 2024",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "01:26:31",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.rejected),
                            ),
                            SizedBox(width: Get.width / 4.8),
                            Text(
                              "Time Remaining",
                              style: CustomTextStyles.f14W400(),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Container(
                          height: 0.5,
                          width: Get.width / 1.65,
                          color: AppColors.secondaryTextColor,
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "00:00",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor),
                            ),
                            SizedBox(width: Get.width / 3),
                            Text(
                              "Check Out",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 10),
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.6)),
                          child:
                              Center(child: SvgPicture.asset(ImagePath.face)),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Check In",
                            style: CustomTextStyles.f14W600(
                                color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Services", style: CustomTextStyles.f16W600()),
                    Text("View All",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.primaryColor)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesWidget(
                        iconContainerColor: AppColors.blue,
                        iconPath: ImagePath.attendanceManagement,
                        title: "Attendance",
                        subtitle: "Management"),
                    ServicesWidget(
                        iconContainerColor: AppColors.purple,
                        iconPath: ImagePath.appeal,
                        title: "Attendance",
                        subtitle: "Appeal"),
                    ServicesWidget(
                        iconContainerColor: AppColors.yellow,
                        iconPath: ImagePath.leaveApplication,
                        title: "Leave",
                        subtitle: "Application"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 14, right: 16, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesWidget(
                        iconContainerColor: AppColors.lightGreen,
                        iconPath: ImagePath.paySlip,
                        title: "Pay Slip",
                        subtitle: "Management"),
                    ServicesWidget(
                        iconContainerColor: AppColors.darkblue,
                        iconPath: ImagePath.grievance,
                        title: "Grievance",
                        subtitle: "Redressal"),
                    ServicesWidget(
                        iconContainerColor: AppColors.darkRed,
                        iconPath: ImagePath.shift,
                        title: "Shift",
                        subtitle: "Swapping"),
                  ],
                ),
              ),
              TabBarWidget(c: c),
            ],
          ),
        ),
      ),
    );
  }
}
