import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/image_path.dart';
import '../../utils/validatior.dart';

class CustomPasswordField extends StatelessWidget {
  final String hint;
  final FocusNode? focusNode;
  final bool eye;
  final String? preIconPath;
  final Color? border;
  final VoidCallback onEyeClick;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final String? labelText;
  final double? iconHeight;
  final double? iconWidth;

  const CustomPasswordField(
      {Key? key,
      required this.hint,
      this.preIconPath,
      required this.eye,
      required this.onEyeClick,
      required this.controller,
      required this.textInputAction,
      this.validator,
      this.onSubmitted,
      this.focusNode,
      this.border,
      this.labelText,
      this.iconHeight,
      this.iconWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        focusNode: focusNode,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        validator: validator ?? Validators.checkPasswordField,
        obscureText: eye,
        maxLines: 1,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          prefixIcon: preIconPath != null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        preIconPath!,
                        fit: BoxFit.contain,
                        height: iconHeight,
                        width: iconWidth,
                        color: AppColors.primaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        height: 63,
                        width: 1,
                        decoration:
                            BoxDecoration(color: AppColors.secondaryColor),
                      )
                    ],
                  ),
                )
              : null,
          label: labelText != null
              ? Text(
                  labelText ?? "",
                  style: CustomTextStyles.f16W400(
                    color: AppColors.primaryColor,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: border ?? AppColors.secondaryColor),
              borderRadius: BorderRadius.circular(6)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: border ?? AppColors.errorColor),
              borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: border ?? AppColors.primaryColor),
              borderRadius: BorderRadius.circular(6)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: border ?? AppColors.errorColor),
              borderRadius: BorderRadius.circular(6)),
          suffixIcon: IconButton(
            splashColor: AppColors.extraWhite,
            onPressed: onEyeClick,
            icon: (eye)
                ? SvgPicture.asset(
                    ImagePath.eyeOff,
                    height: 15,
                    width: 15,
                    colorFilter: ColorFilter.mode(
                        AppColors.backGroundDark.withOpacity(0.5),
                        BlendMode.srcIn),
                    fit: BoxFit.fill,
                  )
                : SvgPicture.asset(
                    ImagePath.eye,
                    height: 11,
                    colorFilter: ColorFilter.mode(
                        AppColors.backGroundDark.withOpacity(0.5),
                        BlendMode.srcIn),
                    fit: BoxFit.fill,
                  ),
          ),
          errorStyle: const TextStyle(fontSize: 10),
          hintText: hint,
          hintStyle:
              CustomTextStyles.f12W400(color: AppColors.secondaryTextColor),
        ),
        style: CustomTextStyles.f12W400(),
      ),
    );
  }
}
