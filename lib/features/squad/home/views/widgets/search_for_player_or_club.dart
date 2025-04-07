import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/custom_text_form_field.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';

class SearchForPlayerOrClub extends StatelessWidget {
  const SearchForPlayerOrClub({
    super.key, this.onChanged,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.03,
        vertical: context.screenHeight * 0.007,
      ),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Search Player Or Club",
            onChanged:onChanged,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
