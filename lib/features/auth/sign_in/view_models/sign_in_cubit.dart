import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/cache/cache_helper.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final supabase = getIt<SupabaseClient>();
  PlayerModel? player;
  String route = "";
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        await signInWithPassword(
            email: emailController.text, password: passwordController.text);
        await getHomeScreen();
        if (route == RouteNames.completeProfileScreen) {
          emit(CompleteProfile(routeName: route));
        } else {
          emit(SignInSuccess(routeName: route));
        }
      } on Exception catch (e) {
        emit(SignInFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<void> getHomeScreen() async {
    try {
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
            player = PlayerModel.fromJson(data);
            await getIt<CacheHelper>().saveUserModel(player!);
            await getIt<CacheHelper>().saveData(key: "isPlayer", value: true);
            route = RouteNames.showRequestScreen;
          } else {
            route = RouteNames.completeProfileScreen;
          }
          break;
        case "Recruitment manager":
          route = RouteNames.homeScreen;
          await getIt<CacheHelper>().saveData(key: "isPlayer", value: false);

          break;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
