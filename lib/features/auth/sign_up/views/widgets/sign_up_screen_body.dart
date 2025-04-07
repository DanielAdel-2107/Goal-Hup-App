import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/components/custom_elevated_button.dart';
import 'package:goal_hup/core/components/custom_text_form_field_with_title.dart';
import 'package:goal_hup/core/helper/show_custom_dialog.dart';
import 'package:goal_hup/core/utilies/assets/lotties/app_lotties.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:goal_hup/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:goal_hup/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:goal_hup/features/auth/sign_up/views/widgets/phone_number.dart';
import 'package:goal_hup/features/auth/sign_up/views/widgets/slelct_role.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';
import 'package:lottie/lottie.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
            vertical: MediaQuery.sizeOf(context).height * 0.02),
        child: Center(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => SignUpCubit(),
              child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    context.popScreen();
                    showCustomDialog(
                        title: "Success",
                        description: "Sign Up Successfully",
                        dialogType: DialogType.success);
                  }
                  if (state is SignUpSuccessFootBallPlayer) {
                    context.pushReplacementScreen(
                        RouteNames.completeProfileScreen,
                        arguments: RouteNames.signInScreen);
                    showCustomDialog(
                        title: "Success",
                        description: "Sign Up Successfully",
                        dialogType: DialogType.success);
                  }
                  if (state is SignUpFailure) {
                    showCustomDialog(
                        title: "Failure",
                        description: state.errorMessage,
                        dialogType: DialogType.error);
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return CustomLoading();
                  }
                  return Form(
                    key: context.signUpCubit.formKey,
                    child: Column(
                      spacing: context.screenHeight * 0.005,
                      children: [
                        CustomTitle(
                          title: "Sign Up",
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.01,
                        ),
                        Row(
                          spacing: context.screenWidth * 0.05,
                          children: [
                            Expanded(
                              child: CustomTextFormFieldWithTitle(
                                hintText: "Enter Your Name",
                                title: "Frist Name",
                                controller:
                                    context.signUpCubit.fristNameController,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormFieldWithTitle(
                                hintText: "Enter Your Name",
                                title: "Last Name",
                                controller:
                                    context.signUpCubit.lastNameController,
                              ),
                            ),
                          ],
                        ),
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter Your Email",
                          title: "Email",
                          controller: context.signUpCubit.emailController,
                        ),
                        PhoneNumber(
                          controller: context.signUpCubit.phoneNumberController,
                        ),
                        SelectRole(
                          controller: context.signUpCubit.roleController,
                        ),
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter Your Password",
                          title: "Password",
                          isPassword: true,
                          controller: context.signUpCubit.passwordController,
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.005,
                        ),
                        state is SignUpLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.kPrimaryColor,
                              ))
                            : Row(
                                children: [
                                  Expanded(
                                    child: CustomElevatedButton(
                                        name: "Sign Up",
                                        backgroundColor: AppColors.kPrimaryColor,
                                        onPressed: () {
                                          context.signUpCubit.signUp();
                                        }),
                                  ),
                                ],
                              ),
                        HaveAccountOrNot(
                          btnName: "Sign In",
                          title: "have an account ?",
                          onPressed: () {
                            Navigator.pop(context);
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
