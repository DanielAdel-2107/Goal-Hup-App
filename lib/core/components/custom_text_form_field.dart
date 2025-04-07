import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon, this.hPadding, this.wPadding, this.onChanged,
  });
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? hPadding , wPadding;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText: hintText,
        
        hintStyle: AppTextStyles.title16PrimaryColorWithOpacity,
        contentPadding: EdgeInsets.symmetric(
          vertical:hPadding?? context.screenHeight * 0.025,
          horizontal: wPadding?? context.screenWidth * 0.05,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      maxLines: maxLines,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
