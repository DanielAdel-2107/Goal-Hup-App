import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/assets/lotties/app_lotties.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_widget.dart';

class FastEfficientCommunication extends StatelessWidget {
  const FastEfficientCommunication({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingWidget(
      image: AppLotties.findPlayerLpttie,
      title: "Find the Best Talent with Ease!",
      description:
          "Discover skilled players, filter results based on performance and experience, and start the recruitment process with just one click!",
    );
  }
}
