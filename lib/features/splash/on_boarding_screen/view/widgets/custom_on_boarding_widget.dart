import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:lottie/lottie.dart';

class CustomOnBoardingWidget extends StatelessWidget {
  const CustomOnBoardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.screenHeight * 0.01,
      children: [
        Lottie.asset(image,height: context.screenHeight * 0.4),
        Text(
          title,
          style: AppTextStyles.title24PrimaryColorW500,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
          ),
          child: Text(
            description,
            style: AppTextStyles.title16GreyW500,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
