import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/components/custom_gradiant_elevated_button.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:goal_hup/features/squad/home/view_models/cubit/get_all_player_cubit.dart';
import 'package:goal_hup/features/squad/home/views/widgets/player_details.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.player,
  });
  final PlayerModel player;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetAllPlayerCubit>();
    return GestureDetector(
      onTap: () {
        context.pushScreen(RouteNames.playerProfileScreen,
            arguments: player.toJson());
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: context.screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                player.image,
                fit: BoxFit.fill,
                width: context.screenWidth * 0.37,
                height: context.screenWidth * 0.35,
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.56,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.03,
                  vertical: context.screenHeight * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.name,
                      style: AppTextStyles.title20PrimaryColorW500,
                    ),
                    Text(
                      player.club,
                      style: AppTextStyles.title18PrimaryColorW500,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.screenHeight * 0.003,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "⭐ ${getStarNumber(player.overallRating)}",
                            style: AppTextStyles.title18PrimaryColorW500,
                          ),
                          Text(
                            "${calculateAge(player.dateOfBirth)} Years Old",
                            style: AppTextStyles.title18PrimaryColorW500,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomGradiantElevatedButton(
                                hPadding: context.screenWidth * 0.01,
                                wPadding: context.screenHeight * 0.02,
                                name: "Message",
                                onPressed: () {
                                  cubit.openChat(
                                    playerId: player.id,
                                    context: context,
                                    playerImage: player.image,
                                    playerName: player.name,
                                  );
                                },
                              ),
                        Text(
                          player.positions.first,
                          style: AppTextStyles.title18PrimaryColorW500,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

int calculateAge(String birthDateString) {
  DateTime birthDate = DateTime.parse(birthDateString);
  DateTime today = DateTime.now();

  int age = today.year - birthDate.year;

  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age;
}
