part of 'get_all_player_cubit.dart';

@immutable
sealed class GetAllPlayerState {}

final class GetAllPlayerInitial extends GetAllPlayerState {}

final class PageChanged extends GetAllPlayerState {}
final class SearchChanged extends GetAllPlayerState {}
final class TabChanged extends GetAllPlayerState {}

final class GetAllPlayerLoading extends GetAllPlayerState {}
final class GetAllPlayerEmpty extends GetAllPlayerState {}
final class GetAllPlayerSuccess extends GetAllPlayerState {}
final class GetAllPlayerFailed extends GetAllPlayerState {
  final String errorMessage;

  GetAllPlayerFailed({required this.errorMessage});
}
// sign out state
final class SignOutSuccess extends GetAllPlayerState {}
final class SignOutLoading extends GetAllPlayerState {}
final class SignOutFailure extends GetAllPlayerState {
  final String errorMessage;
  SignOutFailure({required this.errorMessage});
}
