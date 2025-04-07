import 'package:flutter/material.dart';
import 'package:goal_hup/features/player_features/profile/views/widgets/player_profile_screen_body.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final player = PlayerModel.fromJson(args);
    return Scaffold(
      body: PlayerProfileScreenBody(
        player: player,
      ),
    );
  }
}


