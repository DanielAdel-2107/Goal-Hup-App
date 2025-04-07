import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/network/supabase/database/get_stream_data_with_spacific_id.dart';
import 'package:goal_hup/features/squad/player_in_chating/models/chating_player_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'player_in_chating_state.dart';

class PlayerInChatingCubit extends Cubit<PlayerInChatingState> {
  PlayerInChatingCubit() : super(PlayerInChatingLoading()){
    _loadPlayerInChating();
  }
  StreamSubscription? _streamSubscription;
  List<ChatingPlayerModel> chatingPlayer = [];
  _loadPlayerInChating() {
    _streamSubscription = streamDataWithSpecificId(
            tableName: "chats",
            id: getIt<SupabaseClient>().auth.currentUser!.id,
            primaryKey: 'squad_id')
        .listen(
      (player) {
        if (player.isNotEmpty) {
          chatingPlayer =
              player.map((e) => ChatingPlayerModel.fromJson(e)).toList();
          emit(PlayerInChatingSuccess(chatingPlayer: chatingPlayer));
        } else {
          emit(PlayerInChatingEmpty());
        }
      },
      onError: (error) {
        emit(PlayerInChatingFailure(errorMessage: error.toString()));
      },
    );
  }
}
