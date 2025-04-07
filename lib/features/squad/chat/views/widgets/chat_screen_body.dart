import 'dart:developer';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/components/custom_icon_button.dart';
import 'package:goal_hup/core/components/custom_text_form_field.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:goal_hup/features/squad/chat/view_models/cubit/chat_cubit.dart';
import 'package:goal_hup/features/squad/player_in_chating/views/screens/player_in_chating_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(id: id),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var cubit = context.read<ChatCubit>();
          if (state is ChatLoading) {
            return CustomLoading();
          }
          if (state is ChatLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: context.screenHeight * 0.02,
                    ),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: context.screenHeight * 0.01),
                        child: BubbleSpecialThree(
                          text: state.messages[index].message,
                          color: state.messages[index].id !=
                                  getIt<SupabaseClient>().auth.currentUser!.id
                              ? Colors.black
                              : AppColors.kPrimaryColor,
                          tail: true,
                          isSender: state.messages[index].id ==
                              getIt<SupabaseClient>().auth.currentUser!.id,
                          textStyle: AppTextStyles.title18White,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.08,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.03,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: cubit.messageController,
                            hintText: "Say something...",
                            hPadding: context.screenWidth * 0.02,
                            suffixIcon: CustomIconButton(
                              icon: Icons.send,
                              color: AppColors.kPrimaryColor,
                              onPressed: () {
                                cubit.addMessage();
                              },
                            ),
                          ),
                        ),
                        CustomIconButton(
                          icon: Icons.add,
                          color: AppColors.kPrimaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          if (state is ChatFailed) {}
          return Container();
        },
      ),
    );
  }
}
