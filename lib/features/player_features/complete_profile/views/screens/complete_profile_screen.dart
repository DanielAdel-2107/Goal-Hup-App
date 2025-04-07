import 'package:flutter/material.dart';
import 'package:goal_hup/features/player_features/complete_profile/views/widgets/complete_profiel_screen_body.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: CompleteProfileScreenBody(
          route: args,
        ),
      ),
    );
  }
}
