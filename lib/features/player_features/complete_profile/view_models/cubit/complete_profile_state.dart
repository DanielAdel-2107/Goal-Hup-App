part of 'complete_profile_cubit.dart';

sealed class CompleteProfileState {}

final class CompleteProfileInitial extends CompleteProfileState {}

final class UploadImageLoading extends CompleteProfileState {}

final class UploadImageSuccess extends CompleteProfileState {
  final Uint8List imageUrl;

  UploadImageSuccess({required this.imageUrl});
}

final class UploadImageError extends CompleteProfileState {
  final String errorMessage;

  UploadImageError({required this.errorMessage});
}
final class EmptyFieldRequired extends CompleteProfileState {}
final class CompleteProfileLoading extends CompleteProfileState {}
final class CompleteProfileSuccess extends CompleteProfileState {}
final class CompleteProfileFailed extends CompleteProfileState {
  final String errorMessage;

  CompleteProfileFailed({required this.errorMessage});
}
