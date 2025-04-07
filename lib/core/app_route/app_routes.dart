import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/features/auth/forget_password/views/screens/forget_password_screen.dart.dart';
import 'package:goal_hup/features/auth/sign_in/views/screens/sign_in_screen.dart';
import 'package:goal_hup/features/auth/sign_up/views/screens/sign_up_screen.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/screens/complete_profile_screen.dart';
import 'package:goal_hup/features/player_features/profile/views/screens/profile_screen_body.dart';
import 'package:goal_hup/features/player_features/show_squad_request/views/screens/show_squad_request_screen.dart';
import 'package:goal_hup/features/splash/on_boarding_screen/view/screens/on_boarding_screen.dart';
import 'package:goal_hup/features/splash/splash_screen/views/screens/splash_screen.dart';
import 'package:goal_hup/features/squad/chat/views/screens/chat_screen.dart';
import 'package:goal_hup/features/squad/home/views/screens/home_screen.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.forgetPasswordScreen: (context) => const ForgetPasswordScrren(),
    RouteNames.completeProfileScreen: (context) =>
        const CompleteProfileScreen(),
    RouteNames.homeScreen: (context) => HomeScreen(),
    RouteNames.chatScreen: (context) => ChatScreen(),
    RouteNames.playerInChatingScreen: (context) => PlayerInChatingScreen(),
    RouteNames.showRequestScreen: (context) => ShowSquadRequestScreen(),
    RouteNames.playerProfileScreen: (context) => PlayerProfileScreen(),
  };
}
