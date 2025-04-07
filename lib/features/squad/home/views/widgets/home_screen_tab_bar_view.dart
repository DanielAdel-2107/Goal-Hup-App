import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/view_models/cubit/get_all_player_cubit.dart';
import 'package:goal_hup/features/squad/home/views/widgets/custom_player_list_view.dart';

class HomeScreenTabBarView extends StatelessWidget {
  const HomeScreenTabBarView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPlayerCubit, GetAllPlayerState>(
      builder: (context, state) {
        var cubit = context.read<GetAllPlayerCubit>();
        return SizedBox(
          height: context.screenHeight * 0.1,
          child: TabBarView(
            children: [
              CustomPlayerListView(
                players: cubit.searchPlayers == null
                    ? cubit.players
                    : cubit.searchPlayers!,
              ),
              CustomPlayerListView(
                players: cubit.searchPlayers == null
                    ? cubit.topRatedPlayer
                    : cubit.searchPlayers!,
              ),
              CustomPlayerListView(
                players: cubit.searchPlayers == null
                    ? cubit.playerByPosition
                    : cubit.searchPlayers!,
              ),
            ],
          ),
        );
      },
    );
  }
}