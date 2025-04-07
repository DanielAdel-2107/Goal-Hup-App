import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/view_models/cubit/get_all_player_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreemSmoothPageIndecator extends StatelessWidget {
  const HomeScreemSmoothPageIndecator({
    super.key,
    required this.cubit,
  });

  final GetAllPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.screenHeight * 0.01,
        top: context.screenHeight * 0.03,
      ),
      child: SmoothPageIndicator(
        controller: cubit.pageController,
        count: ((cubit.players.length) / 2).round(),
        effect: ScrollingDotsEffect(
          dotColor: Colors.grey.withOpacity(0.5),
          activeDotColor: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
