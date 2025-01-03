import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/cash_receipt_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/views/cash_receipt/payment_success_screen.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class AddCashReceiptScreen extends StatelessWidget {
  final c = Get.put(CashReceiptController());
  AddCashReceiptScreen({super.key});

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
          "Add Cash Receipt",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: c.cashFormKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 14, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Client Name",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.cilentNameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter name",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  SizedBox(height: 18),
                  Text(
                    "Address",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.clientAddressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter Address",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  SizedBox(height: 18),
                  Text(
                    "Payment Method",
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
                            value: c.selectPaymentMethod.value.isEmpty
                                ? null
                                : c.selectPaymentMethod.value,
                            hint: Text(
                              "Select payment",
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
                            items: c.paymentMethodList
                                .map((option) => DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(
                                        option,
                                        style: CustomTextStyles.f12W400(),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              c.updatePaymentMethod(value!);
                            },
                          ),
                        )),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Receiver Name",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.receiverNameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Receiver Name",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  SizedBox(height: 18),
                  Text(
                    "Receiver Amount",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.receiverAmountController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Receiver Amount",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number),
                  SizedBox(height: 18),
                  Text(
                    "Ref Number",
                    style: CustomTextStyles.f14W500(),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                      controller: c.refNumberController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Ref number",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number),
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
                  SizedBox(height: 40),
                  CustomElevatedButton(
                      title: "Send",
                      onTap: () {
                        Get.to(() => PaymentSuccessScreen());
                      })
                ],
              ),
            )),
      ),
    );
  }
}
