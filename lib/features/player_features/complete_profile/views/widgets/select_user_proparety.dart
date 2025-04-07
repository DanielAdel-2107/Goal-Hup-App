import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/player_features/complete_profile/view_models/cubit/complete_profile_cubit.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/custom_sleek_circular_slider_with_title.dart';

class SelectUserProparety extends StatelessWidget {
  const SelectUserProparety({
    super.key,
    required this.cubit,
  });

  final CompleteProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: context.screenWidth * 0.05,
        runSpacing: context.screenHeight * 0.01,
        children: [
          CustomSleekCircularSliderWithTitle(
            title: "Overall Rating",
            min: 0,
            max: 100,
            onChangeEnd: (p0) {
              cubit.overallRatioController.text = p0.round().toString();
            },
          ),
          CustomSleekCircularSliderWithTitle(
            title: "Weight",
            min: 40,
            max: 120,
            onChangeEnd: (p0) {
              cubit.playerWeightController.text =p0.round().toString();
            },
          ),
          CustomSleekCircularSliderWithTitle(
            title: "Height",
            min: 100,
            max: 220,
            onChangeEnd: (p0) {
              cubit.playerHeightController.text = p0.round().toString();
            },
          ),
        ],
      ),
    );
  }
}

