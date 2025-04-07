import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/custom_multi_select_dialog_field.dart';
import 'package:goal_hup/features/player_features/complete_profile/view_models/cubit/complete_profile_cubit.dart';

class SelectPosition extends StatelessWidget {
  const SelectPosition({
    super.key,
    required this.cubit,
  });

  final CompleteProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomMultiSelectDialogField(
      title: "Positions",
      onConfirm: (p0) {
        cubit.positions = p0 as List<String>;
      },
      items: [
        'GK',
        'CB',
        'LB',
        'RB',
        'CM',
        'CDM',
        'CAM',
        'LW',
        'RW',
        'CF',
        'ST'
      ],
    );
  }
}
