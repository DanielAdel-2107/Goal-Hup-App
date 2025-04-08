import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/cache/cache_helper.dart';
import 'package:goal_hup/core/components/custom_icon_button.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/helper/show_custom_dialog.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/player_features/show_squad_request/view_models/cubit/show_squad_request_cubit.dart';
import 'package:goal_hup/features/player_features/show_squad_request/views/widgets/show_squad_request_screen_body.dart';

class ShowSquadRequestScreen extends StatelessWidget {
  const ShowSquadRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowSquadRequestCubit(),
      child: BlocConsumer<ShowSquadRequestCubit, ShowSquadRequestState>(
        listener: (context, state) {
          if (state is SignOutFailure) {
            return showCustomDialog(
                title: "Failed",
                description: state.errorMessage,
                dialogType: DialogType.error);
          }
          if (state is SignOutSuccess) {
            context.pushReplacementScreen(RouteNames.signInScreen);
            return showCustomDialog(
                title: "Success",
                description: "Sign Out Successfully",
                dialogType: DialogType.success);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: CustomIconButton(
                icon: Icons.person,
                color: AppColors.kPrimaryColor,
                onPressed: () {
                  context.pushScreen(RouteNames.playerProfileScreen,
                      arguments: getIt<CacheHelper>().getUserModel()!.toJson());
                },
              ),
              title: Text(
                "Squad Request",
                style: AppTextStyles.title24PrimaryColorW500,
              ),
              centerTitle: true,
              actions: [
                state is SignOutLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : CustomIconButton(
                        icon: Icons.logout,
                        color: AppColors.kPrimaryColor,
                        onPressed: () {
                          context.read<ShowSquadRequestCubit>().signOut();
                        },
                      ),
              ],
            ),
            body: ShowSquadRequestScreenBody(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.kPrimaryColor,
              onPressed: () {
                context.pushScreen(
                  RouteNames.homeScreen,
                );
              },
              child: Icon(
                Icons.sports_soccer_rounded,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
