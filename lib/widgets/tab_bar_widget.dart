import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/home_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/events_widgets.dart';
import 'package:hr_management/widgets/services_widgets.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.c,
  });

  final HomeScreenController c;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1,
          color: AppColors.lGrey,
        ),
        TabBar(
          onTap: (index) => c.changeTab(index),
          controller: c.tabController,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.primaryColor, width: 2),
            ),
          ),
          tabs: List.generate(3, (index) {
            return Tab(
              child: Obx(
                () {
                  bool isSelected = c.selectedIndex.value == index;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        index == 0
                            ? ImagePath.meetings
                            : index == 1
                                ? ImagePath.events
                                : ImagePath.holiday,
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.secondaryTextColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        index == 0
                            ? "Meetings"
                            : index == 1
                                ? "Events"
                                : "Holidays",
                        style: CustomTextStyles.f14W400(
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.secondaryTextColor),
                      ),
                    ],
                  );
                },
              ),
            );
          }),
        ),
        Obx(() {
          return IndexedStack(
            index: c.selectedIndex.value,
            children: [
              Column(
                children: [
                  MeetingCard(
                    name: "Susan Thapa",
                    colorName: AppColors.lightPink,
                    chatName: "On Office",
                    departmentName: "Marketing",
                    departmentColor: Colors.pink,
                    onTap: () {
                      c.toggleMoreDetails1();
                    },
                  ),
                  MeetingCard(
                    name: "Susan Thapa",
                    colorName: AppColors.lightBlue,
                    chatName: "On Google meet",
                    departmentName: "Product Manager",
                    departmentColor: AppColors.darkblue,
                    onTap: () {
                      c.toggleMoreDetails2();
                    },
                  ),
                  SizedBox(height: 14)
                ],
              ),
              EventsWidgets(),
              HolidaysWidget()
            ],
          );
        }),
      ],
    );
  }
}

class MeetingCard extends StatelessWidget {
  MeetingCard({
    super.key,
    required this.name,
    required this.colorName,
    required this.chatName,
    required this.departmentName,
    required this.departmentColor,
    required this.onTap,
  });
  final String name;
  final Color colorName;
  final String chatName;
  final String departmentName;
  final Color departmentColor;
  final VoidCallback onTap;
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isOpen = controller.moreDetailOpen1.value;
      if (isOpen) {
        return GoogleMeetingDetailWidget();
      } else {
        return Container(
          margin: EdgeInsets.only(top: 14, left: 16, right: 16),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colorName,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Meeting with ${name}",
                      style: CustomTextStyles.f14W600()),
                  InkWell(
                    onTap: () {
                      onTap;
                    },
                    child: Container(
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                          color: AppColors.extraWhite,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: colorName,
                      ),
                    ),
                  ),
                ],
              ),
              // Time
              Text("9:00 AM – 10:00 AM",
                  style: CustomTextStyles.f12W400(
                      color: AppColors.secondaryTextColor)),
              Container(
                margin: EdgeInsets.only(top: 18, bottom: 14),
                padding: EdgeInsets.only(top: 4, bottom: 4),
                height: 40,
                width: Get.width / 2.89,
                decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                              "https://t4.ftcdn.net/jpg/06/89/01/89/360_F_689018937_XTvW7nuaBVV8EzAyT2CCUoK9PDpSZNIO.jpg"),
                        ),
                        Positioned(
                            left: 37,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://xinva.ai/wp-content/uploads/2023/12/99.jpg"))),
                            )),
                        Positioned(
                            left: 64,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://img.freepik.com/premium-photo/3d-pixar-character-design-jin-with-short-beard-smaller-eyes-glasses_899449-139427.jpg"))),
                            )),
                        Positioned(
                          left: 92,
                          child: Container(
                            height: 33,
                            width: 33,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child:
                                  Text("+4", style: CustomTextStyles.f14W600()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(chatName,
                      style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor)),
                  Container(
                    height: 25,
                    padding: EdgeInsets.only(bottom: 2, right: 10, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: departmentColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(departmentName,
                          style:
                              CustomTextStyles.f12W400(color: departmentColor)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    });
  }
}
