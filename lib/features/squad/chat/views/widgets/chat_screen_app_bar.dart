import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/custom_icon_button.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/screens/complete_profile_screen.dart';

class ChatscreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatscreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Chat",
        style: AppTextStyles.title24PrimaryColorW500,
      ),
      leading: CustomIconButton(
        icon: Icons.arrow_back_ios,
        color: AppColors.kPrimaryColor,
        onPressed: () {
          context.popScreen();
        },
      ),
      actions: [
        CustomIconButton(
          icon: Icons.call,
          color: AppColors.kPrimaryColor,
        ),
        CustomIconButton(
          icon: Icons.video_chat_rounded,
          color: AppColors.kPrimaryColor,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
