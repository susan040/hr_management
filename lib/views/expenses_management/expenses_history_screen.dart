import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/expenses_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/expenses_management/add_advance_screen.dart';
import 'package:hr_management/views/expenses_management/add_categories_screen.dart';
import 'package:hr_management/views/expenses_management/edit_advance_screen.dart';

class ExpensesHistoryScreen extends StatelessWidget {
  final c = Get.put(ExpensesScreenController());
  ExpensesHistoryScreen({super.key});

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
          "Expenses Details",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 14, right: 14, top: 10),
                margin: EdgeInsets.only(bottom: 14),
                height: 92,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 0.56, color: AppColors.borderColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expenses",
                      style: CustomTextStyles.f14W600(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 8),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: AppColors.extraWhite,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Center(
                                  child: Icon(
                                Icons.calendar_month,
                                size: 20,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "11 Nov, 2024",
                                    style: CustomTextStyles.f14W500(),
                                  ),
                                  Text(
                                    "Total Expenses",
                                    style: CustomTextStyles.f11W400(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Rs.6000.00",
                          style: CustomTextStyles.f12W600(
                              color: AppColors.primaryColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 14, top: 8, bottom: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.lGrey,
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 0.6, color: AppColors.borderColor)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.extraWhite,
                          border: Border.all(width: 4, color: Colors.amber)),
                      child: Center(child: SvgPicture.asset(ImagePath.money)),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Advance Drawn',
                              style: CustomTextStyles.f14W500()),
                          Text('20 Nov, 2024 | 4:30 pm',
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.secondaryTextColor)),
                          SizedBox(height: 3),
                          Text('Rs. 400.00',
                              style: CustomTextStyles.f12W600(
                                  color: AppColors.primaryColor)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: PopupMenuButton(
                        //position: PopupMenuPosition.over,
                        icon: Icon(
                          Icons.more_vert,
                          size: 16,
                        ),
                        itemBuilder: (ctx) => [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: [
                                Icon(Icons.add, size: 16),
                                SizedBox(width: 10),
                                Text(
                                  "Add",
                                  style: CustomTextStyles.f12W400(
                                      color: AppColors.textColor),
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.to(() => AddAdvanceScreen());
                            },
                          ),
                          PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 16),
                                SizedBox(width: 10),
                                Text(
                                  "Edit",
                                  style: CustomTextStyles.f12W400(
                                      color: AppColors.textColor),
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.to(() => EditAdvanceScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 20),
                margin: EdgeInsets.only(bottom: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(11.37),
                    border:
                        Border.all(width: 0.95, color: AppColors.borderColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CATEGORIES",
                              style: CustomTextStyles.f14W500(
                                  color: AppColors.primaryColor),
                            ),
                            Text(
                              "4 Total",
                              style: CustomTextStyles.f12W500(
                                  color: AppColors.primaryColor),
                            )
                          ],
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(child: SvgPicture.asset(ImagePath.bar)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PieChart(
                            PieChartData(
                              sections: c.chartSections,
                              centerSpaceRadius: 60,
                              centerSpaceColor: Colors.white,
                              borderData: FlBorderData(show: true),
                              pieTouchData: PieTouchData(enabled: true),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Positioned(
                          left: 138,
                          top: 78,
                          child: Text(
                            "${c.totalExpenses.value}\n"
                            "Expenses",
                            style: CustomTextStyles.f12W600(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Text("Expenses",
                        style: CustomTextStyles.f14W500(
                            color: AppColors.primaryColor)),
                    const SizedBox(height: 20),

                    ExpenseItem(
                      image: ImagePath.tA,
                      color: Colors.red,
                      title: "T.A",
                      date: "20 NOV, 2024 | 11:00 am",
                      price: 2800.00,
                    ),
                    SizedBox(height: 16),
                    // Expense Item 2
                    ExpenseItem(
                      image: ImagePath.dA,
                      color: Colors.blue,
                      title: "D.A",
                      date: "20 Nov, 2024 | 1:30 pm",
                      price: 1900.00,
                    ),
                    SizedBox(height: 16),
                    // Expense Item 3
                    ExpenseItem(
                      image: ImagePath.expenditure,
                      color: Colors.purple,
                      title: "Misc. Expenditure",
                      date: "20 Nov, 2024 | 3:00 pm",
                      price: 900.00,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => AddCategoriesScreen());
        },
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.add,
            color: AppColors.extraWhite,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final String image;
  final Color color;
  final String title;
  final String date;
  final double price;

  const ExpenseItem({
    required this.image,
    required this.color,
    required this.title,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          width: 55,
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
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: CustomTextStyles.f14W500()),
                  Text(price.toStringAsFixed(2),
                      style: CustomTextStyles.f12W500()),
                ],
              ),
              SizedBox(height: 4),
              // Date
              Text(date, style: CustomTextStyles.f11W400()),
              SizedBox(height: 8),
              // Divider
              Container(
                height: 1.4,
                color: AppColors.borderColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
