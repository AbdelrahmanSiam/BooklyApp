import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBookActionButton extends StatelessWidget {
  const CustomBookActionButton(
      {super.key,
      required this.child,
      required this.shape,
      required this.backgroundColor,
      this.onPressed});
  final Widget child;
  final OutlinedBorder shape;
  final Color backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 55,
        child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                backgroundColor: backgroundColor, shape: shape),
            child: child),
      ),
    );
  }
}
