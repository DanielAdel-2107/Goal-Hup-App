import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/components/custom_elevated_button.dart';
import 'package:goal_hup/core/components/custom_text_form_field_with_title.dart';
import 'package:goal_hup/core/helper/show_custom_dialog.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:goal_hup/features/auth/sign_in/views/widgets/forget_password.dart';
import 'package:goal_hup/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:goal_hup/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.03,
            vertical: context.screenHeight * 0.03),
        child: Center(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => SignInCubit(),
              child: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    context.pushAndRemoveUntilScreen(state.routeName);
                    showCustomDialog(
                        title: "Success",
                        description: "Sign Up Successfully",
                        dialogType: DialogType.success);
                  }
                  if (state is CompleteProfile) {
                    context.pushAndRemoveUntilScreen(state.routeName,
                        arguments: RouteNames.showRequestScreen);
                    showCustomDialog(
                        title: "Info",
                        description: "Complete Profile To Continue",
                        dialogType: DialogType.info);
                  }
                  if (state is SignInFailure) {
                    showCustomDialog(
                        title: "Failure",
                        description: state.errorMessage,
                        dialogType: DialogType.error);
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return CustomLoading();
                  }
                  return Form(
                    key: context.signInCubit.formKey,
                    child: Column(
                      children: [
                        CustomTitle(title: "Sign In"),
                        SizedBox(
                          height: context.screenHeight * 0.07,
                        ),
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter Your Email",
                          title: "Email",
                          controller: context.signInCubit.emailController,
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.02,
                        ),
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter Your Password",
                          title: "Password",
                          isPassword: true,
                          controller: context.signInCubit.passwordController,
                        ),
                        ForgetPassword(
                          onPressed: () {
                            context.pushScreen(RouteNames.forgetPasswordScreen);
                          },
                        ),
                        state is SignInLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.kPrimaryColor,
                              ))
                            : Row(
                                children: [
                                  Expanded(
                                    child: CustomElevatedButton(
                                      name: "Sign In",
                                      onPressed: () {
                                        context.signInCubit.signIn();
                                      },
                                      backgroundColor: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: context.screenHeight * 0.02,
                        ),
                        HaveAccountOrNot(
                          btnName: "Sign Up",
                          title: "Don't have an account ?",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.signUpScreen,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
