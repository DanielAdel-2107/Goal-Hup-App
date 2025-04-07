import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class CustomMultiSelectDialogField extends StatelessWidget {
  const CustomMultiSelectDialogField({
    super.key,
    this.onSelectionChanged,
    required this.items,
    required this.title, required this.onConfirm,
  });
  final Function(List<dynamic>)? onSelectionChanged;
  final List<String> items;
  final String title;
 final Function(List<dynamic>) onConfirm;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title18PrimaryColorW500,
        ),
        SizedBox(height: context.screenHeight * 0.01),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.02,
            vertical: context.screenHeight * 0.007,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: MultiSelectDialogField<String>(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16),
            ),
            items: items
                .map((language) => MultiSelectItem<String>(language, language))
                .toList(),
            title: Text("Select Languages"),
            selectedColor: AppColors.kPrimaryColor,
            buttonText: Text("Choose Languages"),
            onConfirm: onConfirm,
            onSelectionChanged: onSelectionChanged,
            chipDisplay: MultiSelectChipDisplay(
              chipColor: AppColors.kPrimaryColor.withOpacity(0.2),
              textStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
