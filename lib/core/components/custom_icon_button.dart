import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed, this.color,
  });
  final IconData icon;
  final Function()? onPressed;
  final Color ?color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        color:color?? Colors.white,
        icon,
      ),
    );
  }
}
