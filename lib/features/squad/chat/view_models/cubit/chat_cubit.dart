import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/network/supabase/database/get_stream_data_with_spacific_id.dart';
import 'package:goal_hup/features/squad/chat/models/chat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.id}) : super(ChatLoading()) {
    _loadMessages();
  }

  final String id;
  StreamSubscription? _streamSubscription;
  final supabase = getIt<SupabaseClient>();
  final messageController = TextEditingController();

  void _loadMessages() {
    _streamSubscription = streamDataWithSpecificId(
      tableName: "chats",
      id: id,
      primaryKey: 'id',
    ).listen(
      (data) {
        if (isClosed) return;
        if (data.isNotEmpty) {
          final dynamic messagesData = data.first['messages'];
          final List<dynamic> messagesJson =
              (messagesData is List) ? messagesData : [];
          final List<ChatMessage> messages =
              messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
          safeEmit(ChatLoaded(messages: messages));
          log(messages.toString());
        } else {
          safeEmit(ChatLoaded(messages: []));
        }
      },
      onError: (e) {
        if (isClosed) return;
        log("Stream error: $e");
        safeEmit(ChatFailed(error: e.toString()));
      },
    );
  }

  Future<void> addMessage() async {
    if (messageController.text.isNotEmpty) {
      try {
        final chatData = await supabase
            .from("chats")
            .select("messages")
            .eq("id", id)
            .single();

        if (isClosed) return;

        final dynamic messagesData = chatData['messages'];
        final List<dynamic> messagesJson =
            (messagesData is List) ? messagesData : [];
        final List<ChatMessage> messages =
            messagesJson.map((json) => ChatMessage.fromJson(json)).toList();

        final newMessage = ChatMessage(
          message: messageController.text,
          id: supabase.auth.currentUser!.id,
        );

        messages.add(newMessage);

        await supabase.from("chats").update({
          "messages": messages.map((m) => m.toJson()).toList(),
        }).eq("id", id);

        if (!isClosed) {
          messageController.clear();
          safeEmit(ChatLoaded(messages: messages));
        }
      } catch (e) {
        if (!isClosed) safeEmit(ChatFailed(error: e.toString()));
      }
    }
  }

  void safeEmit(ChatState state) {
    if (!isClosed) emit(state);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
