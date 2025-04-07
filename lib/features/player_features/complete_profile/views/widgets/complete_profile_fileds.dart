
import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/custom_text_form_field_with_title.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/player_features/complete_profile/view_models/cubit/complete_profile_cubit.dart';

class CompleteProfileFields extends StatelessWidget {
  const CompleteProfileFields({
    super.key,
    required this.cubit,
  });

  final CompleteProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormFieldWithTitle(
            hintText: "Enter your name",
            title: "Full Name",
            controller: cubit.fullNameController,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          CustomTextFormFieldWithTitle(
            hintText: "Enter club name",
            title: "Current Club",
            controller: cubit.clubNameController,
          ),
        ],
      ),
    );
  }
}
