import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/custom_smooth_page_indecator.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/recruitment_manager_info.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/next_and_skip_button.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/playey_info.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/widgets/welcome_app_concept.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
              vertical: context.screenHeight * 0.02),
          child: Column(
            spacing: context.screenHeight * 0.03,
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  controller: controller,
                  children: [
                    WelcomeAppConcept(),
                    FastEfficientCommunication(),
                    ReadyForEmergencies(),
                  ],
                ),
              ),
              CustomSmoothPageIndicator(
                controller: controller,
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCirc,
                ),
              ),
              NextAndSkipButton(
                backActive: currentPage != 0,
                onPressedBack: () => controller.previousPage(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 500),
                ),
                onPressedNext: () {
                  if (currentPage != 2) {
                    controller.nextPage(
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 500),
                    );
                  } else {
                    context.pushReplacementScreen(RouteNames.signInScreen);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
