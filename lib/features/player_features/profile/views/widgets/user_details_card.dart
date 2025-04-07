import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth *0.05,
          vertical: context.screenWidth *0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.title20PrimaryColorW500,
            ),
            Text(
              value,
              style: AppTextStyles.title18Black,
            ),
          ],
        ),
      ),
    );
  }
}
