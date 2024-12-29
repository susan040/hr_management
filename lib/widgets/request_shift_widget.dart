import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/shift_swapping_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/shift_swapping/swapping_success_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class RequestShiftWidget extends StatelessWidget {
  const RequestShiftWidget({
    super.key,
    required this.c,
  });

  final ShiftSwappingController c;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 80),
        margin: EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 25),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.lGrey,
            border: Border.all(width: 0.7, color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(6)),
        child: Form(
          key: c.shiftFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Day/Shift",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        c.selectedOption.value = "Day";
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.extraWhite,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    width: 1,
                                    color: c.selectedOption.value == "Day"
                                        ? AppColors.primaryColor
                                        : AppColors.backGroundDark)),
                            child: c.selectedOption.value == "Day"
                                ? Center(
                                    child: Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: c.selectedOption.value == "Day"
                                            ? AppColors.primaryColor
                                            : AppColors.extraWhite,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Day",
                            style: CustomTextStyles.f14W500(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Get.width / 3),
                    InkWell(
                      onTap: () {
                        c.selectedOption.value = "Shift";
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.extraWhite,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    width: 1,
                                    color: c.selectedOption.value == "Shift"
                                        ? AppColors.primaryColor
                                        : AppColors.backGroundDark)),
                            child: c.selectedOption.value == "Shift"
                                ? Center(
                                    child: Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: c.selectedOption.value == "Shift"
                                            ? AppColors.primaryColor
                                            : AppColors.extraWhite,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 8),
                          const Text("Shift"),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 25),
              Obx(() {
                if (c.selectedOption.value == "Day") {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Date",
                        style: CustomTextStyles.f14W500(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          readOnly: true,
                          onTap: () => c.chooseDate(context),
                          controller: c.selectDateController,
                          validator: Validators.checkFieldEmpty,
                          suffixIconPath: ImagePath.calender,
                          hint: "YYYY-MM-DD",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.none),
                    ],
                  );
                } else if (c.selectedOption.value == "Shift") {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Shift",
                        style: CustomTextStyles.f14W500(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                                value: c.selectShiftType.value.isEmpty
                                    ? null
                                    : c.selectShiftType.value,
                                hint: Text(
                                  "Select shift type",
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
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 1),
                                  ),
                                ),
                                items: c.shiftTypes
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: CustomTextStyles.f12W400(),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  c.updateShift(value!);
                                },
                              ),
                            )),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
              SizedBox(height: 20),
              Text(
                "Shifting with",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(
                height: 10,
              ),
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
                        value: c.selectShiftWith.value.isEmpty
                            ? null
                            : c.selectShiftWith.value,
                        hint: Text(
                          "Select name",
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
                        items: c.shiftWithName
                            .map((option) => DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(
                                    option,
                                    style: CustomTextStyles.f12W400(),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          c.updateShiftWithName(value!);
                        },
                      ),
                    )),
              ),
              SizedBox(height: 20),
              Text(
                "Reason",
                style: CustomTextStyles.f14W500(),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                color: AppColors.extraWhite,
                child: TextFormField(
                  style:
                      CustomTextStyles.f12W400(color: AppColors.backGroundDark),
                  maxLines: 6,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Reason",
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
              CustomElevatedButton(
                  title: "Send",
                  onTap: () {
                    Get.offAll(() => SwappingSuccessScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
