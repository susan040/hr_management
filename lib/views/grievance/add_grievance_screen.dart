import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/grievance_redressal_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/views/grievance/grievance_success_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class AddGrievanceScreen extends StatelessWidget {
  final c = Get.put(GrievanceRedressalController());
  AddGrievanceScreen({super.key});

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
            "Add Grievance",
            style: CustomTextStyles.f14W600(color: AppColors.textColor),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
          padding: EdgeInsets.only(left: 14, right: 14, top: 25, bottom: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.borderColor),
              color: AppColors.lGrey,
              borderRadius: BorderRadius.circular(6)),
          child: SingleChildScrollView(
            child: Form(
                key: c.grievanceFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "To",
                          style: CustomTextStyles.f14W500(),
                        ),
                        SizedBox(width: 10),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(canvasColor: AppColors.extraWhite),
                          child: Obx(() => Container(
                                height: 50,
                                width: Get.width / 2,
                                color: AppColors.extraWhite,
                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  value: c.selectLeaveType.value.isEmpty
                                      ? null
                                      : c.selectLeaveType.value,
                                  hint: Text(
                                    "Select",
                                    style: CustomTextStyles.f12W400(
                                        color: AppColors.secondaryTextColor),
                                  ),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        bottom: 10, left: 14, right: 14),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.secondaryColor,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1),
                                    ),
                                  ),
                                  items: c.leaveTypes
                                      .map((option) => DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(
                                              option,
                                              style: CustomTextStyles.f12W400(),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    c.updateLeaveType(value!);
                                  },
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Subject",
                      style: CustomTextStyles.f14W500(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                        hint: "Subject",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: 18),
                    Text(
                      "Issue",
                      style: CustomTextStyles.f14W500(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: AppColors.extraWhite,
                      child: TextFormField(
                        style: CustomTextStyles.f12W400(
                            color: AppColors.backGroundDark),
                        maxLines: 4,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Type here..",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.secondaryColor),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.errorColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.primaryColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.errorColor),
                          ),
                          hintStyle: CustomTextStyles.f12W400(
                              color: AppColors.secondaryTextColor),
                        ),
                        controller: c.reasonController,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Suggested Solution",
                      style: CustomTextStyles.f14W500(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: AppColors.extraWhite,
                      child: TextFormField(
                        style: CustomTextStyles.f12W400(
                            color: AppColors.backGroundDark),
                        maxLines: 4,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Type here..",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.secondaryColor),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.errorColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.primaryColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.errorColor),
                          ),
                          hintStyle: CustomTextStyles.f12W400(
                              color: AppColors.secondaryTextColor),
                        ),
                        controller: c.reasonController,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Priority",
                      style: CustomTextStyles.f14W500(),
                    ),
                    SizedBox(height: 10),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: AppColors.extraWhite),
                      child: Obx(() => Container(
                            height: 50,
                            color: AppColors.extraWhite,
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              value: c.selectLeaveType.value.isEmpty
                                  ? null
                                  : c.selectLeaveType.value,
                              hint: Text(
                                "Select",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.secondaryTextColor),
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, left: 14, right: 14),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.secondaryColor,
                                      width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1),
                                ),
                              ),
                              items: c.leaveTypes
                                  .map((option) => DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(
                                          option,
                                          style: CustomTextStyles.f12W400(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                c.updateLeaveType(value!);
                              },
                            ),
                          )),
                    ),
                    SizedBox(height: 30),
                    CustomElevatedButton(
                        title: "Submit",
                        onTap: () {
                          Get.to(() => GrievanceSuccessScreen());
                        }),
                  ],
                )),
          ),
        ));
  }
}
