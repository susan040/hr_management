import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/views/travel_visiting/add_travel_visit_screen.dart';

class TravelVisitHistoryScreen extends StatelessWidget {
  const TravelVisitHistoryScreen({super.key});

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
          "Travel Visits",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: AppColors.borderColor)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 8),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Column(
                children: [
                  Text(
                    "Visits",
                    style:
                        CustomTextStyles.f14W600(color: AppColors.extraWhite),
                  ),
                  SizedBox(height: 14),
                  Divider(
                    thickness: 1,
                    color: AppColors.extraWhite,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCircularStatWidget(hours: "5H", label: "Today"),
                      Container(
                        width: 1,
                        height: 85,
                        decoration: BoxDecoration(color: AppColors.extraWhite),
                      ),
                      buildCircularStatWidget(hours: "24", label: "This Week"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('21\n Upcoming',
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.f14W500(
                          color: AppColors.secondaryTextColor)),
                  Text('87 \n Completed',
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.f14W500(
                          color: AppColors.secondaryTextColor)),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColors.primaryColor,
            ),
            Column(
              children: [
                buildVisitCard(
                  name: 'Susan Thapa',
                  purpose: 'App Developer',
                  dateTime: '20 NOV, 2024 | 11:00',
                  address: '17 Birauta, Gagriti Marga',
                ),
                buildVisitCard(
                  name: 'Susan Thapa',
                  purpose: 'App Developer',
                  dateTime: '21 NOV, 2024 | 12:00',
                  address: '23 Talchowk, Lekhnath',
                ),
                buildVisitCard(
                  name: 'Susan Thapa',
                  purpose: 'App Developer',
                  dateTime: '22 NOV, 2024 | 12:45',
                  address: '25 Hemja, Pokhara',
                ),
              ],
            ),
          ],
        ),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Get.to(() => AddTravelVisitScreen());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class buildCircularStatWidget extends StatelessWidget {
  const buildCircularStatWidget(
      {super.key, required this.hours, required this.label});
  final String hours;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                value: 0.5,
                color: AppColors.secondaryColor,
                backgroundColor: AppColors.extraWhite,
              ),
            ),
            Text(
              hours,
              style: CustomTextStyles.f14W400(color: AppColors.extraWhite),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: CustomTextStyles.f12W400(color: AppColors.extraWhite),
        ),
      ],
    );
  }
}

class buildVisitCard extends StatelessWidget {
  const buildVisitCard(
      {super.key,
      required this.name,
      required this.purpose,
      required this.dateTime,
      required this.address});
  final String name;
  final String purpose;
  final String dateTime;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      height: 113,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.extraWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.lGrey),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            color: AppColors.lGrey,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            height: 113,
            width: 8,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Visit Purpose",
                  style: CustomTextStyles.f14W600(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: CustomTextStyles.f14W500(),
                    ),
                    SizedBox(width: Get.width / 2.9),
                    Text(
                      purpose,
                      style: CustomTextStyles.f12W500(),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Container(
                  height: 1,
                  width: 320,
                  color: AppColors.borderColor,
                ),
                SizedBox(height: 6),
                Text(
                  "20 NOV, 2024 | 11:00",
                  style: CustomTextStyles.f12W400(),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    SvgPicture.asset(ImagePath.location),
                    SizedBox(width: 6),
                    Text(
                      "17 Birauta, Gagriti Marga",
                      style: CustomTextStyles.f11W400(),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
