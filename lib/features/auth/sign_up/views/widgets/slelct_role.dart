import 'package:flutter/widgets.dart';
import 'package:goal_hup/core/components/custom_drop_down_button_form_field.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({
    super.key,
    required this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.screenHeight * 0.01,
      children: [
        Text("Selct Role", style: AppTextStyles.title18PrimaryColorW500),
        CustomDropDownButtonFormField(
          controller: controller,
          userRoles: context.signUpCubit.userRoles,
        ),
      ],
    );
  }
}
