import 'package:flutter/material.dart';

class SizedFillButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const SizedFillButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 48,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
