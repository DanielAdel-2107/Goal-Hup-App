import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
class OnBoardingElevatedButton extends StatelessWidget {
  const OnBoardingElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.active,
  });
  final String title;
  final Function()? onPressed;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            active ? AppColors.kPrimaryColor : Colors.grey.withOpacity(0.7),
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05, vertical:context.screenHeight * 0.01),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: active ? onPressed : () {},
      child: Text(
        title,
        style: AppTextStyles.title18White,
      ),
    );
  }
}
