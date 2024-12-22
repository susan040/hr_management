import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
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
          "FAQ",
          style: CustomTextStyles.f14W600(),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 8, bottom: 6, right: 16),
            child: Text("Frequently Asked Question (FAQ)",
                style: CustomTextStyles.f14W600()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 12, right: 16),
            child: Text(
              "A Frequently Asked Question (FAQ) line is a section that lists common questions and answers about a topic to help users quickly find information.",
              style:
                  CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
            ),
          ),
          FaqItem(
            question: 'What is the HRM?',
            answer:
                'The HR Management App helps organizations manage their human resources effectively, including employee records, payroll, attendance, and performance tracking.',
          ),
          FaqItem(
            question: 'How can I view my attendance?',
            answer:
                'You can check your attendance by navigating to the "Attendance" section. Here, you can see your clock-in/clock-out times, working hours, and any leaves taken.',
          ),
          FaqItem(
            question: 'How do I access my payslip?',
            answer:
                'You can view your payslips in the "Pay Slip Management" section. Just select download button for downloading your payslip. You can also raise for issue.',
          ),
          FaqItem(
            question: 'How do I swap shifts with a colleague?',
            answer:
                'To swap shifts, go to the "Shift Management" section and select the shift you want to swap. Then, choose a colleague from your team to swap shifts with. Both you and your colleague will receive a notification to approve the swap. Once confirmed, the shift will be updated.',
          ),
          FaqItem(
            question: 'How can I appeal my attendance if there is an error?',
            answer:
                'If there is an error with your attendance, go to the "Attendance Appeal" section and find the specific day or date with the issue. Click on "Not Check-in" and fill in the reason for the appeal. HR will review your request and update the status accordingly.',
          ),
          FaqItem(
            question: 'What should I do if I face issues with the app?',
            answer:
                'If you encounter any issues, please contact support via the "Help & Support" section or directly reach out to HR for assistance.',
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(bottom: 10, right: 16, left: 16),
        title: Text(
          question,
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
        backgroundColor: AppColors.extraWhite,
        collapsedBackgroundColor: AppColors.extraWhite,
        iconColor: AppColors.secondaryTextColor,
        collapsedIconColor: AppColors.secondaryTextColor,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
            child: Text(
              answer,
              style: CustomTextStyles.f12W400(
                color: AppColors.secondaryTextColor,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
