import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';

class OrWithDivider extends StatelessWidget {
  const OrWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.screenHeight * 0.03,
              horizontal: context.screenWidth * 0.02),
          child: Text("OR"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
