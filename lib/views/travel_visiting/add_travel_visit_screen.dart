import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/travel_visit_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/travel_visiting/travel_added_success_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class AddTravelVisitScreen extends StatelessWidget {
  final c = Get.put(TravelVisitController());
  AddTravelVisitScreen({super.key});

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
          "Add Travel Visit",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: c.travelFormKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 14, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Visit Purpose",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.visitProposeController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter visit Purpose",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  SizedBox(height: 18),
                  Text(
                    "Visit Location",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.visitLocationController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter Address",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  SizedBox(height: 18),
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
                            value: c.selectStatus.value.isEmpty
                                ? null
                                : c.selectStatus.value,
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
                                    color: AppColors.secondaryColor, width: 1),
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
                            items: c.statusList
                                .map((option) => DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(
                                        option,
                                        style: CustomTextStyles.f12W400(),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              c.updateStatus(value!);
                            },
                          ),
                        )),
                  ),
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
                  SizedBox(height: 18),
                  Text(
                    "Notes (Optional)",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: CustomTextStyles.f12W400(
                        color: AppColors.backGroundDark),
                    maxLines: 6,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter additional information",
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
                        Get.to(() => TravelAddedSuccessScreen());
                      })
                ],
              ),
            )),
      ),
    );
  }
}
