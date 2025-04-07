import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';

class HomeScreenTapBar extends StatelessWidget {
  const HomeScreenTapBar({
    super.key, this.onTap,
  });
  final  Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 0.00001,
      indicatorColor: AppColors.kPrimaryColor,
      labelStyle: AppTextStyles.title20PrimaryColorW500,
      unselectedLabelStyle: AppTextStyles.title20PrimaryColorWithOpacity,
      onTap: onTap,
      tabs: [
        Tab(
          text: "Popular",
        ),
        Tab(
          text: "Top rated ",
        ),
        Tab(
          text: "Position",
        ),
      ],
    );
  }
}
