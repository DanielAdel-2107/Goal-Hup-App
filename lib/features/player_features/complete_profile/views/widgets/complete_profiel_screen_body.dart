import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/components/custom_elevated_button.dart';
import 'package:goal_hup/core/helper/show_custom_dialog.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/player_features/complete_profile/view_models/cubit/complete_profile_cubit.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/complete_profile_fileds.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/custom_date_picker.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/custom_pick_country_form_field.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/pick_image.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/select_position.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/select_preferd_position.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/select_user_proparety.dart';

class CompleteProfileScreenBody extends StatelessWidget {
  const CompleteProfileScreenBody({super.key, required this.route});
  final String route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
        vertical: context.screenHeight * 0.02,
      ),
      child: BlocProvider(
        create: (context) => CompleteProfileCubit(),
        child: BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
          listener: (context, state) {
            if (state is EmptyFieldRequired) {
              showCustomDialog(
                title: "Info",
                description: "Complete All Fields",
                dialogType: DialogType.info,
              );
            }
            if (state is CompleteProfileFailed) {
              showCustomDialog(
                title: "Failure",
                description: state.errorMessage,
                dialogType: DialogType.error,
              );
            }
            if (state is CompleteProfileSuccess) {
              context.pushAndRemoveUntilScreen(RouteNames.signInScreen);
              showCustomDialog(
                title: "Success",
                description: "Profile Complete Success",
                dialogType: DialogType.success,
              );
            }
          },
          builder: (context, state) {
            var cubit = context.read<CompleteProfileCubit>();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PickImage(
                    onPressed: () {
                      cubit.pickImage(
                        context: context,
                      );
                    },
                    image: cubit.image,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  CompleteProfileFields(cubit: cubit),
                  SizedBox(height: context.screenHeight * 0.03),
                  SelectUserProparety(cubit: cubit),
                  SizedBox(height: context.screenHeight * 0.02),
                  SelectPosition(cubit: cubit),
                  SizedBox(height: context.screenHeight * 0.02),
                  SelectPreferdPosition(cubit: cubit),
                  SizedBox(height: context.screenHeight * 0.02),
                  CustomPickCountryFormField(
                    onChanged: (p0) {
                      cubit.nationalityController.text = p0.name.toString();
                    },
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  CustomDatePicker(
                    onChanged: (p0) {
                      cubit.dateOfBirthController.text = p0.toString();
                    },
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  state is CompleteProfileLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kPrimaryColor,
                          ),
                        )
                      : CustomElevatedButton(
                          name: "Save",
                          width: double.infinity,
                          height: context.screenHeight * 0.06,
                          textStyle: AppTextStyles.title20WhiteW500,
                          onPressed: () {
                            cubit.addPlayerInformation();
                          },
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
