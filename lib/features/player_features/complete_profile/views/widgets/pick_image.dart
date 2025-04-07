import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/components/custom_icon_button.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/player_features/complete_profile/view_models/cubit/complete_profile_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
    this.image,
    this.onPressed,
  });
  final Uint8List? image;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: image == null ? null : MemoryImage(image!),
                radius: context.screenWidth / 5,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: AppColors.kPrimaryColor,
                  child: CustomIconButton(
                    icon: Icons.upload,
                    onPressed: onPressed,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


