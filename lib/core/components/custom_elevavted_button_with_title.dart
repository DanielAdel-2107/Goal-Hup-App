import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });
  final String title;
  final Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: AppTextStyles.title18White,
        ));
  }
}
