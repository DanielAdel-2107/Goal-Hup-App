import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/squad/player_in_chating/models/chating_player_model.dart';

class RequestListTile extends StatelessWidget {
  const RequestListTile({
    super.key,
    required this.chatingPlayerModel,
  });

  final ChatingPlayerModel chatingPlayerModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.screenHeight * 0.01,
      ),
      child: ListTile(
        onTap: () {
          context.pushScreen(
            RouteNames.chatScreen,
            arguments: chatingPlayerModel.id,
          );
        },
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
          vertical: context.screenHeight * 0.01,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.kPrimaryColor),
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.kPrimaryColor,
          radius: context.screenWidth * 0.07,
          child: Text(
            "P",
            style: AppTextStyles.title20WhiteBold,
          ),
        ),
        title: Text(
          chatingPlayerModel.squadName,
          style: AppTextStyles.title18PrimaryColorW500,
        ),
        trailing: Icon(Icons.chat, color: AppColors.kPrimaryColor),
      ),
    );
  }
}
