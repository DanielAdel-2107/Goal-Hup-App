import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/components/custom_icon_button.dart';
import 'package:goal_hup/core/utilies/assets/lotties/app_lotties.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/squad/player_in_chating/view_models/cubit/player_in_chating_cubit.dart';
import 'package:lottie/lottie.dart';

class PlayerInChatingScreen extends StatelessWidget {
  const PlayerInChatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Player In Chating ",
          style: AppTextStyles.title24PrimaryColorW500,
        ),
        centerTitle: true,
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios,
          color: AppColors.kPrimaryColor,
          onPressed: (){
            context.popScreen();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => PlayerInChatingCubit(),
        child: BlocBuilder<PlayerInChatingCubit, PlayerInChatingState>(
          builder: (context, state) {
            if (state is PlayerInChatingLoading) {
              return CustomLoading();
            }
            if (state is PlayerInChatingFailure) {
              return Center(
                child: Text(
                  "Failed to load data",
                  style: AppTextStyles.title28PrimaryColorW500,
                ),
              );
            }
            if (state is PlayerInChatingEmpty) {
              return Center(
                child: Text(
                  "No Player In Chating",
                  style: AppTextStyles.title28PrimaryColorW500,
                ),
              );
            }
            final cubit = context.read<PlayerInChatingCubit>();
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.03,
                vertical: context.screenHeight * 0.01,
              ),
              itemCount: cubit.chatingPlayer.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: context.screenHeight * 0.01,
                  ),
                  child: ListTile(
                    onTap: () {
                      context.pushScreen(
                        RouteNames.chatScreen,
                        arguments: cubit.chatingPlayer[index].id,
                      );
                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.05,
                      vertical: context.screenHeight * 0.01,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: AppColors.kPrimaryColor),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(cubit.chatingPlayer[index].playerImage),
                      radius: context.screenWidth * 0.07,
                    ),
                    title: Text(
                      cubit.chatingPlayer[index].playerName,
                      style: AppTextStyles.title18PrimaryColorW500,
                    ),
                    trailing: Icon(Icons.chat, color: AppColors.kPrimaryColor),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppLotties.loadingLottie,
        width: context.screenWidth * 0.5,
      ),
    );
  }
}
