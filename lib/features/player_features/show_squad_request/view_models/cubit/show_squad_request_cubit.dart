import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/network/supabase/database/get_stream_data_with_spacific_id.dart';
import 'package:goal_hup/features/squad/player_in_chating/models/chating_player_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'show_squad_request_state.dart';

class ShowSquadRequestCubit extends Cubit<ShowSquadRequestState> {
  ShowSquadRequestCubit() : super(ShowSquadRequestLoading()) {
    _loadShowSquadRequest();
  }
  StreamSubscription? _streamSubscription;
  List<ChatingPlayerModel> chatingPlayer = [];
  _loadShowSquadRequest() {
    _streamSubscription?.cancel();
    _streamSubscription = streamDataWithSpecificId(
            tableName: "chats",
            id: getIt<SupabaseClient>().auth.currentUser!.id,
            primaryKey: 'player_id')
        .listen(
      (player) {
        if (player.isNotEmpty) {
          chatingPlayer =
              player.map((e) => ChatingPlayerModel.fromJson(e)).toList();
          emit(ShowSquadRequestSuccess(chatingPlayer: chatingPlayer));
        } else {
          emit(ShowSquadRequestEmpty());
        }
      },
      onError: (error) async {
        emit(ShowSquadRequestLoading());
        await Future.delayed(Duration(seconds: 2));
        _loadShowSquadRequest();
      },
    );
  }

  //! logout
  signOut() async {
    try {
      emit(SignOutLoading());
      await getIt<SupabaseClient>().auth.signOut();
      emit(SignOutSuccess());
    } on Exception catch (e) {
      emit(
        SignOutFailure(errorMessage: e.toString()),
      );
    }
  }
}
