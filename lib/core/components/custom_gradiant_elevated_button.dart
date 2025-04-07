import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomGradiantElevatedButton extends StatelessWidget {
  const CustomGradiantElevatedButton({
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: wPadding ?? 16,
          vertical: hPadding ?? 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.kPrimaryColor),
          gradient: LinearGradient(
            colors: [
              AppColors.kPrimaryColor,
              Colors.white,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          name,
          style: textStyle ?? AppTextStyles.title20PrimaryColorW500,
        ),
      ),
    );
  }
}
