import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class CustomPickCountryFormField extends StatelessWidget {
  const CustomPickCountryFormField({
    super.key,
    this.onChanged,
  });
  final Function(CountryCode)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Nationality",
          style: AppTextStyles.title18PrimaryColorW500,
        ),
                SizedBox(height: context.screenHeight * 0.01),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: CountryCodePicker(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.02,
              vertical: context.screenHeight * 0.007,
            ),
            onChanged: onChanged,
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            
            alignLeft: true,
            initialSelection: "EG",
            textStyle: TextStyle(color: Colors.black, fontSize: 16),
            searchDecoration: InputDecoration(
              hintText: "Enter country...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
