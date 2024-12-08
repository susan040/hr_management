import 'package:flutter/material.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomTextField(
                preIconPath: ImagePath.email,
                iconHeight: 20,
                iconWidth: 20,
                hint: "Hello",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text),
          )
        ],
      )),
    );
  }
}
