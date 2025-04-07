import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:goal_hup/features/squad/home/views/widgets/player_details.dart';
import 'package:goal_hup/features/squad/home/views/widgets/player_image.dart';

class TopRatedPlayerCard extends StatelessWidget {
  const TopRatedPlayerCard({super.key, required this.player});
  final PlayerModel player;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushScreen(RouteNames.playerProfileScreen,
            arguments: player.toJson());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.005,
        ),
        height: context.screenHeight * 0.15,
        width: context.screenWidth * 0.34,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayerImage(image: player.image),
            PlayerDetails(
              player: player,
            ),
          ],
        ),
      ),
    );
  }
}
