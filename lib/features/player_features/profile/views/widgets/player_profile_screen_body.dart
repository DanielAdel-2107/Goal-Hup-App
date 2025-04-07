import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/player_features/profile/views/widgets/triple_bottom_wave_painter.dart';
import 'package:goal_hup/features/player_features/profile/views/widgets/user_details_card.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:goal_hup/features/squad/home/views/widgets/player_card.dart';

class PlayerProfileScreenBody extends StatelessWidget {
  const PlayerProfileScreenBody({
    super.key,
    required this.player,
  });
  final PlayerModel player;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.2,
            width: double.infinity,
            child: CustomPaint(
              painter: TripleBottomWavePainter(),
            ),
          ),
          Center(
            child: CircleAvatar(
              radius: context.screenWidth * 0.2,
              backgroundImage: NetworkImage(player.image),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.03,
            ),
            child: Column(
              spacing: context.screenHeight * 0.01,
              children: [
                UserDetailsCard(
                  title: "Name",
                  value: player.name,
                ),
                UserDetailsCard(
                  title: "Overall rating",
                  value: player.overallRating,
                ),
                UserDetailsCard(
                  title: "Country",
                  value: player.nationality,
                ),
                UserDetailsCard(
                  title: "Preferd foot",
                  value: List.generate(
                          player.preferrdFoot.length,
                          (index) =>
                              "${index > 0 ? "\n" : ""}${index + 1}. ${player.preferrdFoot[index]}")
                      .join(" "),
                ),
                UserDetailsCard(
                  title: "Positions",
                  value: List.generate(
                          player.positions.length,
                          (index) =>
                              "${index > 0 ? "\n" : ""}${index + 1}. ${player.positions[index]}")
                      .join(" "),
                ),
                UserDetailsCard(
                  title: "Age",
                  value: calculateAge(player.dateOfBirth).toString(),
                ),
                UserDetailsCard(
                  title: "Height",
                  value: player.height,
                ),
                UserDetailsCard(
                  title: "Weight",
                  value: player.weight,
                ),
                UserDetailsCard(
                  title: "Current club",
                  value: player.club,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
