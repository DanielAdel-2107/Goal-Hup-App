import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:goal_hup/core/utilies/assets/images/app_images.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight * 0.6,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: context.screenWidth * 0.035,
                  right: -context.screenWidth * 0.05,
                  child: Image.asset(
                    AppImages.moSalaahImage,
                    height: context.screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ).animate(delay: Duration(milliseconds: 1300)).slideX(
                      begin: 1.5,
                      end: 0,
                      duration: 800.ms,
                      curve: Curves.easeOut),
                ),
                const SizedBox(width: 20),
                Positioned(
                  left: context.screenWidth * 0.05,
                  top: context.screenHeight * 0.3,
                  child: Image.asset(
                    AppImages.marmoushImage,
                    height: context.screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ).animate(delay: Duration(milliseconds: 300)).slideX(
                        begin: -1.5,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.easeOut,
                      ),
                ),
              ],
            ),
          ),
          CustomLoading(
            width: context.screenWidth *0.3,
          )
        ],
      ),
    );
  }
}
