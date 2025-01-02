import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/pay_slip_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/views/pay_slip/raise_issue_screen.dart';

class PaySlipScreen extends StatelessWidget {
  final c = Get.put(PaySlipController());
  PaySlipScreen({super.key});

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
          "Pay Slip",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding:
                    EdgeInsets.only(left: 14, top: 8, bottom: 8, right: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    border: Border.all(width: 1, color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: Stack(
                        children: [
                          PieChart(
                            PieChartData(
                              sections: c.chartSections,
                              centerSpaceRadius: 36,
                              sectionsSpace: 0,
                              centerSpaceColor: Colors.white,
                              borderData: FlBorderData(show: true),
                              pieTouchData: PieTouchData(enabled: true),
                            ),
                          ),
                          Positioned(
                            left: 28,
                            top: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${c.totalSlip.value}",
                                  style: CustomTextStyles.f11W600(),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Gross pay",
                                  style: CustomTextStyles.f11W400(
                                      color: AppColors.secondaryTextColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "November 2024",
                            style: CustomTextStyles.f14W600(),
                          ),
                          SizedBox(height: 14),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius: 9,
                              ),
                              const SizedBox(width: 6),
                              Column(
                                children: [
                                  Text(
                                    '${c.earnings.value.toStringAsFixed(2)}',
                                    style: CustomTextStyles.f12W600(),
                                  ),
                                  Text(
                                    'Earnings',
                                    style: CustomTextStyles.f12W500(
                                        color: AppColors.secondaryTextColor),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
                              const CircleAvatar(
                                backgroundColor: AppColors.rejected,
                                radius: 9,
                              ),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${c.deductions.value.toStringAsFixed(2)}',
                                    style: CustomTextStyles.f12W600(),
                                  ),
                                  Text(
                                    'Deductions',
                                    style: CustomTextStyles.f12W500(
                                        color: AppColors.secondaryTextColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 28,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      c.isLoading.value ? null : c.saveAndOpenPDF();
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: AppColors.extraWhite,
                      backgroundColor: AppColors.rejected,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text(
                      'Download',
                      style:
                          CustomTextStyles.f12W400(color: AppColors.extraWhite),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                SizedBox(
                  height: 28,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => RaiseIssueScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: AppColors.extraWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      backgroundColor: AppColors.borderColor,
                    ),
                    child: Text(
                      'Raise Issue',
                      style:
                          CustomTextStyles.f12W400(color: AppColors.textColor),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  border: Border.all(width: 1, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Earnings",
                    style: CustomTextStyles.f14W500(),
                  ),
                  PaySlipWidget(name: "Basic", amount: 30000.00),
                  PaySlipWidget(name: "Leave Encashment", amount: 13000.00),
                  PaySlipWidget(name: "Other Allowance", amount: 15000.00),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  border: Border.all(width: 1, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deductions",
                    style:
                        CustomTextStyles.f14W500(color: AppColors.amberYellow),
                  ),
                  PaySlipWidget(
                      name: "Employee PF Contribution", amount: 30000.00),
                  PaySlipWidget(name: "Income Tax", amount: 13000.00),
                  PaySlipWidget(name: "Insurance", amount: 15000.00),
                  Divider(
                    thickness: 1,
                    color: AppColors.amberYellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 4, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gross Deducations",
                          style: CustomTextStyles.f12W500(
                              color: AppColors.amberYellow),
                        ),
                        Text(
                          "Rs.58000.00",
                          style: CustomTextStyles.f12W500(
                              color: AppColors.amberYellow),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaySlipWidget extends StatelessWidget {
  const PaySlipWidget({
    super.key,
    required this.name,
    required this.amount,
  });
  final String name;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style:
                CustomTextStyles.f12W500(color: AppColors.secondaryTextColor),
          ),
          Text(
            "Rs.${amount.toString()}",
            style:
                CustomTextStyles.f12W500(color: AppColors.secondaryTextColor),
          )
        ],
      ),
    );
  }
}
