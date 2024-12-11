import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class ServicesWidget extends StatelessWidget {
  final Color iconContainerColor;
  final String iconPath;
  final String title;
  final String subtitle;

  const ServicesWidget({
    super.key,
    required this.iconContainerColor,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 110,
      decoration: BoxDecoration(
        color: AppColors.extraWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.lGrey),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            color: AppColors.lGrey,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 7),
            height: 105,
            width: 9,
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 11),
                height: 43,
                width: 43,
                decoration: BoxDecoration(
                  color: iconContainerColor.withOpacity(0.27),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(
                title,
                style: CustomTextStyles.f12W400(),
              ),
              Text(
                subtitle,
                style: CustomTextStyles.f12W400(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
