import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/components/custom_icon_button.dart';
import 'package:goal_hup/core/utilies/assets/images/app_images.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/view_models/cubit/get_all_player_cubit.dart';

class FootballImage extends StatelessWidget {
  const FootballImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPlayerCubit, GetAllPlayerState>(
      builder: (context, state) {
        return Stack(
          children: [
            Image.asset(
              AppImages.footballImage,
              fit: BoxFit.fill,
              width: double.infinity,
              height: context.screenHeight * 0.25,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: state is SignOutLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: AppColors.kPrimaryColor,
                      child: CustomIconButton(
                        icon: Icons.logout,
                        color: Colors.white,
                        onPressed: () {
                          context.read<GetAllPlayerCubit>().signOut();
                        },
                      ),
                    ),
            )
          ],
        );
      },
    );
  }
}
