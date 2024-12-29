import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/leave_history_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/leave_application/application_successful_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class AddLeaveApplicationScreen extends StatelessWidget {
  final c = Get.put(LeaveHistoryController());
  AddLeaveApplicationScreen({super.key});

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
          "Add Leave Application",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 22),
          padding: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.extraWhite,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1, color: AppColors.borderColor)),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Approver",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                  validator: Validators.checkFieldEmpty,
                  hint: "Enter your name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text),
              SizedBox(height: 18),
              Text(
                "Leave Type",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: AppColors.extraWhite),
                child: Obx(() => Container(
                      height: 50,
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
                          "Select leave type",
                          style: CustomTextStyles.f12W400(
                              color: AppColors.secondaryTextColor),
                        ),
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 10, left: 14, right: 14),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.secondaryColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
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
              SizedBox(height: 18),
              Text(
                "Date",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                  readOnly: true,
                  onTap: () => c.chooseDate(context),
                  controller: c.selectDateController,
                  validator: Validators.checkFieldEmpty,
                  suffixIconPath: ImagePath.calender,
                  hint: "YYYY-MM-DD",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.none),
              SizedBox(height: 18),
              Text(
                "Reason",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              TextFormField(
                style:
                    CustomTextStyles.f12W400(color: AppColors.backGroundDark),
                maxLines: 6,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Write here",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.secondaryColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.errorColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.primaryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.errorColor),
                  ),
                  hintStyle: CustomTextStyles.f12W400(
                      color: AppColors.secondaryTextColor),
                ),
                //controller: c.reasonController,
              ),
              SizedBox(height: 18),
              Text(
                "Substitute",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                  hint: "substitute",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text),
              SizedBox(height: 18),
              Text(
                "Documents",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              Obx(
                () => CustomTextField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: c.pdfFileName.value),
                    validator: Validators.checkFieldEmpty,
                    suffixIconPath: ImagePath.document,
                    hint: "Choose File",
                    onTap: () {
                      c.pickPdf();
                    },
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
              ),
              SizedBox(height: 25),
              CustomElevatedButton(
                  title: "Apply",
                  onTap: () {
                    Get.to(() => ApplicationSuccessfulScreen());
                  })
            ],
          )),
        ),
      ),
    );
  }
}
