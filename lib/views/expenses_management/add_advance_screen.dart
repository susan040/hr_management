import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/advance_drawn_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class AddAdvanceScreen extends StatelessWidget {
  final c = Get.put(AdvanceDrawnController());
  AddAdvanceScreen({super.key});

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
          "Add Advance Drawn",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.drawnFormKey,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                CustomTextField(
                  validator: Validators.checkFieldEmpty,
                  hint: "Enter your name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 18),
                Text("Amount", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                CustomTextField(
                  validator: Validators.checkFieldEmpty,
                  hint: "Enter amount",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 18),
                Text("Date", style: CustomTextStyles.f14W500()),
                SizedBox(height: 10),
                CustomTextField(
                  readOnly: true,
                  onTap: () => c.chooseDate(context),
                  controller: c.selectDateController,
                  validator: Validators.checkFieldEmpty,
                  suffixIconPath: ImagePath.calender,
                  hint: "YYYY-MM-DD",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.none,
                ),
                SizedBox(height: 18),
                Text("By", style: CustomTextStyles.f14W500()),
                SizedBox(height: 4),
                GetBuilder<AdvanceDrawnController>(
                  builder: (c) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: c.users.length,
                      itemBuilder: (context, index) {
                        final user = c.users[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                c.selectOnlyOne(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 4, top: 8, bottom: 8),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: user['isChecked']
                                        ? AppColors.primaryColor
                                        : AppColors.secondaryColor,
                                    width: 2,
                                  ),
                                  color: user['isChecked']
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                                ),
                                child: user['isChecked']
                                    ? Icon(
                                        Icons.check,
                                        size: 15,
                                        color: AppColors.extraWhite,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(width: 12),
                            RichText(
                              text: TextSpan(
                                text: user['name'],
                                style: CustomTextStyles.f14W500(
                                    color: AppColors.textColor),
                                children: [
                                  if (user['role'] != '')
                                    TextSpan(
                                      text: ' ${user['role']}',
                                      style: CustomTextStyles.f14W500(
                                          color: AppColors.textColor),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: CustomElevatedButton(title: "Submit", onTap: () {}),
      ),
    );
  }
}
