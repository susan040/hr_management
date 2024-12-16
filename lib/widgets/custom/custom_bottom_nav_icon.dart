import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_management/utils/custom_text_style.dart';
import '../../utils/colors.dart';

class CustomBottomNavIcon extends StatelessWidget {
  final String svgPath;
  final String title;
  final bool isActive;
  final double height;
  final double width;
  final VoidCallback onTap;

  const CustomBottomNavIcon({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.svgPath,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 14),
            height: 42,
            width: isActive ? 105 : 60,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  height: height,
                  width: height,
                  svgPath,
                  color: isActive ? AppColors.backGroundColor : Colors.grey,
                ),
                if (isActive) ...[
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: CustomTextStyles.f12W600(
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
