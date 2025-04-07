import 'package:flutter/material.dart';
import 'package:goal_hup/features/squad/chat/views/widgets/chat_screen_app_bar.dart';
import 'package:goal_hup/features/squad/chat/views/widgets/chat_screen_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: ChatscreenAppBar(),
      body: ChatScreenBody(id: args!),
    );
  }
}



