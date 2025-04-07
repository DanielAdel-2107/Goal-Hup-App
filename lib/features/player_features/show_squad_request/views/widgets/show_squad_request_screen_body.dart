import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/player_features/show_squad_request/view_models/cubit/show_squad_request_cubit.dart';
import 'package:goal_hup/features/player_features/show_squad_request/views/widgets/request_list_tile.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';

class ShowSquadRequestScreenBody extends StatelessWidget {
  const ShowSquadRequestScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowSquadRequestCubit, ShowSquadRequestState>(
      builder: (context, state) {
        if (state is ShowSquadRequestLoading) {
          return CustomLoading();
        }
        if (state is ShowSquadRequestFailure) {
          return Center(
            child: Text(
              "Failed to load data",
              style: AppTextStyles.title28PrimaryColorW500,
            ),
          );
        }
        if (state is ShowSquadRequestEmpty) {
          return Center(
            child: Text(
              "No Squad Request Found",
              style: AppTextStyles.title28PrimaryColorW500,
            ),
          );
        }
        final cubit = context.read<ShowSquadRequestCubit>();
        return ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.03,
            vertical: context.screenHeight * 0.01,
          ),
          itemCount: cubit.chatingPlayer.length,
          itemBuilder: (context, index) {
            return RequestListTile(chatingPlayerModel: cubit.chatingPlayer[index]);
          },
        );
      },
    );
  }
}

