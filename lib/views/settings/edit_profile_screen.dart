import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_management/controller/dashboard/edit_profile_controller.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import 'package:hr_management/utils/image_path.dart';
import 'package:hr_management/utils/validatior.dart';
import 'package:hr_management/widgets/custom/custom_textfield.dart';
import 'package:hr_management/widgets/custom/elevated_button.dart';
import 'package:hr_management/widgets/edit_profile_widget.dart';

class EditProfileScreen extends StatelessWidget {
  final c = Get.put(EditProfileController());
  EditProfileScreen({super.key});

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
          "Edit Profile",
          style: CustomTextStyles.f14W600(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          EditProfileWidget(c: c),
          Form(
              key: c.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 35),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: c.nameController,
                        hint: "Enter your Full Name",
                        validator: Validators.checkFieldEmpty,
                        preIconPath: ImagePath.person,
                        iconHeight: 18,
                        iconWidth: 24,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text),
                    SizedBox(height: 22),
                    CustomTextField(
                        controller: c.emailController,
                        hint: "Enter your Email",
                        validator: Validators.checkEmailField,
                        preIconPath: ImagePath.email,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: 22),
                    CustomTextField(
                        controller: c.addressController,
                        hint: "Enter your address",
                        validator: Validators.checkFieldEmpty,
                        preIconPath: ImagePath.address,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: 22),
                    CustomTextField(
                        controller: c.phoneController,
                        hint: "Enter your phone",
                        validator: Validators.checkPhoneField,
                        preIconPath: ImagePath.phone,
                        iconHeight: 18,
                        iconWidth: 24,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.phone),
                    SizedBox(height: 22),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 25),
        child: CustomElevatedButton(title: "Save", onTap: () {}),
      ),
    );
  }
}
