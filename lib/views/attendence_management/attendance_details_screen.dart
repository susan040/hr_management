import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class AttendanceDetailsScreen extends StatelessWidget {
  const AttendanceDetailsScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Divider(
              thickness: 0.7,
              color: AppColors.borderColor,
            ),
            SizedBox(height: 15),
            ClipRRect(
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                fit: BoxFit.cover,
                height: 218,
                width: 207,
                imageUrl:
                    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUjE0Lifi2vFDlbtFjgQSwfMB3rfknaKL838HwGlNWPHMyDU2E",
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/blank_profile.jpg",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Ms.Swastika Banstola",
              style: CustomTextStyles.f14W500(color: AppColors.primaryColor),
            ),
            SizedBox(height: 30),
            Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
              //height: 158,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: AppColors.lGrey),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.lGrey,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(2, 3))
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Employee ID",
                        style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor),
                      ),
                      Text(
                        "Check In",
                        style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ID 12345678",
                        style: CustomTextStyles.f12W500(
                            color: AppColors.secondaryTextColor),
                      ),
                      Text(
                        "7:18 PM",
                        style: CustomTextStyles.f12W500(
                            color: AppColors.secondaryTextColor),
                      )
                    ],
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Location",
                        style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor),
                      ),
                      Text(
                        "Check out",
                        style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pokhara-25 Hemja Milanchowk",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: AppColors.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins')),
                      Text(
                        "7:18 PM",
                        style: CustomTextStyles.f12W500(
                            color: AppColors.secondaryTextColor),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
