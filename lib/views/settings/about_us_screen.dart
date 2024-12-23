import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
          "About Us",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to Our HR Management Platform',
                  style: CustomTextStyles.f14W600()),
              SizedBox(height: 8),
              Text(
                'At our HR management platform, we provide a wide range of tools and services designed to optimize HR processes for businesses and organizations of all sizes. Whether you are managing a small team or a large workforce, we ensure that your HR needs are efficiently addressed. Our app combines technology and user-friendly features to help you automate tasks, improve communication, and enhance employee satisfaction.',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text('Our Vision:', style: CustomTextStyles.f14W600()),
              SizedBox(height: 8),
              Text(
                'Our vision is to empower organizations by offering innovative, scalable, and secure HR solutions that support efficient workforce management. We aim to create a seamless HR experience that maximizes productivity, minimizes administrative burden, and fosters a positive workplace culture.',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text('Our Mission:', style: CustomTextStyles.f14W600()),
              SizedBox(height: 8),
              Text(
                'Our mission is to provide organizations with a powerful platform to manage their workforce efficiently. By leveraging technology, we strive to create solutions that simplify HR processes, improve operational efficiency, and ensure that employees are supported and motivated.',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text(
                'Our Services Include:',
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 8),
              BulletPoint(text: 'Attendance Management'),
              BulletPoint(text: 'Attendance Appeal'),
              BulletPoint(text: 'Leave Application'),
              BulletPoint(text: 'Pay Slip Management'),
              BulletPoint(text: 'Grievance Redressal'),
              BulletPoint(text: 'Shift Swapping'),
              BulletPoint(text: 'Expense Management'),
              BulletPoint(text: 'Travel Visiting'),
              BulletPoint(text: 'Cash Receipt'),
              SizedBox(height: 16),
              Text(
                'Why Choose Us?',
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 8),
              Text(
                'With years of experience in the HR domain, we understand the complexities of managing human resources. Our platform is tailored to meet the specific needs of businesses, offering flexibility, scalability, and advanced features that adapt to your company’s growth. Some of the key reasons why you should choose our platform include:',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              BulletPoint(
                  text: 'User-friendly interface designed for ease of use'),
              BulletPoint(
                  text:
                      'Comprehensive HR solutions for diverse business needs'),
              BulletPoint(
                  text:
                      'Real-time data analytics for informed decision-making'),
              BulletPoint(
                  text:
                      'Secure cloud-based storage for data safety and compliance'),
              BulletPoint(text: '24/7 customer support and training resources'),
              SizedBox(height: 16),
              Text(
                'Our Team:',
                style: CustomTextStyles.f14W600(),
              ),
              SizedBox(height: 8),
              Text(
                'Our team consists of HR professionals, software developers, and customer service experts, all working together to provide you with a seamless HR management experience. We are constantly innovating to meet the evolving needs of our clients, ensuring that our platform remains at the forefront of the HR tech industry.',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text('Contact Us:', style: CustomTextStyles.f14W600()),
              SizedBox(height: 8),
              Text(
                'Have questions or need assistance? Our support team is here to help! Reach out to us via the contact details below, and we will get back to you as soon as possible.',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8),
              Text(
                'Email: support@hrmanagement.com\nPhone: +1 234 567 890\nWebsite: www.hrmanagement.com',
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, size: 18, color: Colors.green),
        SizedBox(width: 8),
        Expanded(
            child: Text(
          text,
          style: CustomTextStyles.f14W400(),
        )),
      ],
    );
  }
}
