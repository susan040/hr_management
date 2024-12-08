import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_management/utils/colors.dart';
import 'package:hr_management/utils/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final String? preIconPath;
  final String? suffixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final double? iconHeight;
  final double? iconWidth;

  const CustomTextField({
    Key? key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
    this.suffixIconPath,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    required this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
    this.iconHeight,
    this.iconWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextFormField(
        focusNode: focusNode,
        maxLength: maxCharacters,
        autofocus: autofocus!,
        textCapitalization: textCapitalization,
        onFieldSubmitted: onSubmitted,
        onTap: onTap,
        readOnly: readOnly ?? false,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        maxLines: 1,
        validator: validator,
        controller: controller,
        onChanged: onValueChange,
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
          suffixIcon: suffixIconPath != null
              ? SvgPicture.asset(suffixIconPath!, fit: BoxFit.scaleDown)
              : null,
          labelText: labelText,
          hintText: hint,
          hintStyle:
              CustomTextStyles.f14W400(color: AppColors.secondaryTextColor),
          filled: true,
          fillColor: fillColor ?? Colors.white,
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
          errorStyle: showError!
              ? const TextStyle(fontSize: 12)
              : const TextStyle(fontSize: 0),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
        ),
        style: CustomTextStyles.f14W400(
            color: (readOnly ?? false) ? AppColors.secondaryTextColor : null),
      ),
    );
  }
}
