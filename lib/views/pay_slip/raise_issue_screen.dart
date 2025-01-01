import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/pay_slip_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/pay_slip/issue_success_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class RaiseIssueScreen extends StatelessWidget {
  final c = Get.put(PaySlipController());
  RaiseIssueScreen({super.key});

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
          "Raise Issue",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: c.issueFormKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name", style: CustomTextStyles.f14W500()),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.nameController,
                      hint: "Enter your Full Name",
                      validator: Validators.checkFieldEmpty,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  SizedBox(height: 18),
                  Text("Email", style: CustomTextStyles.f14W500()),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.emailController,
                      hint: "Enter your Email",
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(height: 18),
                  Text("Issue", style: CustomTextStyles.f14W500()),
                  SizedBox(height: 10),
                  TextFormField(
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
                    controller: c.issueController,
                  ),
                  SizedBox(height: 18),
                  Text("Lable of Priority", style: CustomTextStyles.f14W500()),
                  SizedBox(height: 10),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: AppColors.extraWhite,
                          highlightColor: AppColors.extraWhite,
                          onTap: () {
                            c.selectedOption.value = "High";
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.extraWhite,
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        width: 1,
                                        color: c.selectedOption.value == "High"
                                            ? AppColors.primaryColor
                                            : AppColors.backGroundDark)),
                                child: c.selectedOption.value == "High"
                                    ? Container(
                                        height: 13,
                                        width: 13,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color:
                                              c.selectedOption.value == "High"
                                                  ? AppColors.primaryColor
                                                  : AppColors.extraWhite,
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "High",
                                style: CustomTextStyles.f14W500(),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: AppColors.extraWhite,
                          highlightColor: AppColors.extraWhite,
                          onTap: () {
                            c.selectedOption.value = "Medium";
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.extraWhite,
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            c.selectedOption.value == "Medium"
                                                ? AppColors.primaryColor
                                                : AppColors.backGroundDark)),
                                child: c.selectedOption.value == "Medium"
                                    ? Center(
                                        child: Container(
                                          height: 13,
                                          width: 13,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: c.selectedOption.value ==
                                                    "Medium"
                                                ? AppColors.primaryColor
                                                : AppColors.extraWhite,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              const Text("Medium"),
                            ],
                          ),
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: AppColors.extraWhite,
                          highlightColor: AppColors.extraWhite,
                          onTap: () {
                            c.selectedOption.value = "Low";
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.extraWhite,
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        width: 1,
                                        color: c.selectedOption.value == "Low"
                                            ? AppColors.primaryColor
                                            : AppColors.backGroundDark)),
                                child: c.selectedOption.value == "Low"
                                    ? Center(
                                        child: Container(
                                          height: 13,
                                          width: 13,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color:
                                                c.selectedOption.value == "Low"
                                                    ? AppColors.primaryColor
                                                    : AppColors.extraWhite,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              const Text("Low"),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 20),
                  Text("Note(Optional)", style: CustomTextStyles.f14W500()),
                  SizedBox(height: 10),
                  TextFormField(
                    style: CustomTextStyles.f12W400(
                        color: AppColors.backGroundDark),
                    maxLines: 4,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Enter additional information..",
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
                    controller: c.noteController,
                  ),
                  SizedBox(height: 40),
                  CustomElevatedButton(
                      title: "Send",
                      onTap: () {
                        Get.offAll(() => IssueSuccessScreen());
                      })
                ],
              ),
            )),
      ),
    );
  }
}
