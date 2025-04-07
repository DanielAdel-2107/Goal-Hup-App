import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:goal_hup/core/app_route/route_names.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/network/supabase/database/add_data.dart';
import 'package:goal_hup/core/network/supabase/database/get_stream_data.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/features/squad/home/models/player_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'get_all_player_state.dart';

class GetAllPlayerCubit extends Cubit<GetAllPlayerState> {
  GetAllPlayerCubit() : super(GetAllPlayerLoading()) {
    getAllPlayers();
  }

  int currentPage = 1;
  int selectedTabIndex = 0;
  final PageController pageController =
      PageController(viewportFraction: 0.34, initialPage: 1);

  onChanged(int index) {
    currentPage = index;
    safeEmit(PageChanged());
  }

  onTabChanged(int index) {
    selectedTabIndex = index;
    safeEmit(TabChanged());
    log(selectedTabIndex.toString());
  }

  //! get players
  StreamSubscription? _streamSubscription;
  List<PlayerModel> players = [];

  getAllPlayers() async {
    _streamSubscription = streamData(
      tableName: "players",
    ).listen(
      (event) {
        if (event.isNotEmpty) {
          players = event.map((data) => PlayerModel.fromJson(data)).toList();
          getTopRatedPlayer();
          getPositionPlayer();
          safeEmit(GetAllPlayerSuccess());
        } else {
          safeEmit(GetAllPlayerEmpty());
        }
      },
      onError: (e) async {
        log("Stream error: $e");

        if (isClosed) return;

        safeEmit(GetAllPlayerLoading());

        await Future.delayed(const Duration(seconds: 2));

        if (!isClosed) {
          getAllPlayers(); // إعادة الاشتراك
        }
      },
    );
  }

  //! get top rated
  List<PlayerModel> topRatedPlayer = [];
  getTopRatedPlayer() {
    topRatedPlayer = List.from(players);
    topRatedPlayer.sort(
      (a, b) => double.parse(b.overallRating)
          .compareTo(double.parse(a.overallRating)),
    );
  }

  //! get position-based players
  List<PlayerModel> playerByPosition = [];
  getPositionPlayer() {
    playerByPosition = List.from(players);
    playerByPosition.sort(
      (a, b) {
        String aValue = a.positions.first;
        String bValue = b.positions.first;
        return bValue.compareTo(aValue);
      },
    );
  }

  //! search
  List<PlayerModel>? searchPlayers;
  searchForPlayerOrClub({required String value}) {
    List<PlayerModel> sourceList = [];
    if (selectedTabIndex == 0) {
      sourceList = players;
    } else if (selectedTabIndex == 1) {
      sourceList = topRatedPlayer;
    } else if (selectedTabIndex == 2) {
      sourceList = playerByPosition;
    }
    searchPlayers = sourceList.where((player) {
      return player.name.toLowerCase().contains(value.toLowerCase()) ||
          player.club.toLowerCase().contains(value.toLowerCase());
    }).toList();
    safeEmit(SearchChanged());
  }

  //! open chat
  openChat({
    required String playerId,
    required BuildContext context,
    required String playerName,
    required String playerImage,
  }) async {
    final supabase = getIt<SupabaseClient>();
    final currentUser = supabase.auth.currentUser!;
    final response = await supabase
        .from("users")
        .select()
        .eq("id", currentUser.id)
        .single();
    await addData(
      tableName: "chats",
      data: {
        'id': playerId + currentUser.id,
        "player_id": playerId,
        "squad_id": currentUser.id,
        "player_name": playerName,
        "player_image": playerImage,
        "squad_name": response["name"],
      },
    );
    context.pushScreen(RouteNames.chatScreen,
        arguments: playerId + currentUser.id);
  }

  //! sign out
  signOut() async {
    try {
      safeEmit(SignOutLoading());
      await getIt<SupabaseClient>().auth.signOut();
      safeEmit(SignOutSuccess());
    } on Exception catch (e) {
      safeEmit(SignOutFailure(errorMessage: e.toString()));
    }
  }

  //! helper to emit safely
  void safeEmit(GetAllPlayerState state) {
    if (!isClosed) emit(state);
  }

  //! cancel stream on dispose
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
