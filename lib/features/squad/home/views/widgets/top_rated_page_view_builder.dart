import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:goal_hup/features/squad/home/views/widgets/top_rated_player_card.dart';

class TopRatedPageViewBuilder extends StatelessWidget {
  const TopRatedPageViewBuilder({
    super.key,
    this.onPageChanged,
    required this.currentPage,
    required this.pageController,
    required this.players,
  });

  final Function(int)? onPageChanged;
  final int currentPage;
  final PageController pageController;
  final List<PlayerModel> players;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.237,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: pageController,
        itemCount: (players.length/2).round(),
        itemBuilder: (context, index) {
          double scale = currentPage == index ? 1 : 0.8;
          return Transform.scale(
            scale: scale,
            child: TopRatedPlayerCard(
              player: players[index],
            ),
          );
        },
      ),
    );
  }
}
