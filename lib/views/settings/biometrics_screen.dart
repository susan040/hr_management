import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/biometric_screen_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';

class BiometricsScreen extends StatelessWidget {
  final c = Get.put(BiometricScreenController());
  BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        centerTitle: true,
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
        title: Text(
          "Face Recognition",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    ImagePath.faceRecognition,
                    height: 140,
                    width: 140,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/person.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 45),
            Text(
              'Add Face data',
              style: CustomTextStyles.f16W600(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Make sure all parts of your face aren’t covered by objects and are clearly visible. Your face should be well-lit as well.',
                textAlign: TextAlign.center,
                style: CustomTextStyles.f14W400(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: CustomElevatedButton(title: "Next", onTap: () {}),
      ),
    );
  }
}
