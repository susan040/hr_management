import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/edit_profile_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({
    super.key,
    required this.c,
  });

  final EditProfileController c;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Obx(
              () => (c.image.value != null)
                  ? Image.file(
                      c.image.value!,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )
                  : CachedNetworkImage(
                      placeholder: (context, url) => SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator()),
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                      imageUrl:
                          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUjE0Lifi2vFDlbtFjgQSwfMB3rfknaKL838HwGlNWPHMyDU2E",
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/blank_profile.jpg",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 100,
                      ),
                    ),
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 135,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.extraWhite,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                builder: (context) => Container(
                  padding: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 14, bottom: 14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              highlightColor: AppColors.extraWhite,
                              onTap: () {
                                c.pickImage(ImageSource.camera);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: AppColors.extraWhite,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors
                                                    .secondaryTextColor
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: Offset(2, 3))
                                          ]),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/camera.jpg",
                                          height: 57,
                                          width: 57,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  SizedBox(height: 12),
                                  Text(
                                    "Camera",
                                    style: CustomTextStyles.f12W600(),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              highlightColor: AppColors.extraWhite,
                              onTap: () {
                                c.pickImage(ImageSource.gallery);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: AppColors.extraWhite,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors
                                                    .secondaryTextColor
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: Offset(2, 3))
                                          ]),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/gallery.png",
                                          height: 57,
                                          width: 57,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  SizedBox(height: 12),
                                  Text(
                                    "Gallery",
                                    style: CustomTextStyles.f12W600(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              width: 30,
              height: 30,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.lGrey,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.backGroundDark.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 18,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
