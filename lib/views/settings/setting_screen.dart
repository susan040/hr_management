import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/auth/login_screen.dart';
import 'package:hr_management/views/settings/about_us_screen.dart';
import 'package:hr_management/views/settings/edit_profile_screen.dart';
import 'package:hr_management/views/settings/faq_screen.dart';
import 'package:hr_management/views/settings/privacy_policy_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.extraWhite,
          title: Text(
            "Profile",
            style: CustomTextStyles.f14W600(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: InkWell(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Icon(
                    Icons.logout,
                    color: AppColors.rejected,
                    size: 22,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                  imageUrl:
                      "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUjE0Lifi2vFDlbtFjgQSwfMB3rfknaKL838HwGlNWPHMyDU2E",
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/blank_profile.jpg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Emily Johnson",
              style: CustomTextStyles.f14W600(),
            ),
            SizedBox(height: 2),
            Text(
              "Content Manager",
              style: CustomTextStyles.f12W400(color: AppColors.primaryColor),
            ),
            Text(
              "emilyjohnson@gmail.com",
              style:
                  CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
            ),
            Text(
              "984691700",
              style:
                  CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
            ),
            Text(
              "chauthe,Pokhara-14",
              style:
                  CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
            ),
            SizedBox(height: 9),
            InkWell(
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
              child: Container(
                height: 33,
                width: 150,
                decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 1, color: AppColors.primaryColor)),
                child: Center(
                  child: Text(
                    "Edit Profile",
                    style: CustomTextStyles.f12W400(),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 20,
              ),
              width: double.infinity,
              height: Get.height / 1.9,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.lGrey,
                        offset: Offset(0, -1.5))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: CustomTextStyles.f14W600(),
                  ),
                  SizedBox(height: 14),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child:
                                      SvgPicture.asset(ImagePath.myLocation)),
                            ),
                            SizedBox(width: 18),
                            Text(
                              "My Location",
                              style: CustomTextStyles.f12W400(),
                            ),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.rightArrow,
                            color: AppColors.backGroundDark),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(() => PrivacyPolicyScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: SvgPicture.asset(ImagePath.privacy)),
                            ),
                            SizedBox(width: 18),
                            Text(
                              "Privacy Policy",
                              style: CustomTextStyles.f12W400(),
                            ),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.rightArrow,
                            color: AppColors.backGroundDark),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(() => FaqScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: SvgPicture.asset(ImagePath.faq)),
                            ),
                            SizedBox(width: 18),
                            Text(
                              "FAQ",
                              style: CustomTextStyles.f12W400(),
                            ),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.rightArrow,
                            color: AppColors.backGroundDark),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(() => AboutUsScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child:
                                      SvgPicture.asset(ImagePath.helpCenter)),
                            ),
                            SizedBox(width: 18),
                            Text(
                              "About Us",
                              style: CustomTextStyles.f12W400(),
                            ),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.rightArrow,
                            color: AppColors.backGroundDark),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Divider(
                    color: const Color.fromARGB(255, 218, 217, 216),
                  ),
                  SizedBox(height: 14),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: SvgPicture.asset(
                                ImagePath.face,
                                color: AppColors.primaryColor,
                                height: 20,
                                width: 20,
                              )),
                            ),
                            SizedBox(width: 18),
                            Text(
                              "Set Face Recognition",
                              style: CustomTextStyles.f12W400(),
                            ),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.rightArrow,
                            color: AppColors.backGroundDark),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.lGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: SvgPicture.asset(
                                ImagePath.chat,
                                color: AppColors.primaryColor,
                              )),
                            ),
                            SizedBox(width: 18),
                            Text(
                              "Chat with Manager",
                              style: CustomTextStyles.f12W400(),
                            ),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.rightArrow,
                            color: AppColors.backGroundDark),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
