import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:goal_hup/features/squad/home/views/widgets/player_card.dart';
import 'package:intl/intl.dart';

class PlayerDetails extends StatelessWidget {
  const PlayerDetails({
    super.key,
    required this.player,
  });
  final PlayerModel player;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            player.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.title18PrimaryColorW500,
          ),
          Text(
            getStarNumber(player.overallRating),
            style: AppTextStyles.title14PrimaryColorW400,
          ),
          Text(
            player.club,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.title14PrimaryColorW400,
          ),
          Text(
            "${calculateAge(player.dateOfBirth)} years old ",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.title14PrimaryColorW400,
          ),
        ],
      ),
    );
  }

}
  String getStarNumber(String rating) => (double.parse(rating) / 20).toString();
