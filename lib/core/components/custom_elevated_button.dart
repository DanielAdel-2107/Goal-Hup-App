import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.name,
    this.onPressed,
    this.textStyle,
    this.hPadding,
    this.wPadding,
    this.height,
    this.width,
    this.backgroundColor,
    this.forgroundColor,
  });
  final String name;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final double? hPadding, wPadding;
  final double? height, width;
  final Color? backgroundColor;
  final Color? forgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.kPrimaryColor,
        foregroundColor: forgroundColor,
        minimumSize: Size(double.infinity, context.screenHeight * 0.06),
        padding: EdgeInsets.symmetric(
            horizontal:wPadding?? context.screenWidth * 0.01,
            vertical:hPadding?? context.screenHeight * 0.01),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: textStyle ?? AppTextStyles.title20WhiteW500,
      ),
    );
  }
}
