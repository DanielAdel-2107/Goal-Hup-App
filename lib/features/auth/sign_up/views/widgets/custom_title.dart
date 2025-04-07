import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05, vertical: context.screenHeight * 0.01),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.title28WhiteColorW500,
        textAlign: TextAlign.center,
      ),
    );
  }
}
