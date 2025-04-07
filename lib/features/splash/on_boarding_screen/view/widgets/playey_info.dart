import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/assets/lotties/app_lotties.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_widget.dart';

class ReadyForEmergencies extends StatelessWidget {
  const ReadyForEmergencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnBoardingWidget(
        image: AppLotties.playerSkillLottie,
        title: "📢 Showcase Your Skills & Shine on the Field!",
        description:
            "Create your profile, share your stats and highlight videos, and catch the attention of clubs looking for top talent!",
      ),
    );
  }
}
