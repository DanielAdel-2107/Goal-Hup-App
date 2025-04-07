import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/custom_multi_select_dialog_field.dart';
import 'package:goal_hup/features/player_features/complete_profile/view_models/cubit/complete_profile_cubit.dart';

class SelectPreferdPosition extends StatelessWidget {
  const SelectPreferdPosition({
    super.key,
    required this.cubit,
  });

  final CompleteProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomMultiSelectDialogField(
      title: "Preferred Foot",
      items: [
        'Left Foot',
        'Right Foot',
      ],
      onConfirm: (p0) {
        cubit.preferredFoot = p0 as List<String>;
      },
    );
  }
}
