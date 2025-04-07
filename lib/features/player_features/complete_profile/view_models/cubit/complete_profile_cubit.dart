import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:goal_hup/core/helper/pick_image_or_file.dart';
import 'package:goal_hup/core/network/supabase/database/add_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());

  final supabase = getIt<SupabaseClient>();
  Uint8List? image;
  final imageName = Uuid().v4();
  String? imagePath;
  Future uploadToSupabase() async {
    if (image == null) return null;
    try {
      await supabase.storage.from('images').uploadBinary(imageName, image!);
      imagePath = supabase.storage.from('images').getPublicUrl(imageName);
    } catch (e) {
      return null;
    }
  }

  pickImage({required BuildContext context}) async {
    emit(UploadImageLoading());
    pickFile(
      context: context,
      onSuccess: (file) async {
        Uint8List fileBytes = await file.readAsBytes();
        emit(UploadImageSuccess(imageUrl: fileBytes));
        image = fileBytes;
      },
      onError: (error) => emit(UploadImageError(errorMessage: error)),
    );
  }

  //
  final fullNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final nationalityController = TextEditingController(text: 'Egypt');
  final playerHeightController = TextEditingController();
  final playerWeightController = TextEditingController();
  final clubNameController = TextEditingController();
  final overallRatioController = TextEditingController();
  List<String> preferredFoot = [];
  List<String> positions = [];

  final formKey = GlobalKey<FormState>();
  addPlayerInformation() async {
    if (formKey.currentState!.validate() &&
        image != null &&
        positions.isNotEmpty &&
        preferredFoot.isNotEmpty &&
        playerHeightController.text.isNotEmpty &&
        playerWeightController.text.isNotEmpty &&
        overallRatioController.text.isNotEmpty &&
        positions.isNotEmpty &&
        preferredFoot.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty &&
        nationalityController.text.isNotEmpty) {
      try {
        emit(CompleteProfileLoading());
        await uploadToSupabase();
        await addData(tableName: "players", data: {
          'id': supabase.auth.currentUser?.id ??
              "3d58165e-2c5b-4fb8-9b9b-fe45d04d4cdd",
          'full_name': fullNameController.text,
          'current_club': clubNameController.text,
          'overall_rating': overallRatioController.text,
          'height': playerHeightController.text,
          'weight': playerWeightController.text,
          'preferred_foot': {"foot": preferredFoot},
          'image': imagePath,
          'primary_position': {"positions": positions},
          'date_of_birth': dateOfBirthController.text,
          'nationality': nationalityController.text,
        });
        emit(CompleteProfileSuccess());
      } on Exception catch (e) {
       emit(CompleteProfileFailed(errorMessage: e.toString()));
      }
    } else {
      emit(EmptyFieldRequired());
    }
  }
}
