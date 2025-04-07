// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:goal_hup/core/helper/image_picker.dart';
import 'package:goal_hup/core/helper/select_picker_type.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:image_picker/image_picker.dart';

Future<void> pickFile({
  required BuildContext context,
  required Function(XFile) onSuccess,
  required Function(String) onError,
}) async {
  try {
    XFile? selectedFile;
    await showDialog(
      context: context,
      builder: (context) => selectPickerType(
        context: context,
        onTapCamera: () async {
          selectedFile =
              await ImagePickerService.pickImage(source: ImageSource.camera);
          context.popScreen();
        },
        onTapGallery: () async {
          selectedFile =
              await ImagePickerService.pickImage(source: ImageSource.gallery);
          context.popScreen();
        },
      ),
    );
    if (selectedFile != null) {
      onSuccess(selectedFile!);
    } else {
      onError("No image selected");
    }
  } catch (e) {
    onError(e.toString());
  }
}
