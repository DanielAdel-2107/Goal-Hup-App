part of 'player_in_chating_cubit.dart';

sealed class PlayerInChatingState {}

final class PlayerInChatingInitial extends PlayerInChatingState {}
final class PlayerInChatingLoading extends PlayerInChatingState {}
final class PlayerInChatingEmpty extends PlayerInChatingState {}

final class PlayerInChatingSuccess extends PlayerInChatingState {
final    List<ChatingPlayerModel> chatingPlayer;

  PlayerInChatingSuccess({required this.chatingPlayer});

}
final class PlayerInChatingFailure extends PlayerInChatingState {
  final String errorMessage;

 PlayerInChatingFailure({required this.errorMessage });
}
