import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/cache/cache_helper.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreenBody(),
      floatingActionButton:
          getIt<CacheHelper>().getData(key: "isPlayer") == true
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    context.pushScreen(RouteNames.playerInChatingScreen);
                  },
                  backgroundColor: AppColors.kPrimaryColor,
                  child: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                ),
    );
  }
}
