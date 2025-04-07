import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:goal_hup/features/squad/home/views/widgets/player_card.dart';

class CustomPlayerListView extends StatelessWidget {
  const CustomPlayerListView({
    super.key, required this.players,
  });
  final List<PlayerModel> players;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.03,
        vertical: context.screenHeight * 0.02,
      ),
      itemBuilder: (context, index) {
        return PlayerCard(
          player: players[index],
        );
      },
    );
  }
}
