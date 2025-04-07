part of 'show_squad_request_cubit.dart';

sealed class ShowSquadRequestState {}

final class ShowSquadRequestInitial extends ShowSquadRequestState {}

final class ShowSquadRequestLoading extends ShowSquadRequestState {}

final class ShowSquadRequestEmpty extends ShowSquadRequestState {}

final class ShowSquadRequestSuccess extends ShowSquadRequestState {
  final List<ChatingPlayerModel> chatingPlayer;

  ShowSquadRequestSuccess({required this.chatingPlayer});
}

final class ShowSquadRequestFailure extends ShowSquadRequestState {
  final String errorMessage;

  ShowSquadRequestFailure({required this.errorMessage});
}
// sign out state
final class SignOutLoading extends ShowSquadRequestState {}

final class SignOutSuccess extends ShowSquadRequestState {}

final class SignOutFailure extends ShowSquadRequestState {
  final String errorMessage;

  SignOutFailure({required this.errorMessage});
}
