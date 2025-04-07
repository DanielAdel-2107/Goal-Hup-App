import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/assets/lotties/app_lotties.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_widget.dart';

class WelcomeAppConcept extends StatelessWidget {
  const WelcomeAppConcept({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingWidget(
      image: AppLotties.welcomeLottie,
      title: "Welcome to GOAL HUB!",
      description:
          "Join the ultimate professional platform connecting football players and club recruitment managers. Start your journey now!",
    );
  }
}
