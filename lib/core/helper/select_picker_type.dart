import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/image_type.dart';

AlertDialog selectPickerType(
    {required BuildContext context,
    required Function()? onTapGallery,
    required Function()? onTapCamera}) {
  return AlertDialog(
    title: Text("Select Image"),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageType(
            icon: Icons.camera_alt_outlined,
            title: "Camera",
            onTap: onTapCamera,
          ),
          ImageType(
            icon: Icons.image,
            title: "Gallery",
            onTap: onTapGallery,
          ),
        ],
      )
    ],
  );
}