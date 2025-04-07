import 'package:birth_picker/birth_picker.dart';
import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    this.title = "Date of Birth (Optional)",
    this.onChanged,
  });
  final String title;
  final Function(DateTime?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title18PrimaryColorW500,
        ),        SizedBox(height: context.screenHeight * 0.01),

        BirthPicker(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.02,
            vertical: context.screenHeight * 0.007,
          ),
          
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
