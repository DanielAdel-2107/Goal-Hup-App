import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';

class PlayerImage extends StatelessWidget {
  const PlayerImage({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Image.network(
        image,
        fit: BoxFit.fill,
        height: context.screenHeight * 0.12,
        width: context.screenWidth * 0.34,
      ),
    );
  }
}
