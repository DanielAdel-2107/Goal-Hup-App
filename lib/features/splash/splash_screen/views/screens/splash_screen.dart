import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/splash/splash_screen/views/widgets/splash_screen_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      final supabase = getIt<SupabaseClient>();
      if (supabase.auth.currentUser == null) {
        await Future.delayed(const Duration(seconds: 4));
        context.pushReplacementScreen(RouteNames.onBoardingScreen);
        return;
      }
      final response = await supabase
          .from("users")
          .select()
          .eq("id", supabase.auth.currentUser!.id)
          .single();

      switch (response["role"]) {
        case "Football player":
          var data = await supabase
              .from("players")
              .select()
              .eq("id", supabase.auth.currentUser!.id)
              .maybeSingle();
          if (data != null) {
            context.pushReplacementScreen(RouteNames.showRequestScreen);
          } else {
            context.pushReplacementScreen(RouteNames.completeProfileScreen,arguments: RouteNames.signInScreen);
          }
          break;
        case "Recruitment manager":
          context.pushReplacementScreen(RouteNames.homeScreen);
          break;
        default:
          context.pushReplacementScreen(RouteNames.onBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashScreenBody(),
    );
  }
}
