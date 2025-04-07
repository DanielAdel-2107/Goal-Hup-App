import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/app/my_app.dart';
import 'package:goal_hup/features/auth/forget_password/view_models/forget_password_cubit.dart';
import 'package:goal_hup/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:goal_hup/features/auth/sign_up/view_models/sign_up_cubit.dart';

extension AppExtensions on BuildContext {
  //features/auth/cubit
  SignUpCubit get signUpCubit => read<SignUpCubit>();
  SignInCubit get signInCubit => read<SignInCubit>();
  double get screenWidth =>
      MediaQuery.of(navigatorKey.currentContext!).size.width;
  double get screenHeight =>
      MediaQuery.of(navigatorKey.currentContext!).size.height;
  ForgetPasswordCubit get forgetPasswordCubit => read<ForgetPasswordCubit>();

  // navigation
  void pushScreen(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementScreen(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushAndRemoveUntilScreen(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void popScreen() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popWithResult<T>(T result) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop(result);
    }
  }

  bool canPopScreen() {
    return Navigator.of(this).canPop();
  }
}
