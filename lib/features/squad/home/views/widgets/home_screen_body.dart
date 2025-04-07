import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/helper/show_custom_dialog.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/view_models/cubit/get_all_player_cubit.dart';
import 'package:goal_hup/features/squad/home/views/widgets/football_image.dart';
import 'package:goal_hup/features/squad/home/views/widgets/home_screen_smooth_page_controller.dart';
import 'package:goal_hup/features/squad/home/views/widgets/home_screen_tab_bar.dart';
import 'package:goal_hup/features/squad/home/views/widgets/home_screen_tab_bar_view.dart';
import 'package:goal_hup/features/squad/home/views/widgets/search_for_player_or_club.dart';
import 'package:goal_hup/features/squad/home/views/widgets/top_rated_page_view_builder.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllPlayerCubit(),
      child: BlocConsumer<GetAllPlayerCubit, GetAllPlayerState>(
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
          var cubit = context.read<GetAllPlayerCubit>();

          if (state is GetAllPlayerLoading) {
            return CustomLoading();
          }
          return DefaultTabController(
            length: 3,
            child: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        FootballImage(),
                        TopRatedPageViewBuilder(
                          pageController: cubit.pageController,
                          currentPage: cubit.currentPage,
                          onPageChanged: cubit.onChanged,
                          players: cubit.players,
                        ),
                        HomeScreemSmoothPageIndecator(cubit: cubit),
                        SearchForPlayerOrClub(
                          onChanged: (p0) {
                            cubit.searchForPlayerOrClub(value: p0);
                            log(p0.toString());
                          },
                        ),
                        HomeScreenTapBar(
                          onTap: cubit.onTabChanged,
                        ),
                      ],
                    ),
                  ),
                ],
                body: HomeScreenTabBarView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
