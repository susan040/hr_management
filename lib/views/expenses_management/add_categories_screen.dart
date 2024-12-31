import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/expenses_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoriesScreen extends StatelessWidget {
  final c = Get.put(ExpensesScreenController());
  AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
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
        centerTitle: true,
        title: Text(
          "Categories",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
        child: Column(
          children: [
            Row(
              children: [
                CategoriesWidget(
                    name: "Travel",
                    image: ImagePath.travelIcon,
                    color: AppColors.primaryColor),
                SizedBox(width: 18),
                CategoriesWidget(
                    name: "Education",
                    image: ImagePath.education,
                    color: AppColors.green)
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CategoriesWidget(
                    name: "Expenditure",
                    image: ImagePath.expenditure,
                    color: AppColors.lightPurple),
                SizedBox(width: 18),
                CategoriesWidget(
                    name: "Social",
                    image: ImagePath.social,
                    color: AppColors.lightDarkBlue)
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CategoriesWidget(
                    name: "Repair",
                    image: ImagePath.repair,
                    color: AppColors.amberYellow),
                SizedBox(width: 18),
                CategoriesWidget(
                    name: "T.A", image: ImagePath.tA, color: AppColors.rejected)
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CategoriesWidget(
                    name: "Health",
                    image: ImagePath.health,
                    color: AppColors.brown),
                SizedBox(width: 18),
                CategoriesWidget(
                    name: "D.A", image: ImagePath.dA, color: AppColors.skyBlue)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    super.key,
    required this.name,
    required this.image,
    required this.color,
  });
  final String name;
  final String image;
  final Color color;
  final c = Get.put(ExpensesScreenController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: AppColors.extraWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            context: context,
            builder: (context) => Form(
                  key: c.categoryFormKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, top: 30, bottom: 15),
                    child: Column(
                      children: [
                        Text(
                          "Enter Expenses Details",
                          style: CustomTextStyles.f14W600(),
                        ),
                        SizedBox(height: 18),
                        CustomTextField(
                            hint: "Enter Amount",
                            validator: Validators.checkFieldEmpty,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number),
                        SizedBox(height: 14),
                        CustomTextField(
                            readOnly: true,
                            onTap: () => c.chooseDate(context),
                            controller: c.selectDateController,
                            validator: Validators.checkFieldEmpty,
                            suffixIconPath: ImagePath.calender,
                            hint: "YYYY-MM-DD",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.none),
                        SizedBox(height: 14),
                        CustomTextField(
                            hint: "Enter Note",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text),
                        SizedBox(height: 14),
                        Center(
                          child: ClipRRect(
                            child: Obx(
                              () => (c.image.value != null)
                                  ? Image.file(
                                      c.image.value!,
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    )
                                  : CachedNetworkImage(
                                      placeholder: (context, url) => SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator()),
                                      fit: BoxFit.fill,
                                      height: 120,
                                      width: 120,
                                      imageUrl: ImagePath.noImage,
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        ImagePath.noImage,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width: 120,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: Get.width / 1.3,
                                child: CustomElevatedButton(
                                    title: "Save", onTap: () {})),
                            PopupMenuButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 40,
                              ),
                              itemBuilder: (ctx) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    "Camera ",
                                    style: CustomTextStyles.f14W400(
                                        color: AppColors.textColor),
                                  ),
                                  onTap: () {
                                    c.pickImage(ImageSource.camera);
                                  },
                                ),
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    "Gallery",
                                    style: CustomTextStyles.f14W400(
                                        color: AppColors.textColor),
                                  ),
                                  onTap: () {
                                    c.pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 14, top: 4, bottom: 4),
        height: 65,
        width: Get.width / 2.3,
        decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: AppColors.borderColor)),
        child: Row(
          children: [
            Container(
              height: 47,
              width: 47,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.extraWhite,
                  border: Border.all(width: 4, color: color)),
              child: Center(
                  child: Image.asset(
                image,
                height: 28,
                width: 28,
              )),
            ),
            SizedBox(width: 15),
            Text(
              name,
              style: CustomTextStyles.f14W500(),
            )
          ],
        ),
      ),
    );
  }
}
