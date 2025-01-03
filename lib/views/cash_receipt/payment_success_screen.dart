import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/cash_receipt_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/dash_screen.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final c = Get.put(CashReceiptController());
  PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.extraWhite,
        title: Text(
          "Receipt",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 25),
              margin: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
              width: double.infinity,
              height: Get.height / 1.86,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.borderColor),
                  color: AppColors.extraWhite,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.lGrey,
                        blurRadius: 2,
                        spreadRadius: 3,
                        offset: Offset(2, 3))
                  ],
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Image.asset(
                    ImagePath.paymentSuccess,
                    height: 55,
                    width: 55,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Payment Success!",
                    style: CustomTextStyles.f16W400(
                        color: AppColors.secondaryTextColor),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "NPR. 1,000,000",
                    style: CustomTextStyles.f18W600(),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: AppColors.borderColor,
                  ),
                  SizedBox(height: 10),
                  ReceiptWidget(name: "Ref Number", number: "000085752257"),
                  SizedBox(height: 18),
                  ReceiptWidget(
                      name: "Payment Time", number: "25-11-2024, 13:22:16"),
                  SizedBox(height: 18),
                  ReceiptWidget(
                      name: "Payment Method", number: "Online Banking"),
                  SizedBox(height: 18),
                  ReceiptWidget(name: "Sender Name", number: "Susan Thapa"),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: AppColors.borderColor,
                  ),
                  SizedBox(height: 10),
                  ReceiptWidget(name: "Amount", number: "NPR. 1,000,000"),
                  SizedBox(height: 18),
                  ReceiptWidget(name: "Admin Fee", number: "NPR. 10"),
                ],
              ),
            ),
            SizedBox(height: 80),
            InkWell(
              onTap: () {
                c.isLoading.value ? null : c.saveAndOpenPDF();
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1, color: AppColors.borderColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImagePath.pdfDownload),
                    SizedBox(width: 10),
                    Text(
                      "Get PDF Receipt",
                      style: CustomTextStyles.f14W600(),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: CustomElevatedButton(
                  title: "Back To Home",
                  onTap: () {
                    Get.to(() => DashScreen());
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({
    super.key,
    required this.name,
    required this.number,
  });
  final String name;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: CustomTextStyles.f12W500(color: AppColors.secondaryTextColor),
        ),
        Text(
          number,
          style: CustomTextStyles.f12W500(),
        )
      ],
    );
  }
}
