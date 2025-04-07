import 'package:flutter/material.dart';
import 'package:goal_hup/core/components/custom_text_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(title: "Forget Password ?", onPressed: onPressed)
      ],
    );
  }
}
